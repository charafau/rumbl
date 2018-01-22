defmodule Rumbl.VideoContext.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.VideoContext.Video
  alias Rumbl.VideoContext.Category


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    belongs_to :user, Rumbl.Accounts.User
    belongs_to :category, Rumbl.VideoContext.Category

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
    |> assoc_constraint(:category)
  end
end
