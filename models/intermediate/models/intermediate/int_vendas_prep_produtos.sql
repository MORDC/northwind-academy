with
    /* Chamada dos modelos necessários. */
    categorias as (
        select *
        from {{ ref('stg_erp_categorias') }}
    )

    , fornecedores as (
        select *
        from {{ ref('stg_erp_fornecedores') }}
    )

    , produtos as (
        select *
        from {{ ref('stg_erp_produtos') }}
    )

    , enriquecer_produtos as (
        select
            produtos.PK_PRODUTO
            , produtos.NM_PRODUTO
            , produtos.QUANTIDADE_POR_UNIDADE
            , produtos.PRECO_POR_UNIDADE
            , produtos.UNIDADE_EM_ESTOQUE
            , produtos.UNIDADE_POR_PEDIDO
            , produtos.NIVEL_DE_PEDIDO
            , produtos.EH_DISCONTINUADO
            , categorias.NOME_CATEGORIA
            , fornecedores.NOME_FORNECEDOR
            , fornecedores.CIDADE_FORNECEDOR
            , fornecedores.PAIS_FORNECEDOR 
        from produtos
        left join categorias on produtos.fk_categoria = categorias.pk_categoria
        left join fornecedores on produtos.fk_fornecedor = fornecedores.pk_fornecedor
    )

select *
from enriquecer_produtos