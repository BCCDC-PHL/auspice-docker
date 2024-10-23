# BCCDC-PHL Auspice Docker Image

This repo contains a `Dockerfile` that can be used to build a container that runs [Auspice](https://docs.nextstrain.org/projects/auspice/en/stable/index.html), the web-based
interactive phylogenetics application.

This `Dockerfile` is configured to build code from [BCCDC-PHL/auspice](https://github.com/BCCDC-PHL/auspice), our fork of [nextstrain/auspice](https://github.com/nextstrain/auspice).


## Building the container

```
git clone git@github.com:BCCDC-PHL/auspice-docker.git

cd auspice-docker

docker build . -t bccdc-phl/auspice
```

## Running the container

Prepare a `datasets` and `narratives` dir somewhere on the host filesystem:

```
mkdir -p /path/to/datasets

mkdir -p /path/to/narratives
```

Place any nextstrain dataset and narrative files there.

```
docker run -d\
  --name auspice \
  -p 4000:4000 \
  -v /path/to/datasets:/nextstrain/auspice/datasets \
  -v /path/to/narratives:/nextstrain/auspice/narratives \
  bccdc-phl/auspice
```

The application should be available on [http://localhost:4000](http://localhost:4000).

## Pulling the Container from GitHub Container Registry

Pulling the container from the [GitHub Container Registry](https://github.com/features/packages) (aka "GitHub Packages") requires a GitHub account and a
[personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens).

First store the personal access token to an environment variable `CR_PAT`, then login to the container registry as follows:

```
export CR_PAT="ghp_a68fgN8..."
echo $CR_PAT | docker login ghcr.io -u <GITHUB_USERNAME> --password-stdin
```

The container can then be pulled as follows:

```
docker pull ghcr.io/bccdc-phl/auspice:release
```