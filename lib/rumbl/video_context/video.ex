defmodule Rumbl.VideoContext.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.VideoContext.Video
  alias Rumbl.VideoContext.Category

  @primary_key {:id, Rumbl.Permalink, autogenerate: true}
  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    field :slug, :string
    belongs_to :user, Rumbl.Accounts.User
    belongs_to :category, Rumbl.VideoContext.Category

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
    |> slugify_title()
    |> assoc_constraint(:category)
  end

  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  defp slugify(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end

  defimpl Phoenix.Param, for: Rumbl.Accounts.Video do
    def to_param(%{slug: slug, id: id}) do
      "#{id}-#{slug}"
    end
  end

end
