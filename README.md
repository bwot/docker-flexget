# Flexget Docker image
Flexget Docker image built on Python's Alpine Linux image [[Github](https://github.com/bwot/docker-flexget)][[Docker Hub](https://hub.docker.com/r/towb/flexget)]

[![](https://images.microbadger.com/badges/image/towb/flexget:3.0.svg)](https://microbadger.com/images/towb/flexget:3.0 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/towb/flexget:3.0.svg)](https://microbadger.com/images/towb/flexget:3.0 "Get your own version badge on microbadger.com")

# How to
By default you're __required__ to mount a valid flexget config.yml to `/flexget/config.yml`, anything else is up to your needs. You need to change your `config.yml` to work from within the container. Any external paths should be mounted to `/flexget/`. For example a watchdir, or your movie library. Only mount `:ro` if you're uncertain because `flexget:flexget` will take ownership over everything in `/flexget/*`

---

## Environment variables:
All variables are optional.

* `LOGLEVEL` - Set the verbosity of the flexget logger. Levels: `critical`, `error`, `warning`, `info`, `verbose`, `debug`, `trace`. Defaults to `info`.

* `TZ` - What time zone to display log message timestamp in.
Example: `-v TZ="Europe/Stockholm"`. Defaults to `UTC`.

* `FLEX_UID` - This sets the UID for the "flexget" user in the container. This allows your host user to get ownership of any files created in mounted paths inside of the container, as long as you set it to the same UID.
Example: `-v FLEX_UID="$(id -u "$USER")"`

* `FLEX_GID` - Same as above but for group.
Example: `-v FLEX_GID="$(id -g "$USER")"`

---

## Run:

Here's an example of how to run this image, your config may look different:
```bash
$ docker run -d --name flexget \
  # Mount flexget config
  -v ~/.flexget/config.yml:/flexget/ \
  # Mount flexget db, if you keep it on your host machine
  -v ~/.flexget/db-config.sqlite:/flexget/ \
  # Mount a download path (set in config.yml)
  -v ~/.watch:/flexget/watch \
  towb/flexget
```
The above command starts the flexget daemon by default via `/docker-entrypoint.sh`. You can also start it by passing a command to be run manually, or any other way possible with docker.

---

## Install plugins:

### On existing, running container:
Use `docker exec` to execute a command in a running container:
```bash
$ docker exec -it flexget pip install cfscrape
$ docker container restart flexget
```

---

## Start flexget manually:
If you need to do more than just start flexget with the defaults.

In this example we'll install a plugin before starting flexget with `docker run`:

```bash
$ docker run -d --name flexget \
  -v ~/.flexget/config.yml:/flexget/ \
  towb/flexget \
  sh -c "pip install cfscrape && flexget -c /flexget/config.yml daemon start"
```
