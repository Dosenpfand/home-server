# HOME-SERVER

Container configuration for a home server setup.

## Services

* Nextcloud
* DynDNS update for Hetzner DNS
* WireGuard
* Backup usting restic TODO

## Configuration

### dyndns.env

```
HETZNER_AUTH_API_TOKEN=
HETZNER_ZONE_NAME=
HETZNER_RECORD_NAME=
```

### postgres.env

```
POSTGRES_PASSWORD=
POSTGRES_DB=
POSTGRES_USER=
```

### web.env

```
VIRTUAL_HOST=
LETSENCRYPT_HOST=
LETSENCRYPT_EMAIL=
```

### wireguard.env

```
SERVERURL= #Optional
```

## Deploy

```
DOCKER_HOST="ssh://user@host" docker-compose up --build -d
```