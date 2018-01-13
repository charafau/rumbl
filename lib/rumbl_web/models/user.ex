defmodule Rumbl.Accounts.User do
  use Ecto.Schema

  schema "accounts_users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

end