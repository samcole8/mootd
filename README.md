# cowfort

An small Alpine/Nginx container that serves an RNG-based MOTD using Cowsay and Fortune.

Cows have a 10% chance of being non-default, after which they are equally randomised. Fortune messages are always equally randomised.

## Usage

To build the container image, `cd` to the cowfort directory and run:

`docker build -t cowfort`

To build and run the container, use:

`docker run --name cowfort -p 80:80 -d cowfort`

*Note: This assumes you want to expose the container to other devices on your network. If you just want access on your machine, omit the `-p 80:80` flag.*
