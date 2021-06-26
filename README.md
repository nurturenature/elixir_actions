<!-- from Github action ${.github/workflows/}elixir_ci.yml -->
[elixir_ci]: https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml
[elixir_ci-img]: https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml/badge.svg

# *Example GitHub actions to work with Elixir.*

[![🤔 GitHub action failied?][elixir_ci-img]][elixir_ci]

### Basic CI with caching

Typical `mix`
- deps
- compile
- test
- with a few extra flags and tasks for completeness
  - even `dialyzer` to work the cache

Caching can *really* help, ⏳ to a relative 🚀.
- paths
  - `deps`
  - `_build`
- cache key
  - OS + OTP ver + Elixir ver + hash(mix.lock)
 
See [`elixir_ci.yml`](https://github.com/nurturenature/elixir_actions/blob/main/.github/workflows/elixir_ci.yml).
