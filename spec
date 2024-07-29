#!/usr/bin/env lua

local estilo              = require "estilo"

-- Cores
local branco              = estilo.cor(0xccd0da)
local branco_translucido1 = estilo.cor(0x66666677)
local branco_translucido2 = estilo.cor(0xffffff77)
local preto               = estilo.cor(0x000000)
local cianuro             = estilo.cor(0x00e2ff)
local azul_claro          = estilo.cor(0x7a80ee)
local azul                = estilo.cor(0x5656e6)
local azul_fosco          = estilo.cor(0x2a2a32)
local verde               = estilo.cor(0x00b982)
local amarelo             = estilo.cor(0xfffb79)
local rosa1               = estilo.cor(0xd3005b)
local rosa2               = estilo.cor(0xff1ea1)
local vermelho            = estilo.cor(0xef2745)

-- Do mais escuro pro mais claro
local cinza0              = estilo.cor(0x111114)
local cinza1              = estilo.cor(0x1c1d21)
local cinza2              = estilo.cor(0x2e2f36)
local cinza3              = estilo.cor(0x373941)
local cinza4              = estilo.cor(0x41444d)
local cinza5              = estilo.cor(0x595d68)
local cinza6              = estilo.cor(0x6a6f7c)
local cinza7              = estilo.cor(0x838999)
local cinza8              = estilo.cor(0xc0c7df)
local cinza9              = estilo.cor(0xcbd4ec)
local cinza10             = estilo.cor(0xdbe6ff)

local cinza_azulado1      = estilo.cor(0x2e2e3e)
local cinza_azulado2      = estilo.cor(0x3d3e53)

local negrito             = estilo.atributo "negrito"
local italico             = estilo.atributo "italico"
local sublinhado          = estilo.atributo "sublinhado"
local inverso             = estilo.atributo "inverso"

estilo.esquema "garbo" {
    -- Cores
    fundo              = estilo.cor(0x000000),
    fundo_opaco        = estilo.cor(0x000000),
    fundo_intenso      = cinza0,

    letra              = branco,
    letra_opaco        = cinza9,
    letra_intenso      = estilo.cor(0xffffff),

    preto              = estilo.cor(0x000000),
    preto_opaco        = estilo.cor(0x000000),
    preto_intenso      = cinza2,

    vermelho           = vermelho,
    vermelho_opaco     = vermelho:dessaturado(0.3),
    vermelho_intenso   = rosa1,

    verde              = verde,
    verde_opaco        = verde:dessaturado(0.3),
    verde_intenso      = verde:saturado(0.1),

    amarelo            = amarelo,
    amarelo_opaco      = amarelo:dessaturado(0.3),
    amarelo_intenso    = amarelo:saturado(0.1),

    azul               = azul,
    azul_opaco         = azul_fosco,
    azul_intenso       = azul_claro,

    magenta            = rosa2,
    magenta_opaco      = rosa2:dessaturado(0.3),
    magenta_intenso    = rosa2:saturado(0.1),

    cianuro            = cianuro,
    cianuro_opaco      = cianuro:dessaturado(0.3),
    cianuro_intenso    = cianuro:saturado(0.3),

    branco             = branco,
    branco_opaco       = cinza9,
    branco_intenso     = branco:saturado(0.3),

    -- Código
    texto              = estilo.elemento { letra = branco },
    constante          = estilo.elemento { letra = rosa1, atributos = { negrito } },
    parametro          = estilo.elemento { letra = cinza9 },
    string             = estilo.elemento { letra = rosa2 },
    palavra_chave      = estilo.elemento { letra = amarelo },
    tipo               = estilo.elemento { letra = verde },
    funcao             = estilo.elemento { letra = azul_claro },
    meta               = estilo.elemento { letra = azul },
    especial           = estilo.elemento { letra = vermelho },
    erro               = estilo.elemento { letra = vermelho, atributos = { negrito } },
    todo               = estilo.elemento { letra = preto, fundo = vermelho },
    comentario         = estilo.elemento { letra = cinza6 },
    operador           = estilo.elemento { letra = cinza7 },

    -- Markup
    titulo             = estilo.elemento { letra = azul_claro },
    cabecalho          = estilo.elemento { letra = rosa1 },
    negrito            = estilo.elemento { atributos = { negrito } },
    italico            = estilo.elemento { atributos = { italico } },
    sublinhado         = estilo.elemento { atributos = { sublinhado } },
    monoespacado       = estilo.elemento { letra = verde },
    bloco              = estilo.elemento { letra = cinza5, atributos = { negrito } },
    link               = estilo.elemento { letra = azul_claro },
    item               = estilo.elemento { letra = amarelo },
    lista              = estilo.elemento { letra = branco },

    -- UI
    elemento_casado    = estilo.elemento { letra = vermelho },
    referencia         = estilo.elemento { sublinhado = cinza6, atributos = { sublinhado } },
    selecao1           = estilo.elemento { letra = branco_translucido2, fundo = cinza_azulado2 },
    selecao2           = estilo.elemento { letra = branco_translucido1, fundo = cinza_azulado1 },
    cursor1            = estilo.elemento { letra = preto, fundo = branco },
    cursor2            = estilo.elemento { letra = preto, fundo = cinza7 },
    cursor3            = estilo.elemento { letra = preto, fundo = cinza6 },
    cursor4            = estilo.elemento { letra = preto, fundo = cinza3 },
    menu1              = estilo.elemento { letra = branco, fundo = cinza1 },
    menu2              = estilo.elemento { letra = branco, fundo = cinza1 },
    selecao_do_menu    = estilo.elemento { letra = branco, fundo = cinza1, atributos = { inverso } },
    informacao         = estilo.elemento { letra = verde },
    busca              = estilo.elemento { letra = cianuro, atributos = { negrito } },
    busca_incremental  = estilo.elemento { letra = cianuro, atributos = { inverso } },
    linha_atual        = estilo.elemento { fundo = cinza1 },
    elemento_de_fundo  = estilo.elemento { letra = cinza3 },
    status_ativo       = estilo.elemento { letra = cinza5, fundo = cinza1 },
    status             = estilo.elemento { letra = branco, fundo = cinza1 },
    decorativos        = estilo.elemento { letra = preto },
    diagnostico_erro   = estilo.elemento { sublinhado = vermelho, atributos = { sublinhado } },
    diagnostico_aviso  = estilo.elemento { sublinhado = cinza5, atributos = { sublinhado } },
    diagnostico_aviso2 = estilo.elemento { letra = amarelo },
    phantom_selection  = estilo.elemento { sublinhado = cinza5, atributos = { sublinhado } }
}
