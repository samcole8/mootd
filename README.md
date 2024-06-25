# mootd

![](https://img.shields.io/badge/status-maintained-green) [![](https://img.shields.io/badge/release-v1.3.0--jaguarundi-blue)](https://github.com/samcole8/mootd/releases/latest)

mootd is a lightweight container that serves an RNG message-of-the-day (MOTD) using Cowsay and Fortune.

```bash
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

## Features

- The MOTD updates at a fixed interval
- Messages are always random
- Cows have a fixed chance to be atypical—if so a unique "cow" is selected at random (see below)
- There are around 50 different cows packaged with cowsay

```bash
         O\_______
 v__v    \        )\/\
 (oo)     ||----w |
 (__)     ||     ||  
```

## Configuration

### Update Interval

You can modify the update interval of the MOTD by editing the cron string on line 20 of the Dockerfile.

```Dockerfile
RUN echo -e '0 0 * * * /root/mootd.sh\n' | crontab -u root -
```

In the example above, you could change `0 0 * * *` to `0 0 * * 1` to update the MOTD weekly. If you aren't sure, use a [cron expression generator](https://crontab.guru/).

### Cow chance

Change the chance for an atypical cow by modifying the `chance` variable in `renew.sh`. The default is 1 in 10.

This integer is the probability's reciprocal; for example, to achieve a 1 in 100 probability you would change `chance` to 100.

## Deployment

### Docker

#### Build the image

To build the container image, `cd` to the `./mootd` directory and run:

```bash
docker build -t mootd .
```

#### Run the container

To run the container, use the following command.

```bash
docker run --name mootd -p 80:80 -d mootd
```

*Note: This assumes you want to expose the container to other devices on your network. If you just want access on your machine, omit the `-p 80:80` flag.*

### Docker Compose

If you'd prefer to use Docker compose, the following script will achieve the same result:

```yml
services:
  mootd:
    build:
      context: "./mootd"
    ports:
      - 80:80
```

*Note: This assumes you want to expose the container to other devices on your network. If you just want access on your machine, omit the `ports` section.*