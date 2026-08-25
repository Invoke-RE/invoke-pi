## Invoke Pi

The [Pi coding agent](https://pi.dev/) is powerful and highly customizable. Dockerizing it allows portability and automated installation of useful extensions. This repo contains related Dockerfiles that are useful for headless malware analysis.

### Regular Coding Setup

`docker build -f Dockerfile -t pi-sandbox .`

### IDA Codemode (Now Nexus) Setup

#### Bulding

`docker build -f Dockerfile.ida-codemode -t pi-ida-codemode .`

#### Running

This assumes that your host OS is a Linux distribution with an IDA Pro version (9.4 minimum) installed in `~/ida-pro-9.4/`:

`docker run -it --rm  -v ~/.pi:/root/.pi -v $(pwd):/workspace -v ~/ida-pro-9.4/:/opt/ida -e IDADIR=/opt/ida -v ~/.ida-codemode/:/root/.idapro pi-ida-codemode`
