# HOME-SERVER

Container configuration for a home server setup.

## Services

* Nextcloud
* DynDNS update for Hetzner DNS
* WireGuard
* Backup using restic
* Torrent using deluge
* Media server using jellyfin
* Geocoder using Nominatim
* Flask web apps
* Photo archiving using Immich
* Website watches via changedetection.io

## Configuration

### dyndns.env

```
HETZNER_AUTH_API_TOKEN=
HETZNER_ZONE_NAME=
HETZNER_RECORD_NAME=
```

### nextcloud.env

```
POSTGRES_PASSWORD=
POSTGRES_DB=
POSTGRES_USER=

VIRTUAL_HOST=
LETSENCRYPT_HOST=
LETSENCRYPT_EMAIL=
```

### wireguard.env

```
WG_HOST=
PASSWORD=
```

## immich.env

```
DB_HOSTNAME=immich-database
DB_USERNAME=
DB_PASSWORD=
DB_DATABASE_NAME=immich

POSTGRES_PASSWORD: ${DB_PASSWORD}
POSTGRES_USER: ${DB_USERNAME}
POSTGRES_DB: ${DB_DATABASE_NAME}

REDIS_HOSTNAME=immich-redis

TYPESENSE_HOST=immich-typesense
TYPESENSE_API_KEY=

DISABLE_REVERSE_GEOCODING=false
REVERSE_GEOCODING_PRECISION=3

PUBLIC_LOGIN_PAGE_MESSAGE=

IMMICH_API_URL_EXTERNAL=
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