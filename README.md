# Flexget Docker image
Flexget Docker image built on Alpine Linux.
([Github repo](https://github.com/bwot/docker-flexget))


### How to run
You must at the very least mount your local `config.yml` to `/flexget/config.yml` to be able to run this.

This is only an example of how it could look, your config is probably different:
```bash
docker run -d --name flexget \
  # Mount your flexget config
  -v ~/.flexget/config.yml:/flexget/config.yml \
  # Mount flexget db, if you keep it local
  -v ~/.flexget/db-config.sqlite:/flexget/db-config.sqlite \
  # Mount a download path (set in config.yml)
  -v ~/.watch:/flexget/watch \
  towb/flexget
```
