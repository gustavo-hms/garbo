function cor(valor)
    local c = { valor = valor }

    function c:modo_vim()
        self.__tostring = function()
            if self.valor == "nenhuma" then
                return "NONE"
            end

            -- Deal with transparency
            local valor = self.valor > 0xffffff and self.valor // 0x100 or self.valor
            return string.format("#%06x", valor)
        end
    end

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

    return setmetatable(c, c)
end

function atributo(valor)
    local atrib = { valor = valor }

    function atrib:modo_vim()
        local vim = {
            sublinhado = "underline",
            negrito = "bold",
            italico = "italic",
            inverso = "reverse"
        }

        self.__tostring = function() return vim[self.valor] end
    end

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

function atributos(lista)
    function lista:modo_vim()
        for _, atributo in ipairs(self) do
            atributo:modo_vim()
        end

        self.__tostring = function()
            if #self == 0 then
                return "NONE"
            end

            local elementos = {}

            for i, elemento in ipairs(self) do
                elementos[i] = tostring(elemento)
            end

            return table.concat(elementos, ",")
        end
    end

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

function elemento(spec)
    spec.fundo = spec.fundo or cor "nenhuma"
    spec.letra = spec.letra or cor "nenhuma"
    spec.sublinhado = spec.sublinhado or cor "nenhuma"
    spec.atributos = spec.atributos and atributos(spec.atributos) or atributos {}

    function spec:modo_vim()
        self.fundo:modo_vim()
        self.letra:modo_vim()
        self.atributos:modo_vim()

        self.__tostring = function()
            return string.format("guibg=%s guifg=%s gui=%s", self.fundo, self.letra, self.atributos)
        end
    end

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

function estilo(elementos)
    local e = { elementos = elementos }

    function e.modo_vim()
        for _, elem in pairs(elementos) do
            elem:modo_vim()
        end
    end

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

return {
    cor = cor,
    atributo = atributo,
    elemento = elemento,
    estilo = estilo,
}
