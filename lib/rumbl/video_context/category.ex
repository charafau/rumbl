defmodule Rumbl.VideoContext.Category do
  use Ecto.Schema
  import Ecto.Query

  schema "categories" do
    field :name, :string

    timestamps()
  end

  def alphabetical(query) do
    from c in query, order_by: c.name
  end

  def names_and_ids(query) do
    from c in query, select: {c.name, c.id}
  end

end
