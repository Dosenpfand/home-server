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
* Hosting zug.lol

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
```

### wireguard.env

```
WG_HOST=
PASSWORD_HASH= # https://github.com/wg-easy/wg-easy/blob/v14/How_to_generate_an_bcrypt_hash.md
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
### letsencrypt.env

```
DEFAULT_EMAIL=
```

### backup.env

```
RESTIC_REPOSITORY=
RESTIC_PASSWORD=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
GOMAXPROCS=1
```

### zug-lol.env

```
POSTGRES_USER=zug
POSTGRES_PASSWORD=
POSTGRES_DB=zug
FLASK_SQLALCHEMY_DATABASE_URI=postgresql+psycopg2://${POSTGRES_USER}:${POSTGRES_PASSWORD}@zug-lol-db:5432/${POSTGRES_DB}
ZUG_DB_USERNAME=${POSTGRES_USER}
ZUG_DB_PASSWORD=${POSTGRES_PASSWORD}
FLASK_SECRET_KEY=
FLASK_SECURITY_PASSWORD_SALT='""'
FLASK_RECAPTCHA_PUBLIC_KEY=""
FLASK_RECAPTCHA_PRIVATE_KEY=""
SENTRY_DSN=""
HETZNER_AUTH_API_TOKEN=
HETZNER_ZONE_NAME=zug.lol
HETZNER_RECORD_NAME=@
```

## Deploy

### Setup host

1. Install latest Debian
2. Install Docker: https://docs.docker.com/engine/install/debian/#install-using-the-repository
3. Install dependencies:
    ```
    sudo apt-get install avahi-daemon avahi-utils rsync htop
    ```
4. Deploy SSH key
   ```
   ssh-copy-id -i id_rsa.pub m@$host
   ```
5. Adapt sshd config: Increase `MaxStartups`, `MaxSessions`;

### Run containers

```
DOCKER_HOST="ssh://user@host" docker-compose up --build -d
```

## Power / Energy consumption

On an "Intel NUC 12 Pro Kit - NUC12WSHi3" during August 2023 `7.83 W` or `68.61 kWh/y`.
This equates to roughly `15-20`` € yearly energy cost.
