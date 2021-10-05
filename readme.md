# 💻 Sobre o desafio

Nesse desafio, você deverá gerar um relatório a partir de um arquivo `.csv`.

Dez pessoas fizeram freelas para uma empresa X durante cinco anos e o histórico com todos os dados de cada uma dessas pessoas (nome, horas trabalhadas, dia, mês e ano) foram passadas para um arquivo CSV na seguinte ordem: nome, horas de trabalho no dia (que vai variar de 1 a 8 hrs), dia (que vai variar de 1 a 30 mesmo para o mês de fevereiro e sem considerar anos bissextos) referente às horas de trabalho, mês e ano (que vai de 2016 a 2020). Resumindo: **nome**, **quantidade de horas**, **dia**, **mês** e **ano**.
O relatório gerado a partir do arquivo (que está disponível para download logo abaixo) deve estar no seguinte formato:

```elixir
%{
  all_hours: %{
        danilo: 500,
        rafael: 854,
        ...
    },
  hours_per_month: %{
        danilo: %{
            janeiro: 40,
            fevereiro: 64,
            ...
        },
        rafael: %{
            janeiro: 52,
            fevereiro: 37,
            ...
        }
    },
  hours_per_year: %{
        danilo: %{
            2016: 276,
            2017: 412,
            ...
        },
        rafael: %{
            2016: 376,
            2017: 348,
            ...
        }
    }
}
```

Os caracteres `...` é o espaço onde ficaria o resto dos dados. Esse é apenas um exemplo visual do que o retorno da função deve possuir, beleza?

## Download do arquivo

[gen_report.csv](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/070dd69a-c358-46cf-bc53-b2c5e79c9346/gen_report.csv)

---

Se você ainda não possui o ambiente configurado para usar o Elixir, nós construímos um guia para te auxiliar nesse processo. Você pode acessar a partir do link abaixo:

[Ambiente de desenvolvimento - Trilha Elixir](https://www.notion.so/Ambiente-de-desenvolvimento-Trilha-Elixir-aa2399b4ec17447582d04cbce8ffa12f)

## Template da aplicação

Para te ajudar nesse desafio, criamos para você esse modelo que você deve utilizar como um template do GitHub.

O template está disponível na seguinte URL: 

**Dica**: Caso não saiba utilizar repositórios do GitHub como template, temos um guia em **[nosso FAQ.](https://www.notion.so/FAQ-Desafios-Elixir-091b0ff94cea40b1a2fbc24c5d8e9958)**

[rocketseat-education/ignite-template-elixir-gerando-relatorios](https://github.com/rocketseat-education/ignite-template-elixir-gerando-relatorios)

## Especificações dos testes

Em cada teste, você encontrará uma breve descrição do que sua aplicação deve cumprir para que o teste passe.

Para esse desafio, temos os seguintes testes:

[Testes test/gen_report_test.exs](https://www.notion.so/Testes-test-gen_report_test-exs-81b150786093484a860eb34eccf17060)

[Testes test/parser_test.exs](https://www.notion.so/Testes-test-parser_test-exs-ff211e530fcb49b1a9eb7cf637ccdea2)

# 📅 Entrega

Esse desafio deve ser entregue a partir da plataforma da Rocketseat. Para isso, envie o desafio concluído para um repositório no GitHub e em seguida envie o link do repositório no campo de submissão do desafio na plataforma da Rocketseat. 

Após concluir o desafio, além de ter mandado o código para o GitHub, fazer um post no LinkedIn é uma boa forma de demonstrar seus conhecimentos e esforços para evoluir na sua carreira para oportunidades futuras.

Feito com 💜 por Rocketseat 👋 participe da nossa [comunidade aberta!](https://discord.gg/pUU3CG4Z)

[https://github.com/rocketseat-education/ignite-template-gerando-relatorios](https://github.com/rocketseat-education/ignite-template-gerando-relatorios)
