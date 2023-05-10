# HOME-SERVER

Container configuration for a home server setup.

## Services

* Nextcloud
* DynDNS update for Hetzner DNS
* WireGuard
* Backup using restic
* Torrent using deluge
* Media server using jellyfin

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
WG_HOST=
PASSWORD=
```

### backup.env

```
RESTIC_REPOSITORY=
RESTIC_PASSWORD=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
GOMAXPROCS=1
```

## Deploy

```
DOCKER_HOST="ssh://user@host" docker-compose up --build -d
```