# holmes-alf [![Build Status](https://secure.travis-ci.org/scorphus/holmes-alf.png?branch=master)](https://travis-ci.org/scorphus/holmes-alf)


## Holmes OAuth 2 Sync/Async Clients Wrapper

holmes-alf is a wrapper for OAuth 2 synchronous (based on [alf](https://github.com/globocom/alf)) and asynchronous (based on the [tornado-alf](https://github.com/globocom/tornado-alf)) clients that can be used in [holmes](https://github.com/holmes-app/holmes-api).

## Features

The following features are supported by both [alf](https://github.com/globocom/alf) and [tornado-alf](https://github.com/globocom/tornado-alf):

* Automatic token retrieving and renewing
* Token expiration control
* Automatic retry on status 401 (UNAUTHORIZED)

## Usage

Set the following config variables:

```conf
AUTHNZ_WRAPPER = 'holmesalf.wrapper.AlfAuthNZWrapper'

OAUTH_TOKEN_ENDPOINT = 'https://oauth-service.com/token-endpoint'
OAUTH_CLIENT_ID = 'client-id'
OAUTH_CLIENT_SECRET = 'client-secret'
```

Next, you have a sync and an async client at your disposal:

```python
ipdb> type(self.application.authnz_wrapper)
<class 'holmesalf.wrapper.AlfAuthNZWrapper'>
ipdb> type(self.application.authnz_wrapper.sync_client)
<class 'alf.client.Client'>
ipdb> type(self.application.authnz_wrapper.async_client)
<class 'tornadoalf.client.Client'>
```

## License

MIT licensed.
