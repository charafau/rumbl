ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Rumbl.Repo, :manual)

defmodule RumblWeb.TestHelpers do
  alias Rumbl.Repo

  def insert_users(attrs \\ %{}) do
    changes = Dict.merge(
      %{
        name: "Some User",
        username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
        password: "supersecret"
      },
      attrs
    )

    %Rumbl.Accounts.User{}
    |> Rumbl.Accounts.User.registration_changeset(changes)
    |> Repo.insert!()
  end

  def insert_video(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:videos, attrs)
    |> Repo.insert!()
  end

end