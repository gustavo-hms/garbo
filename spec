#!/usr/bin/env lua

local garbo               = require "garbo"

-- Cores
local branco              = garbo.cor(0xccd0da)
local branco_translucido1 = garbo.cor(0x66666677)
local branco_translucido2 = garbo.cor(0xffffff77)
local preto               = garbo.cor(0x000000)
local cianuro             = garbo.cor(0x00e2ff)
local azul_claro          = garbo.cor(0x7a80ee)
local azul                = garbo.cor(0x5656e6)
local azul_fosco          = garbo.cor(0x2a2a32)
local verde               = garbo.cor(0x00b982)
local amarelo             = garbo.cor(0xfffb79)
local rosa1               = garbo.cor(0xd3005b)
local rosa2               = garbo.cor(0xff1ea1)
local vermelho            = garbo.cor(0xef2745)

-- Do mais escuro pro mais claro
local cinza0              = garbo.cor(0x111114)
local cinza1              = garbo.cor(0x1c1d21)
local cinza2              = garbo.cor(0x2e2f36)
local cinza3              = garbo.cor(0x373941)
local cinza4              = garbo.cor(0x41444d)
local cinza5              = garbo.cor(0x595d68)
local cinza6              = garbo.cor(0x6a6f7c)
local cinza7              = garbo.cor(0x838999)
local cinza8              = garbo.cor(0xc0c7df)
local cinza9              = garbo.cor(0xcbd4ec)
local cinza10             = garbo.cor(0xdbe6ff)

local cinza_azulado1      = garbo.cor(0x2e2e3e)
local cinza_azulado2      = garbo.cor(0x3d3e53)
local cinza_translucido   = garbo.cor(0x5b5d7caa)

local negrito             = garbo.atributo "negrito"
local italico             = garbo.atributo "italico"
local sublinhado          = garbo.atributo "sublinhado"
local inverso             = garbo.atributo "inverso"

local estilo              = garbo.estilo {
    -- Código
    texto              = garbo.elemento { letra = branco },
    constante          = garbo.elemento { letra = rosa1, atributos = { negrito } },
    parametro          = garbo.elemento { letra = cinza9 },
    string             = garbo.elemento { letra = rosa2 },
    palavra_chave      = garbo.elemento { letra = amarelo },
    tipo               = garbo.elemento { letra = verde },
    funcao             = garbo.elemento { letra = azul_claro },
    meta               = garbo.elemento { letra = azul },
    especial           = garbo.elemento { letra = vermelho },
    erro               = garbo.elemento { letra = vermelho, atributos = { negrito } },
    todo               = garbo.elemento { letra = preto, fundo = vermelho },
    comentario         = garbo.elemento { letra = cinza6 },
    operador           = garbo.elemento { letra = cinza7 },

    -- Markup
    titulo             = garbo.elemento { letra = azul_claro },
    cabecalho          = garbo.elemento { letra = rosa1 },
    negrito            = garbo.elemento { atributos = { negrito } },
    italico            = garbo.elemento { atributos = { italico } },
    sublinhado         = garbo.elemento { atributos = { sublinhado } },
    monoespacado       = garbo.elemento { letra = verde },
    bloco              = garbo.elemento { letra = cinza5, atributos = { negrito } },
    link               = garbo.elemento { letra = azul_claro },
    item               = garbo.elemento { letra = amarelo },
    lista              = garbo.elemento { letra = branco },

    -- UI
    elemento_casado    = garbo.elemento { letra = vermelho },
    referencia         = garbo.elemento { sublinhado = cinza6, atributos = { sublinhado } },
    selecao1           = garbo.elemento { letra = branco_translucido2, fundo = cinza_azulado2 },
    selecao2           = garbo.elemento { letra = branco_translucido1, fundo = cinza_azulado1 },
    cursor1            = garbo.elemento { letra = preto, fundo = branco },
    cursor2            = garbo.elemento { letra = preto, fundo = cinza7 },
    cursor3            = garbo.elemento { letra = preto, fundo = cinza6 },
    cursor4            = garbo.elemento { letra = preto, fundo = cinza3 },
    menu1              = garbo.elemento { letra = branco, fundo = cinza1 },
    menu2              = garbo.elemento { letra = branco, fundo = cinza1 },
    selecao_do_menu    = garbo.elemento { letra = branco, fundo = cinza1, atributos = { inverso } },
    informacao         = garbo.elemento { letra = verde },
    busca              = garbo.elemento { letra = cianuro, atributos = { negrito } },
    busca_incremental  = garbo.elemento { letra = cianuro, atributos = { inverso } },
    linha_atual        = garbo.elemento { fundo = cinza1 },
    elemento_de_fundo  = garbo.elemento { letra = cinza3 },
    status_ativo       = garbo.elemento { letra = cinza5, fundo = cinza1 },
    status1            = garbo.elemento { letra = cinza5, fundo = cinza0 },
    status2            = garbo.elemento { letra = branco, fundo = cinza0 },
    status3            = garbo.elemento { letra = branco, fundo = cinza1 },
    elemento_ativo     = garbo.elemento { letra = cinza8 },
    decorativos        = garbo.elemento { letra = preto },
    diagnostico_erro   = garbo.elemento { sublinhado = vermelho, atributos = { sublinhado } },
    diagnostico_aviso  = garbo.elemento { sublinhado = cinza5, atributos = { sublinhado } },
    diagnostico_aviso2 = garbo.elemento { letra = amarelo },
    phantom_selection  = garbo.elemento { sublinhado = cinza5, atributos = { sublinhado } }
}

garbo.kakoune(estilo)
garbo.fish(estilo)

garbo.konsole {
    fundo = garbo.cor(0x000000),
    fundo_opaco = garbo.cor(0x000000),
    fundo_intenso = cinza0,

    letra = branco,
    letra_opaco = cinza9,
    letra_intenso = garbo.cor(0xffffff),

    preto = garbo.cor(0x000000),
    preto_opaco = garbo.cor(0x000000),
    preto_intenso = cinza2,

    vermelho = vermelho,
    vermelho_opaco = vermelho:dessaturado(0.3),
    vermelho_intenso = rosa1,

    verde = verde,
    verde_opaco = verde:dessaturado(0.3),
    verde_intenso = verde:saturado(0.1),

    amarelo = amarelo,
    amarelo_opaco = amarelo:dessaturado(0.3),
    amarelo_intenso = amarelo:saturado(0.1),

    azul = azul,
    azul_opaco = azul:dessaturado(0.3),
    azul_intenso = azul:saturado(0.3),

    magenta = rosa2,
    magenta_opaco = rosa2:dessaturado(0.3),
    magenta_intenso = rosa2:saturado(0.1),

    cianuro = cianuro,
    cianuro_opaco = cianuro:dessaturado(0.3),
    cianuro_intenso = cianuro:saturado(0.3),

    branco = branco,
    branco_opaco = cinza9,
    branco_intenso = branco:saturado(0.3),
}
