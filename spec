#!/usr/bin/env lua

local garbo               = require "garbo"

-- Cores
local branco              = cor(0xccd0da)
local branco_translucido1 = cor(0x66666677)
local branco_translucido2 = cor(0xffffff77)
local preto               = cor(0x000000)
local cianuro             = cor(0x00e2ff)
local azul_claro          = cor(0x7a80ee)
local azul                = cor(0x5656e6)
local azul_fosco          = cor(0x2a2a32)
local verde               = cor(0x00b982)
local amarelo             = cor(0xfffb79)
local rosa1               = cor(0xd3005b)
local rosa2               = cor(0xff1ea1)
local vermelho            = cor(0xef2745)

-- Do mais escuro pro mais claro
local cinza0              = cor(0x111114)
local cinza1              = cor(0x1c1d21)
local cinza2              = cor(0x2e2f36)
local cinza3              = cor(0x373941)
local cinza4              = cor(0x41444d)
local cinza5              = cor(0x595d68)
local cinza6              = cor(0x6a6f7c)
local cinza7              = cor(0x838999)
local cinza8              = cor(0xc0c7df)
local cinza9              = cor(0xcbd4ec)
local cinza10             = cor(0xdbe6ff)

local cinza_azulado1      = cor(0x2e2e3e)
local cinza_azulado2      = cor(0x3d3e53)
local cinza_translucido   = cor(0x5b5d7caa)

local negrito             = atributo "negrito"
local italico             = atributo "italico"
local sublinhado          = atributo "sublinhado"
local inverso             = atributo "inverso"

local estilo_garboso      = estilo {
    -- Código
    texto              = elemento { letra = branco },
    constante          = elemento { letra = rosa1, atributos = { negrito } },
    parametro          = elemento { letra = cinza9 },
    string             = elemento { letra = rosa2 },
    palavra_chave      = elemento { letra = amarelo },
    tipo               = elemento { letra = verde },
    funcao             = elemento { letra = azul_claro },
    meta               = elemento { letra = azul },
    especial           = elemento { letra = vermelho },
    erro               = elemento { letra = vermelho, atributos = { negrito } },
    todo               = elemento { letra = preto, fundo = vermelho },
    comentario         = elemento { letra = cinza6 },
    operador           = elemento { letra = cinza7 },

    -- Markup
    titulo             = elemento { letra = azul_claro },
    cabecalho          = elemento { letra = rosa1 },
    negrito            = elemento { atributos = { negrito } },
    italico            = elemento { atributos = { italico } },
    sublinhado         = elemento { atributos = { sublinhado } },
    monoespacado       = elemento { letra = verde },
    bloco              = elemento { letra = cinza5, atributos = { negrito } },
    link               = elemento { letra = azul_claro },
    item               = elemento { letra = amarelo },
    lista              = elemento { letra = branco },

    -- UI
    elemento_casado    = elemento { letra = vermelho },
    referencia         = elemento { sublinhado = cinza6, atributos = { sublinhado } },
    selecao1           = elemento { letra = branco_translucido2, fundo = cinza_azulado2 },
    selecao2           = elemento { letra = branco_translucido1, fundo = cinza_azulado1 },
    cursor1            = elemento { letra = preto, fundo = branco },
    cursor2            = elemento { letra = preto, fundo = cinza7 },
    cursor3            = elemento { letra = preto, fundo = cinza6 },
    cursor4            = elemento { letra = preto, fundo = cinza3 },
    menu1              = elemento { letra = branco, fundo = cinza1 },
    menu2              = elemento { letra = branco, fundo = cinza1 },
    selecao_do_menu    = elemento { letra = branco, fundo = cinza1, atributos = { inverso } },
    informacao         = elemento { letra = verde },
    busca              = elemento { letra = cianuro, atributos = { negrito } },
    busca_incremental  = elemento { letra = cianuro, atributos = { inverso } },
    linha_atual        = elemento { fundo = cinza1 },
    elemento_de_fundo  = elemento { letra = cinza3 },
    status_ativo       = elemento { letra = cinza5, fundo = cinza1 },
    status1            = elemento { letra = cinza5, fundo = cinza0 },
    status2            = elemento { letra = branco, fundo = cinza0 },
    status3            = elemento { letra = branco, fundo = cinza1 },
    elemento_ativo     = elemento { letra = cinza8 },
    decorativos        = elemento { letra = preto },
    diagnostico_erro   = elemento { sublinhado = vermelho, atributos = { sublinhado } },
    diagnostico_aviso  = elemento { sublinhado = cinza5, atributos = { sublinhado } },
    diagnostico_aviso2 = elemento { letra = amarelo },
    phantom_selection  = elemento { sublinhado = cinza5, atributos = { sublinhado } }
}

-- Vim

io.input "vim.template"
io.output "colors/garbo.vim"

local template = io.read "a"
estilo_garboso:modo_vim()

for nome, elem in pairs(estilo_garboso.elementos) do
    template = template:gsub("$" .. nome .. "%f[^%w_]", tostring(elem))
end

io.write(template)

-- Kakoune

io.input "kak.template"
io.output "colors/garbo.kak"

template = io.read "a"
estilo_garboso:modo_kakoune()

for nome, elem in pairs(estilo_garboso.elementos) do
    template = template:gsub("$" .. nome .. "%f[^%w_]", tostring(elem))
end

io.write(template)

-- Fish

io.input "fish.template"
io.output "colors/garbo.fish"

template = io.read "a"
estilo_garboso:modo_fish()

for nome, elem in pairs(estilo_garboso.elementos) do
    template = template:gsub("$" .. nome .. "%f[^%w_]", tostring(elem))
end

io.write(template)
