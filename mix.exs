defmodule HelloWorld.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_world,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      preferred_cli_env: [testy: :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HelloWorld.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.24", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      setup: [
        "deps.clean --unused --unlock",
        "deps.get",
        "deps.compile"
      ],
      qa: [
        "format --check-formatted",
        "compile --warnings-as-errors",
        "credo --strict",
        "dialyzer",
        "docs"
      ],
      testy: [
        "test --warnings-as-errors --cover --export-coverage default",
        "test.coverage"
      ]
    ]
  end
end
