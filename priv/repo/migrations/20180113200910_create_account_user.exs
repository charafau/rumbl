defmodule Rumbl.Repo.Migrations.CreateAccountUser do
  use Ecto.Migration

  def change do
    rename table(:users), to: table(:accounts_users)
  end
end
