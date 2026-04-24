# This Repository is a Public Archive

## From a More Innocent Era

<!-- from Github action ${.github/workflows/}elixir_ci.yml -->
[elixir_ci]: https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml
[elixir_ci-img]: https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml/badge.svg

# ***Elixir Actions for GitHub***

[![🤔 GitHub action failied?][elixir_ci-img]][elixir_ci]

### See [`elixir_ci.yml`](https://github.com/nurturenature/elixir_actions/blob/main/.github/workflows/elixir_ci.yml) (complete example to use)

### See [`Elixir CI Workflow 🧪`](https://github.com/nurturenature/elixir_actions/actions/workflows/elixir_ci.yml) (workflow runs for this repository)

<hr>

### Uses [@erlef](https://github.com/erlef/)([Erlang Ecosystem Foundation](https://erlef.org)) [`setup-beam`](https://github.com/erlef/setup-beam)

- [recommended](https://github.com/actions/setup-elixir#setup-elixir) by GitHub
- easy to use

```yaml
- name: Install Erlang/OTP + Elixir 🏗️
  id: setup-beam
  uses: erlef/setup-beam@v1
  with:
    otp-version: '24.0' # version range or exact (required)
    elixir-version: '1.12.0' # version range or exact (required)
    # install-hex: true (default)
    # install-rebar: true (default)
  # outputs: ${steps.setup-beam.outputs.(otp, elixir, rebar3)-version} (exact version installed)
        
```

### Basic CI With Caching

Typical `mix` steps
- deps 🔗
- compile (+ format, credo, dialyzer, docs) 🔧
- test (+ cover/age) 🦺
- upload artifacts (doc, cover) 📚

### Caching Can *Really* Help

Save
- personal time ⏱️
- GitHub account action minutes 📉

```yaml
- name: Restore dependency/build cache 🗃️
  uses: actions/cache@v2
  with:
    path: |
      deps
      _build
    # cache key is hierarchical: OS, otp-version, elixir-version, mix.lock
    key: ${{ runner.os }}-mix-${{ steps.setup-beam.outputs.otp-version }}-${{ steps.setup-beam.outputs.elixir-version }}-${{ hashFiles('**/mix.lock') }}
    # restore keys are tried on cache misses, and only match the key prefix
    restore-keys: |
      ${{ runner.os }}-mix-${{ steps.setup-beam.outputs.otp-version }}-${{ steps.setup-beam.outputs.elixir-version }}-
      ${{ runner.os }}-mix-${{ steps.setup-beam.outputs.otp-version }}-
      ${{ runner.os }}-mix-
```
 
<hr>

Action generates a results status badge:

[![🤔 GitHub action failied?][elixir_ci-img]][elixir_ci]

for use in `readme.md`, dashboards, etc:

```html
https://github.com/<OWNER>/<REPOSITORY>/actions/workflows/<WORKFLOW_FILE>/badge.svg
```
