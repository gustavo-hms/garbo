#!/usr/bin/env lua

function cor(valor)
	local c = { valor = valor }

	function c:modo_vim()
		self.__tostring = function()
			return valor == "nenhuma" and "NONE" or string.format("#%06x", self.valor)
		end
	end

	function c:modo_kakoune()
		self.__tostring = function()
			return valor == "nenhuma" and "default" or string.format("rgb:%06x", self.valor)
		end
	end

	function c:modo_fish()
		self.__tostring = function()
			return valor == "nenhuma" and "" or string.format("%06x", self.valor)
		end
	end

	return setmetatable(c,c)
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
		self.atributos:modo_kakoune()

		self.__tostring = function()
			return string.format("%s,%s%s", self.letra, self.fundo, self.atributos)
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
	local e = { elementos = elementos}

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

--------------------------- Especificação do estilo --------------------------


local branco        = cor(0xccd0da)
local branco_fosco  = cor(0xaaadb4)
local preto         = cor(0x000000)
local azul          = cor(0x7a80ee)
local azul_escuro   = cor(0x5656e6)
local azul_claro    = cor(0x00e2ff)
local verde         = cor(0x00b982)
local amarelo       = cor(0xfffb79)
local laranja       = cor(0x9d4125)
local laranja_vivo  = cor(0xdf4102)
local rosa1         = cor(0xd3005b)
local rosa2         = cor(0xff1ea1)
local vermelho      = cor(0xfa2a2a)
local vermelho_vivo = cor(0xff0000)

-- Do mais escuro pro mais claro
local cinza0 = cor(0x111114)
local cinza1 = cor(0x1c1d21)
local cinza2 = cor(0x2e3036)
local cinza3 = cor(0x373940)
local cinza4 = cor(0x414153)
local cinza5 = cor(0x595d68)
local cinza6 = cor(0x6a6f7c)
local cinza7 = cor(0x838999)
local cinza8 = cor(0xc0c7df)
local cinza9 = cor(0xcbd4ec)
local cinza10 = cor(0xdbe6ff)

local negrito    = atributo "negrito"
local italico    = atributo "italico"
local sublinhado = atributo "sublinhado"
local inverso    = atributo "inverso"

local garbo = estilo {
	-- Código
	texto         = elemento { letra = branco },
	constante     = elemento { letra = rosa1, atributos = { negrito } },
	string        = elemento { letra = rosa2 },
	palavra_chave = elemento { letra = amarelo },
	tipo          = elemento { letra = verde },
	funcao        = elemento { letra = azul },
	meta          = elemento { letra = azul_escuro },
	especial      = elemento { letra = vermelho_vivo },
	erro          = elemento { letra = vermelho, atributos = { negrito } },
	todo          = elemento { letra = preto, fundo = vermelho },
	comentario    = elemento { letra = cinza5 },
	operador      = elemento { letra = cinza7 },

	-- Markup
	titulo       = elemento { letra = azul },
	cabecalho    = elemento { letra = rosa1 },
	negrito      = elemento { atributos = { negrito } },
	italico      = elemento { atributos = { italico } },
	sublinhado   = elemento { atributos = { sublinhado } },
	monoespacado = elemento { letra = verde },
	bloco        = elemento { letra = cinza5, atributos = { negrito } },
	link         = elemento { letra = azul },
	item         = elemento { letra = azul_claro },
	lista        = elemento { letra = branco },

	-- UI
	elemento_casado    =  elemento { atributos = { negrito }, fundo = cinza2 },
	selecao1           =  elemento { letra = preto, fundo = cinza6 },
	selecao2           =  elemento { letra = preto, fundo = cinza2 },
	cursor1            =  elemento { letra = preto, fundo = branco },
	cursor2            =  elemento { letra = preto, fundo = cinza5 },
	cursor3            =  elemento { letra = preto, fundo = cinza6 },
	cursor4            =  elemento { letra = preto, fundo = cinza3 },
	menu1              =  elemento { letra = branco, fundo = cinza1, },
	menu2              =  elemento { letra = branco, fundo = cinza0},
	menu2_invertido    =  elemento { letra = laranja_vivo, fundo = preto },
	selecao_do_menu    =  elemento { letra = preto, fundo = laranja },
	informacao_do_menu =  elemento { letra = verde },
	busca              =  elemento { letra = azul_claro, atributos = { negrito } },
	busca_incremental  =  elemento { letra = azul_claro, atributos = { inverso } },
	linha_atual        =  elemento { fundo = cinza1 },
	elemento_de_fundo  =  elemento { letra = cinza3 },
	status_ativo       =  elemento { letra = cinza5, fundo = cinza1 },
	status1            =  elemento { letra = cinza5, fundo = cinza0 },
	status2            =  elemento { letra = branco, fundo = cinza0 },
	status3            =  elemento { letra = branco, fundo = cinza1 },
	elemento_ativo     =  elemento { letra = cinza8 },
	decorativos        =  elemento { letra = preto },
	atencao            =  elemento { letra = cinza7, atributos = { sublinhado } },
}

-- Vim

io.input "vim.template"
io.output "colors/garbo.vim"

local template = io.read "a"
garbo:modo_vim()

for nome, elem in pairs(garbo.elementos) do
	template = template:gsub("$" .. nome .. "%f[^%w_]", tostring(elem))
end

io.write(template)

-- Kakoune

io.input "kak.template"
io.output "colors/garbo.kak"

template = io.read "a"
garbo:modo_kakoune()

for nome, elem in pairs(garbo.elementos) do
	template = template:gsub("$" .. nome .. "%f[^%w_]", tostring(elem))
end

io.write(template)

-- Fish

io.input "fish.template"
io.output "colors/garbo.fish"

template = io.read "a"
garbo:modo_fish()

for nome, elem in pairs(garbo.elementos) do
	template = template:gsub("$" .. nome .. "%f[^%w_]", tostring(elem))
end

io.write(template)
