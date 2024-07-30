local estilo              = require "estilo"

-- Cores
local branco              = estilo.cor(0xd5d5de)
local branco_translucido1 = estilo.cor(0x99999977)
local branco_translucido2 = estilo.cor(0xaaaaaa77)
local preto               = estilo.cor(0x000000)
local preto_translucido   = estilo.cor(0x00000050)
local cianuro             = estilo.cor(0x008799)
local azul_claro          = estilo.cor(0x4c54e8)
local azul                = estilo.cor(0x1f1fd2)
local azul_fosco          = estilo.cor(0x2a2a32)
local verde               = estilo.cor(0x006d4c)
local amarelo             = estilo.cor(0xe69100)
local rosa1               = estilo.cor(0xd3005b)
local rosa2               = estilo.cor(0xff1ea1)
local vermelho            = estilo.cor(0xef2745)

-- Do mais escuro pro mais claro
local cinza0              = estilo.cor(0x1e1e26)
local cinza1              = cinza0:claro(0.85 * 1)
local cinza2              = cinza0:claro(0.85 * 2)
local cinza3              = cinza0:claro(0.85 * 3)
local cinza4              = cinza0:claro(0.85 * 4)
local cinza5              = cinza0:claro(0.85 * 5)
local cinza6              = cinza0:claro(0.85 * 6)
local cinza7              = cinza0:claro(0.85 * 7)
local cinza8              = cinza0:claro(0.85 * 8)
local cinza9              = cinza0:claro(0.85 * 9)

local negrito             = estilo.atributo "negrito"
local italico             = estilo.atributo "italico"
local sublinhado          = estilo.atributo "sublinhado"
local inverso             = estilo.atributo "inverso"

estilo.esquema "brio" {
    -- Cores
    fundo              = estilo.cor(0xffffff),
    fundo_opaco        = estilo.cor(0xffffff),
    fundo_intenso      = estilo.cor(0xffffff),

    letra              = cinza2,
    letra_opaco        = cinza2:dessaturado(0.3),
    letra_intenso      = cinza2:saturado(0.3),

    preto              = preto,
    preto_opaco        = preto:dessaturado(0.3),
    preto_intenso      = preto:saturado(0.3),

    vermelho           = vermelho,
    vermelho_opaco     = vermelho:dessaturado(0.3),
    vermelho_intenso   = vermelho:saturado(0.3),

    verde              = verde,
    verde_opaco        = verde:dessaturado(0.3),
    verde_intenso      = verde:saturado(0.1),

    amarelo            = amarelo,
    amarelo_opaco      = amarelo:dessaturado(0.3),
    amarelo_intenso    = amarelo:saturado(0.1),

    azul               = azul,
    azul_opaco         = azul:dessaturado(0.1),
    azul_intenso       = azul:saturado(0.3),

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
    texto              = estilo.elemento { letra = cinza2 },
    constante          = estilo.elemento { letra = rosa1 },
    parametro          = estilo.elemento { letra = cinza4, atributos = { negrito } },
    string             = estilo.elemento { letra = rosa2 },
    palavra_chave      = estilo.elemento { letra = amarelo },
    tipo               = estilo.elemento { letra = verde },
    funcao             = estilo.elemento { letra = azul_claro },
    meta               = estilo.elemento { letra = azul },
    especial           = estilo.elemento { letra = vermelho },
    erro               = estilo.elemento { letra = vermelho, atributos = { negrito } },
    todo               = estilo.elemento { letra = preto, fundo = vermelho },
    comentario         = estilo.elemento { letra = cinza5 },
    operador           = estilo.elemento { letra = cinza3 },

    -- Markup
    titulo             = estilo.elemento { letra = azul_fosco },
    cabecalho          = estilo.elemento { letra = rosa1 },
    negrito            = estilo.elemento { atributos = { negrito } },
    italico            = estilo.elemento { atributos = { italico } },
    sublinhado         = estilo.elemento { atributos = { sublinhado } },
    monoespacado       = estilo.elemento { letra = verde },
    bloco              = estilo.elemento { letra = verde },
    link               = estilo.elemento { letra = azul_fosco },
    item               = estilo.elemento { letra = amarelo },
    lista              = estilo.elemento { letra = cinza0 },

    -- UI
    elemento_casado    = estilo.elemento { letra = vermelho },
    referencia         = estilo.elemento { sublinhado = cinza6, atributos = { sublinhado } },
    selecao1           = estilo.elemento { letra = branco_translucido1, fundo = cinza8 },
    selecao2           = estilo.elemento { letra = branco_translucido2, fundo = branco },
    cursor1            = estilo.elemento { letra = branco, fundo = cinza3 },
    cursor2            = estilo.elemento { letra = branco, fundo = cinza2 },
    cursor3            = estilo.elemento { letra = branco, fundo = cinza5 },
    cursor4            = estilo.elemento { letra = branco, fundo = cinza3 },
    menu1              = estilo.elemento { letra = preto, fundo = branco },
    menu2              = estilo.elemento { letra = preto, fundo = branco },
    selecao_do_menu    = estilo.elemento { letra = preto, fundo = branco, atributos = { inverso } },
    informacao         = estilo.elemento { letra = verde },
    busca              = estilo.elemento { letra = cianuro, atributos = { negrito } },
    busca_incremental  = estilo.elemento { letra = cianuro, atributos = { inverso } },
    linha_atual        = estilo.elemento { fundo = cinza8 },
    elemento_de_fundo  = estilo.elemento { letra = cinza7 },
    status_ativo       = estilo.elemento { letra = cinza4, fundo = cinza4 },
    status             = estilo.elemento { letra = preto, fundo = branco },
    decorativos        = estilo.elemento { letra = branco },
    diagnostico_erro   = estilo.elemento { sublinhado = vermelho, atributos = { sublinhado } },
    diagnostico_aviso  = estilo.elemento { sublinhado = cinza8, atributos = { sublinhado } },
    diagnostico_aviso2 = estilo.elemento { letra = amarelo },
    phantom_selection  = estilo.elemento { sublinhado = cinza8, atributos = { sublinhado } }
}
