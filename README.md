# mootd

![](https://img.shields.io/badge/status-maintained-green) [![](https://img.shields.io/github/v/release/samcole8/mootd)](https://github.com/samcole8/mootd/releases/latest)

MOOTD is a tiny MOTD server that generates randomised daily messages using Cowsay and Fortune. All it requires is a host with Docker installed.

```
 ________________________________________ 
/ All the existing 2.0.x kernels are too \
| buggy for 2.1.x to be the main goal.   |
|                                        |
\ -- Alan Cox                            /
 ---------------------------------------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## Server


### Installation

If you haven't already, [install Docker](https://docs.docker.com/engine/install/). Then, use `docker compose` to build and run the container:

```bash
docker compose up -d
```

### Configuration

Define environment variables in the compose file (or run command) to override the defaults.

| Env            | Default    | Example         | Description                                                                                                                        |
| -------------- | ---------- | --------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `TZ`           | `UTC`      | `London/Europe` | Timezone used by the server.                                                                                                       |
| `RENEWAL_TIME` | `24:00:00` | `12:30:00`      | MOTD renewal time (HH:MM:SS).                                                                                                      |
| `CHANCE`       | `10`       | `100`           | Reciprocal chance for atypical cow. The example used gives a 1 in 100 chance of a random non-standard cow; the default is 1 in 10. |

## Client


The MOOTD "client" is a very simple bash script that you can execute in your `.bashrc` (or equivalent). It stores the current MOTD in a local file (`~/.mootd` by default), and updates it once it's expired.

### Installation

To install the client, add `mootd-client/mootd.sh` to your `.bashrc` or equivalent:

```
echo 'source mootd-client/mootd.sh' >> ~/.bashrc
```

### Configuration


You can modify several variables in the bash script to control how the client works. Most importantly, the `RENEWAL_TIME` and `MOOTD_URL` variables must match the server.


| Env            | Default                    | Example                   | Description                                    |
| -------------- | -------------------------- | ------------------------- | ---------------------------------------------- |
| `RENEWAL_TIME` | `24:00:00`                 | `12:30:00`                | MOTD renewal time (HH:MM:SS) for the server.   |
| `MOOTD_PATH`   | `~/.mootd`                 | `/srv/mootd`              | Location to save MOOTD. Must be read/writable. |
| `MOOTD_URL`    | `https://mootd.samcole.me` | `https://mysite.com:8080` | Server URL                                     |
