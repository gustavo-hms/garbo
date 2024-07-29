local Cor = {}

local function cor(valor)
    return setmetatable({ valor = valor }, { __index = Cor })
end

-- Gera uma representação textual da cor no formato do Kakoune
function Cor:kakoune()
    if not self.valor then
        return "default"
    end

    local format = self.valor > 0xffffff and "rgba:%08x" or "rgb:%06x"
    return string.format(format, self.valor)
end

-- Gera uma representação textual da cor no formato do fish
function Cor:fish()
    if not self.valor then
        return ""
    end

    local valor = self.valor > 0xffffff and self.valor // 0x100 or self.valor
    return string.format("%06x", valor)
end

-- Gera uma representação textual da cor no formato do Konsole
function Cor:konsole()
    if not self.valor then
        return ""
    end

    local vermelho = math.floor(self.valor / 65536) % 256
    local verde = math.floor(self.valor / 256) % 256
    local azul = self.valor % 256
    return string.format("%d,%d,%d", vermelho, verde, azul)
end

-- Cria uma versão da cor atual saturada pelo fator especificado (de 0 a 1)
function Cor:saturado(fator)
    local comando = string.format(
        "pastel saturate %f %06x | pastel format",
        fator,
        self.valor
    )
    local saturada = io.popen(comando):read("a"):gsub("#", "0x")
    return cor(tonumber(saturada))
end

-- Cria uma versão da cor atual dessaturada pelo fator especificado (de 0 a 1)
function Cor:dessaturado(fator)
    local comando = string.format(
        "pastel desaturate %f %06x | pastel format",
        fator,
        self.valor
    )
    local dessaturada = io.popen(comando):read("a"):gsub("#", "0x")
    return cor(tonumber(dessaturada))
end

-- Cria uma versão da cor atual com brilho aumentado segundo fator especificado (de 0 a 1)
function Cor:claro(fator)
    local comando = string.format(
        "pastel lighten %f %06x | pastel format",
        fator,
        self.valor
    )
    local clara = io.popen(comando):read("a"):gsub("#", "0x")
    return cor(tonumber(clara))
end

-- Cria uma versão da cor atual com brilho diminuído segundo fator especificado (de 0 a 1)
function Cor:escuro(fator)
    local comando = string.format(
        "pastel darken %f %06x | pastel format",
        fator,
        self.valor
    )
    local escura = io.popen(comando):read("a"):gsub("#", "0x")
    return cor(tonumber(escura))
end

local Atributo = {}

-- Define um atributo de texto.
local function atributo(valor)
    local atrib = { valor = valor }
    return setmetatable(atrib, { __index = Atributo })
end

-- Gera uma representação textual do atributo no formato do Kakoune.
function Atributo:kakoune()
    local kakoune = {
        sublinhado = "u",
        negrito = "b",
        italico = "i",
        inverso = "r"
    }

    return kakoune[self.valor]
end

-- Gera uma representação textual do Atributouto no formato do fish.
function Atributo:fish()
    local fish = {
        sublinhado = "--underline",
        negrito = "--bold",
        italico = "--underline",
        inverso = "--reverse"
    }

    return fish[self.valor]
end

local Atributos = {}

-- Define uma lista de atributos a serem aplicados a um texto.
local function atributos(lista)
    return setmetatable(lista, { __index = Atributos })
end

function Atributos:kakoune()
    if #self == 0 then
        return ""
    end

    local elementos = {}

    for i, elemento in ipairs(self) do
        elementos[i] = elemento:kakoune()
    end

    return "+" .. table.concat(elementos)
end

function Atributos:fish()
    if #self == 0 then
        return ""
    end

    local elementos = {}

    for i, elemento in ipairs(self) do
        elementos[i] = elemento:fish()
    end

    return table.concat(elementos, " ")
end

local Elemento = {}

local function elemento(spec)
    spec.fundo = spec.fundo or cor(nil)
    spec.letra = spec.letra or cor(nil)
    spec.sublinhado = spec.sublinhado or cor(nil)
    spec.atributos = spec.atributos and atributos(spec.atributos) or atributos {}

    return setmetatable(spec, { __index = Elemento })
end

function Elemento:kakoune()
    return string.format(
        "%s,%s,%s%s",
        self.letra:kakoune(),
        self.fundo:kakoune(),
        self.sublinhado:kakoune(),
        self.atributos:kakoune()
    )
end

function Elemento:fish()
    local fundo = #self.fundo > 0 and " --background=" .. self.fundo:fish() or ""
    return string.format(
        "%s %s%s",
        self.letra:fish(),
        self.atributos:fish(),
        fundo
    )
end

function Elemento:konsole()
    return ""
end

local function konsole(esquema)
    io.input "konsole.template"
    io.output "colors/Garbo.colorscheme"

    local template = io.read("a")

    for nome, elem in pairs(esquema) do
        template = template:gsub("$" .. nome .. "%f[^%w_]", elem:konsole())
    end

    io.write(template)
end

local function kakoune(esquema)
    io.input "kak.template"
    io.output "colors/garbo.kak"

    local template = io.read("a")

    for nome, elem in pairs(esquema) do
        template = template:gsub("$" .. nome .. "%f[^%w_]", elem:kakoune())
    end

    io.write(template)
end

local function fish(esquema)
    io.input "fish.template"
    io.output "colors/garbo.fish"

    local template = io.read("a")

    for nome, elem in pairs(esquema) do
        template = template:gsub("$" .. nome .. "%f[^%w_]", elem:fish())
    end

    io.write(template)
end

local function esquema(elementos)
    konsole(elementos)
    kakoune(elementos)
    fish(elementos)
end



return {
    cor = cor,
    atributo = atributo,
    elemento = elemento,
    esquema = esquema,
}
