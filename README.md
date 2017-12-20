<h1 align="center">go-base</h1>

<p align="center">
  <a href="https://circleci.com/gh/vidsy/go-base" target="_blank">
    <img src="https://img.shields.io/circleci/project/vidsy/go-base.svg?maxAge=2592000">
  </a>
  <img src="https://img.shields.io/docker/stars/vidsyhq/go-base.svg?maxAge=2592000">
  <img src="https://img.shields.io/docker/pulls/vidsyhq/go-base.svg?maxAge=2592000">
</p>

<p align="center">
  Base Docker image for <b>Vidsy.co</b> Go services.
</p>

## Usage

```yaml
FROM vidsyhq/go-base:latest
...
```
- Image uses the [gliderlabs/alpine](https://github.com/gliderlabs/docker-alpine) as it's **base** image.

## Vidsy

The engineering team @ [Vidsy.co](http://brands.vidsy.co) write **Go microservices**, all deployed to AWS in Docker containers.
