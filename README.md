RideCommons
===========

Curated set of common modules/functions used across multiple Ride projects in Elixir lang.

## Components

### RideCommons.JSON

Based in JSX. Labels decoded as atoms by default.

- encode_json(body, opts)
- encode_json!(body, opts)
- decode_json(body, opts)
- decode_json!(body, opts)

Read [JSX documentation](https://github.com/talentdeficit/exjsx) for details about supported options.

### Ride.Commons.UUID

- generate_uuid
