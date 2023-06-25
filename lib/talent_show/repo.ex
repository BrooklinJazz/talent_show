defmodule TalentShow.Repo do
  use Ecto.Repo,
    otp_app: :talent_show,
    adapter: Ecto.Adapters.Postgres
end
