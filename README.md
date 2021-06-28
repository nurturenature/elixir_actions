<!-- from Github action ${.github/workflows/}elixir_ci.yml -->
[elixir_ci]: https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml
[elixir_ci-img]: https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml/badge.svg

# ***Elixir Actions for GitHub***

[![🤔 GitHub action failied?][elixir_ci-img]][elixir_ci]

## Uses [@erlef](https://github.com/erlef/)([Erlang Ecosystem Foundation](https://erlef.org)) [`setup-beam`](https://github.com/erlef/setup-beam) Action

- [recommended](https://github.com/actions/setup-elixir#setup-elixir) by GitHub
- easy to use, just works

```yaml
- name: Install Erlang/OTP + Elixir 🏗️
  id: setup-beam
  uses: erlef/setup-beam@v1
  with:
    otp-version: '24.0' # version range or exact (required)
    elixir-version: '1.12.0' # version range or exact (required)
        # install-hex: true (default)
        # install-rebar: true (default)
  # outputs:
    # (opt, elixir, rebar3)-version (exact version installed)
        
```

## Basic CI With Caching

Typical `mix` steps
- deps (+ compile) 🔗
- compile (+ format, credo, dialyzer, docs) 🔧
- test (+ cover, coverage) 🦺
- upload artifacts (doc, cover) 📚

### Caching Can *Really* Help (⏳ to a relative 🚀)
- paths
  - `deps`
  - `_build`
- cache key is hierarchical:
    - OS, otp-version, elixir-version, mix.lock
- on cache miss, key is repeatedly trimmed to be more general
- saves GitHub action minutes ⏱️ in addition to developer time
 

### See [`elixir_ci.yml`](https://github.com/nurturenature/elixir_actions/blob/main/.github/workflows/elixir_ci.yml).

<hr>

A results status badge is created by the action:

```html
https://github.com/<OWNER>/<REPOSITORY>/actions/workflows/<WORKFLOW_FILE>/badge.svg
```
[![🤔 GitHub action failied?][elixir_ci-img]][elixir_ci]

for use in `readme.md`, dashboards, etc.