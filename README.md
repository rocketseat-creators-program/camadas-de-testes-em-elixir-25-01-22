# Pirâmide de Testes em Elixir

**Cenário**: Imagine projeto que todas às vezes que são realizados ‘deploy’ para produção, todos ficam com medo de algo dar de errado. Por que isso acontece? 
Acontece porque um desenvolve altera algo, mas não sabe pode ter afetado do lado outro. 

Existem algumas coisas que pode ser feitas, para resolver este problema. Hoje vamos uma de algumas práticas que resolver este problema, a chamada pirâmide de testes. 

***Testes Integração***: Busca testar como diferentes módulos (ou unidades) do sistema interagem entre si.


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
