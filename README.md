<!-- from Github action ${.github/workflows/}elixir_ci.yml -->
[elixir_ci]: https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml
[elixir_ci-img]: https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml/badge.svg

# Elixir GitHub Actions
*Example GitHub actions to work with Elixir.*

[![🤔 GitHub action failied?][elixir_ci-img]][elixir_ci]

### Basic CI with caching

Typical `mix`
- deps
- compile
- test
- with a few extra flags and tasks for completeness

Caching really helps. ⏳ to a relative 🚀.
- paths
  - `deps`
  - `_build`
- cache key
  - OS + OTP ver + Elixir ver + hash(mix.lock)
 
See [`elixir_ci.yml`](.githib/workflows/elixir_ci.yml).
