local Cor = {}
---@alias Cor { valor: integer | nil } Representa uma cor.

---@param valor integer | nil
---@return Cor
local function cor(valor)
    return setmetatable({ valor = valor }, Cor)
end

--- Gera uma representação textual da cor no formato do Kakoune
---@return string
function Cor:kakoune()
    if not self.valor then
        return "default"
    end

    local format = self.valor > 0xffffff and "rgba:%08x" or "rgb:%06x"
    return string.format(format, self.valor)
end

--- Gera uma representação textual da cor no formato do fish
---@return string
function Cor:fish()
    if not self.valor then
        return ""
    end

    local valor = self.valor > 0xffffff and self.valor // 0x100 or self.valor
    return string.format("%06x", valor)
end

--- Gera uma representação textual da cor no formato do Konsole
---@return string
function Cor:konsole()
    if not self.valor then
        return ""
    end

    local vermelho = math.floor(self.valor / 65536) % 256
    local verde = math.floor(self.valor / 256) % 256
    local azul = self.valor % 256
    return string.format("%d,%d,%d", vermelho, verde, azul)
end

--- Cria uma versão da cor atual saturada pelo fator especificado (de 0 a 1)
---@param fator number
---@return Cor
function Cor:saturado(fator)
    local comando = string.format(
        "pastel saturate %f %06x | pastel format",
        fator,
        self.valor
    )
    local saturada = io.popen(comando):read("a"):gsub("#", "0x")
    return cor(tonumber(saturada))
end

--- Cria uma versão da cor atual dessaturada pelo fator especificado (de 0 a 1)
---@param fator number
---@return Cor
function Cor:dessaturado(fator)
    local comando = string.format(
        "pastel desaturate %f %06x | pastel format",
        fator,
        self.valor
    )
    local dessaturada = io.popen(comando):read("a"):gsub("#", "0x")
    return cor(tonumber(dessaturada))
end

--- Cria uma versão da cor atual com brilho aumentado segundo fator especificado (de 0 a 1)
---@param fator number
---@return Cor
function Cor:claro(fator)
    local comando = string.format(
        "pastel lighten %f %06x | pastel format",
        fator,
        self.valor
    )
    local clara = io.popen(comando):read("a"):gsub("#", "0x")
    return cor(tonumber(clara))
end

--- Cria uma versão da cor atual com brilho diminuído segundo fator especificado (de 0 a 1)
---@param fator number
---@return Cor
function Cor:escuro(fator)
    local comando = string.format(
        "pastel darken %f %06x | pastel format",
        fator,
        self.valor
    )
    local escura = io.popen(comando):read("a"):gsub("#", "0x")
    return cor(tonumber(escura))
end

--- Cria uma nova cor

local Atributo = {}
---@alias Atributo { valor: "sublinhado" | "negrito" | "italico" | "inverso" }

--- Define um atributo de texto.
---@param valor "sublinhado" | "negrito" | "italico" | "inverso"
---@return Atributo
local function atributo(valor)
    local atrib = { valor = valor }
    return setmetatable(atrib, Atributo)
end

--- Gera uma representação textual do atributo no formato do Kakoune.
---@return string
function Atributo:kakoune()
    local kakoune = {
        sublinhado = "u",
        negrito = "b",
        italico = "i",
        inverso = "r"
    }

    return kakoune[self.valor]
end

--- Gera uma representação textual do Atributouto no formato do fish.
---@return string
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

--- Define uma lista de atributos a serem aplicados a um texto.
---@param lista Atributo[]
---@return Atributo[]
local function atributos(lista)
    return setmetatable(lista, Atributos)
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

local function elemento(spec)
    spec.fundo = spec.fundo or cor(nil)
    spec.letra = spec.letra or cor(nil)
    spec.sublinhado = spec.sublinhado or cor(nil)
    spec.atributos = spec.atributos and atributos(spec.atributos) or atributos {}

    function spec:kakoune()
        return string.format("%s,%s,%s%s", self.letra:kakoune(), self.fundo:kakoune(), self.sublinhado:kakoune(),
            self.atributos:kakoune())
    end

    function spec:modo_fish()
        local fundo = #self.fundo > 0 and " --background=" .. self.fundo:fish() or ""
        return string.format("%s %s%s", self.letra:fish(), self.atributos:fish(), fundo)
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

local function konsole(cores)
    io.input "konsole.template"
    io.output "colors/Garbo.colorscheme"

    local template = io.read("a")

    for nome, cor in pairs(cores) do
        template = template:gsub("$" .. nome .. "%f[^%w_]", cor:konsole())
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
    esquema = estilo,
    konsole = konsole,
    kakoune = kakoune,
    fish = fish,
}
