#!/usr/bin/env lua

function cor(valor)
	local c = { valor = valor }

	function c:modo_vim()
		self.__tostring = function()
			return valor == "nenhuma" and "none" or string.format("#%06x", self.valor)
		end
	end

	function c:modo_kakoune()
		self.__tostring = function()
			return valor == "nenhuma" and "default" or string.format("rgb:%06x", self.valor)
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

	return setmetatable(atrib, atrib)
end

function atributos(lista)
	function lista:modo_vim()
		for _, atributo in ipairs(self) do
			atributo:modo_vim()
		end

		self.__tostring = function()
			if #self == 0 then
				return "none"
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
				return "none"
			end

			local elementos = {}

			for i, elemento in ipairs(self) do
				elementos[i] = tostring(elemento)
			end

			if #elementos > 0 then
				return "+" .. table.concat(elementos)
			else
				return ""
			end
		end
	end

	return setmetatable(lista, lista)
end

function elemento(spec)
	spec.fundo = spec.fundo or cor "nenhuma"
	spec.letra = spec.letra or cor "nenhuma"
	spec.atributos = spec.atributos or atributos {}

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
			return string.format("%s,%s%s", self.fundo, self.letra, self.atributos)
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

	return e
end

-- Início da especificação do estilo

local branco = cor(0xccd0da)
local preto = cor(0x000000)
local azul = cor(0x7a80ee)
local azul_escuro = cor(0x5656e6)
local azul_claro = cor(0x00e2ff)
local verde = cor(0x00b982)
local amarelo = cor(0xfffb79)
local laranja = cor(0x9d4125)
local laranja_vivo = cor(0xdf5f00)
--local laranja_vivo = cor(0xdf4102)
local rosa1 = cor(0xd3005b)
local rosa2 = cor(0xe11f8d)
local vermelho = cor(0xaf0000)
local vermelho_vivo = cor(0xff0000)

-- Do mais escuro pro mais claro
local cinza1 = cor(0x1c1d21)
local cinza2 = cor(0x2e3036)
local cinza3 = cor(0x373940)
local cinza4 = cor(0x414153)
local cinza5 = cor(0x595d68)
local cinza6 = cor(0x6a6f7c)
local cinza7 = cor(0x838999)
local cinza8 = cor(0xc0c7df)
local cinza9 = cor(0xcbd4ec)
local cinza9 = cor(0xdbe6ff)

local negrito = atributo "negrito"
local italico = atributo "italico"
local sublinhado = atributo "sublinhado"
local inverso = atributo "inverso"

local garbo = estilo {
	texto           = elemento { letra = branco },
	constante       = elemento { letra = rosa1, atributos = atributos { negrito } },
	string          = elemento { letra = rosa2 },
	palavra_chave   = elemento { letra = amarelo },
	tipo            = elemento { letra = verde },
	funcao          = elemento { letra = azul },
	meta            = elemento { letra = azul_escuro },
	especial        = elemento { letra = vermelho_vivo },
	erro            = elemento { letra = vermelho, atributos = atributos { negrito } },
	todo            = elemento { letra = preto, fundo = vermelho },
	comentario      = elemento { letra = cinza5 },
	elemento_casado = elemento { atributos { negrito } },
	selecao1        = elemento { letra = preto, fundo = laranja },
	selecao2        = elemento { letra = preto, fundo = cinza3 },
	menu            = elemento { letra = branco, fundo = cinza1 },
	selecao_do_menu = elemento { letra = preto, fundo = laranja_vivo }
}

-- Vim

io.input "garbo.vim_template"
io.output "colors/garbo.vim"

local template = io.read "a"
garbo:modo_vim()

for nome, elem in pairs(garbo.elementos) do
	template = template:gsub("$" .. nome, tostring(elem))
end

io.write(template)

-- Kakoune

io.input "garbo.kak_template"
io.output "colors/garbo.kak"

template = io.read "a"
garbo:modo_kakoune()

for nome, elem in pairs(garbo.elementos) do
	template = template:gsub("$" .. nome, tostring(elem))
end

io.write(template)
