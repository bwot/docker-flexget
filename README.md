# Flexget Docker image
Flexget Docker image built on Alpine Linux [[Github](https://github.com/bwot/docker-flexget)]

[![](https://images.microbadger.com/badges/image/towb/flexget.svg)](http://microbadger.com/images/towb/flexget "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/towb/flexget.svg)](http://microbadger.com/images/towb/flexget "Get your own version badge on microbadger.com")

### How to run
You must at the very least mount your local `config.yml` to `/flexget/config.yml` to be able to run this.

This is only an example of how it could look, your config is probably different:
```bash
docker run -d --name flexget \
  -e LOGLEVEL=verbose # Loglevel is 'info' by default, see Flexget docs for other values
  # Mount your flexget config
  -v ~/.flexget/config.yml:/flexget/config.yml \
  # Mount flexget db, if you keep it local
  -v ~/.flexget/db-config.sqlite:/flexget/db-config.sqlite \
  # Mount a download path (set in config.yml)
  -v ~/.watch:/flexget/watch \
  towb/flexget
```
