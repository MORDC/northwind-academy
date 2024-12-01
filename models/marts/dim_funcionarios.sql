with
    dim_funcionarios as (
        select *
        from {{ ref('int_vendas_self_join_funcionarios') }}
    )

select *
from dim_funcionarios