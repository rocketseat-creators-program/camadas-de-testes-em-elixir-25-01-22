ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Ectestes.Repo, :manual)

Mox.defmock(Ectestes.ServiceExternal.ClientMock,
  for: Ectestes.ServiceExternal.HttpAdpater
)
