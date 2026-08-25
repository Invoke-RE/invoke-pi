## Invoke Pi

The [Pi coding agent](https://pi.dev/) is powerful and highly customizable. Dockerizing it allows portability and automated installation of useful extensions. This repo contains related Dockerfiles that are useful for headless malware analysis.

### Regular Coding Setup

#### Building 

`docker build -f Dockerfile -t pi-sandbox .`

#### Running 

`docker run -it --rm -v pi-home:/root/.pi -v $(pwd):/workspace pi-sandbox`

This will save all extensions in pi-home (within a dedicated Docker volume) if you don't want this, change it to `~/.pi` etc.

### IDA Codemode (Now Nexus) Setup

#### Building

`docker build -f Dockerfile.ida-codemode -t ida-nexus .`

#### Running

This assumes that your host OS is a Linux distribution with an IDA Pro version (9.4 minimum) installed in `~/ida-pro-9.4/`:

`docker run -it --rm  -v pi-home:/root/.pi -v $(pwd):/workspace -v ~/ida-pro-9.4/:/opt/ida -e IDADIR=/opt/ida -v ~/.ida-codemode/:/root/.idapro ida-nexus`

This also assumes your IDA license is in the `IDADIR` location.
