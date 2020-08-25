defmodule Ockam.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "applications",
      version: "0.10.0-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps(Mix.env()),
      test_coverage: [output: "_build/cover"],
      aliases: aliases()
    ]
  end

  # Dependencies listed here are available only for this umbrella project and
  # cannot be accessed from applications inside the applications folder.
  defp deps(:prod) do
    []
  end

  defp deps(_) do
    deps(:prod) ++ []
  end

  defp aliases() do
    [
      docs: "cmd mix docs",
      test: "test --no-start --cover",
      lint: ["format --check-formatted"]
    ]
  end
end
