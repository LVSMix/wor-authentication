
## Change log

### [0.2.1] - 2017-07-27

- Throws Wor::Authentication::MissingAuthorizationHeader when no Authorization header is sent
- Throws Wor::Authentication::InvalidAuthorizationToken when the Authorization token is invalid

### [0.2.0]

#### Added

- Initializer with its generator.
- Specs for initializer and generator.

#### Changed

- Instead of overriding methods, it is now possible to configure `expiration_days` and `maximum_useful_days` with the initializer.

#### Removed

- Removed restriction for authentication parameters.

### [0.1.0]

#### Added

- `wor-authentication` gem first release.
