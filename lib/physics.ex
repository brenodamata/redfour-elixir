defmodule Physics do
  use Application
  # import Supervisor.Spec, warn: false
  #
  # children = [
  #   supervisor(Physics.Repo, []),
  # ]

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Physics.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Physics.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
