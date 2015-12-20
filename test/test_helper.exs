ExUnit.start

Mix.Task.run "ecto.create", ~w(-r SecretKeeper.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r SecretKeeper.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(SecretKeeper.Repo)

