local function cor(valor)
    local c = { valor = valor }

    function c:modo_kakoune()
        self.__tostring = function()
            if self.valor == "nenhuma" then
                return "default"
            end

            local format = self.valor > 0xffffff and "rgba:%08x" or "rgb:%06x"
            return string.format(format, self.valor)
        end
    end

    function c:modo_fish()
        self.__tostring = function()
            if self.valor == "nenhuma" then
                return ""
            end

            local valor = self.valor > 0xffffff and self.valor // 0x100 or self.valor
            return string.format("%06x", valor)
        end
    end

    function c:saturado(factor)
        local comando = string.format(
            "pastel saturate %f %06x | pastel format",
            factor,
            self.valor
        )
        local saturada = io.popen(comando):read("a"):gsub("#", "0x")
        return cor(tonumber(saturada))
    end

    function c:dessaturado(factor)
        local comando = string.format(
            "pastel desaturate %f %06x | pastel format",
            factor,
            self.valor
        )
        local dessaturada = io.popen(comando):read("a"):gsub("#", "0x")
        return cor(tonumber(dessaturada))
    end

    function c:claro(factor)
        local comando = string.format(
            "pastel lighten %f %06x | pastel format",
            factor,
            self.valor
        )
        local clara = io.popen(comando):read("a"):gsub("#", "0x")
        return cor(tonumber(clara))
    end

    function c:escuro(factor)
        local comando = string.format(
            "pastel darken %f %06x | pastel format",
            factor,
            self.valor
        )
        local escura = io.popen(comando):read("a"):gsub("#", "0x")
        return cor(tonumber(escura))
    end

    return setmetatable(c, c)
end

local function atributo(valor)
    local atrib = { valor = valor }

    function atrib:modo_kakoune()
        local kakoune = {
            sublinhado = "u",
            negrito = "b",
            italico = "i",
            inverso = "r"
        }

        self.__tostring = function() return kakoune[self.valor] end
    end

    function atrib:modo_fish()
        local fish = {
            sublinhado = "--underline",
            negrito = "--bold",
            italico = "--underline",
            inverso = "--reverse"
        }

        self.__tostring = function() return fish[self.valor] end
    end

    return setmetatable(atrib, atrib)
end

local function atributos(lista)
    function lista:modo_kakoune()
        for _, atributo in ipairs(self) do
            atributo:modo_kakoune()
        end

        self.__tostring = function()
            if #self == 0 then
                return ""
            end

            local elementos = {}

            for i, elemento in ipairs(self) do
                elementos[i] = tostring(elemento)
            end

            return "+" .. table.concat(elementos)
        end
    end

    function lista:modo_fish()
        for _, atributo in ipairs(self) do
            atributo:modo_fish()
        end

        self.__tostring = function()
            if #self == 0 then
                return ""
            end

            local elementos = {}

            for i, elemento in ipairs(self) do
                elementos[i] = tostring(elemento)
            end

            return table.concat(elementos, " ")
        end
    end

    return setmetatable(lista, lista)
end

local function elemento(spec)
    spec.fundo = spec.fundo or cor "nenhuma"
    spec.letra = spec.letra or cor "nenhuma"
    spec.sublinhado = spec.sublinhado or cor "nenhuma"
    spec.atributos = spec.atributos and atributos(spec.atributos) or atributos {}

    function spec:modo_kakoune()
        self.fundo:modo_kakoune()
        self.letra:modo_kakoune()
        self.sublinhado:modo_kakoune()
        self.atributos:modo_kakoune()

        self.__tostring = function()
            return string.format("%s,%s,%s%s", self.letra, self.fundo, self.sublinhado, self.atributos)
        end
    end

    function spec:modo_fish()
        self.fundo:modo_fish()
        self.letra:modo_fish()
        self.atributos:modo_fish()

        self.__tostring = function()
            self.fundo = #self.fundo > 0 and " --background=" .. self.fundo or ""
            return string.format("%s %s%s", self.letra, self.atributos, self.fundo)
        end
    end

    return setmetatable(spec, spec)
end

local function estilo(elementos)
    local e = { elementos = elementos }

    function e.modo_kakoune()
        for _, elem in pairs(elementos) do
            elem:modo_kakoune()
        end
    end

    function e.modo_fish()
        for _, elem in pairs(elementos) do
            elem:modo_fish()
        end
    end

    return e
end

local function azul(cor)
    return tostring(cor.valor % 256)
end

local function verde(cor)
    return tostring(math.floor(cor.valor / 256) % 256)
end

local function vermelho(cor)
    return tostring(math.floor(cor.valor / 65536) % 256)
end

local function konsole(cores)
    io.input "konsole.template"
    io.output "colors/Garbo.colorscheme"

    local template = io.read("a")

    for nome, cor in pairs(cores) do
        template = template:gsub("$" .. nome .. "_r%f[^%w_]", vermelho(cor))
        template = template:gsub("$" .. nome .. "_g%f[^%w_]", verde(cor))
        template = template:gsub("$" .. nome .. "_b%f[^%w_]", azul(cor))
    end

    io.write(template)
end

local function kakoune(estilo)
    io.input "kak.template"
    io.output "colors/garbo.kak"

    local template = io.read("a")
    estilo:modo_kakoune()

    for nome, elem in pairs(estilo.elementos) do
        template = template:gsub("$" .. nome .. "%f[^%w_]", tostring(elem))
    end

    io.write(template)
end

local function fish(estilo)
    io.input "fish.template"
    io.output "colors/garbo.fish"

    local template = io.read("a")
    estilo:modo_fish()

    for nome, elem in pairs(estilo.elementos) do
        template = template:gsub("$" .. nome .. "%f[^%w_]", tostring(elem))
    end

    io.write(template)
end



return {
    cor = cor,
    atributo = atributo,
    elemento = elemento,
    estilo = estilo,
    konsole = konsole,
    kakoune = kakoune,
    fish = fish,
}
