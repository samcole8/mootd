# mootd

![](https://img.shields.io/badge/status-maintained-green)[![](https://img.shields.io/badge/release-v1.0.0_"Bongo"-blue)](https://github.com/samcole8/mootd/releases/latest)

mootd is a lightweight container that serves an RNG MOTD using Cowsay and Fortune.

For example:

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
          \_______
 v__v    \   O   )
 (oo)     ||----w |
 (__)     ||     ||  \/\
```

## Configuration

### Update Interval

You can modify the update interval of the MOTD by editing the cron string in line 12 of the Dockerfile.

```RUN echo -e '0 0 * * * /root/mootd.sh\n' | crontab -u root -```

In the example above, you could change "0 0 * * *" to "0 0 * * 1" to update the MOTD weekly. If you aren't sure, use a [cron expression generator](https://crontab.guru/)

### Cow chance

Change the chance for an atypical cow by modifying the *chance* variable in *renew.sh*. The default is 1 in 10.

`chance=10`

This number is a reciprocal of the probability—so to achieve a 1 in 100 probability you would change *chance* to 100.

## Usage

The image requires a compiled version of api.go. Assuming you have go installed, you can do this with the command below.  
*Note: CGO_ENABLED=0 is used to disable C dependencies. Without this, the service will not run.* 

```bash
CGO_ENABLED=0 go -o /path/to/mootd/mootd/bin build api.go 
```

To build the container image, `cd` to the mootd directory and run:

`docker build -t mootd .`

To build and run the container, use:

`docker run --name mootd -p 80:80 -d mootd`

*Note: This assumes you want to expose the container to other devices on your network. If you just want access on your machine, omit the `-p 80:80` flag.*
