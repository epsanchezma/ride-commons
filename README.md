RideCommons
===========

Curated set of common modules/functions used across multiple Ride projects in Elixir lang.

## Components

### RideCommons.JSON

Based in JSX. Labels decoded as atoms by default.

- encode(body, opts)
- encode!(body, opts)
- decode(body, opts)
- decode!(body, opts)

Read [JSX documentation](https://github.com/talentdeficit/exjsx) for details about supported options.

### Ride.Commons.UUID

UUIDv4 generation using `:crypto.rand_bytes`

- generate_uuid

### Ride.Commons.Naming

Convenient functions for inflecting, copied from Mix.

- camelize(str)
- underscore(str)
