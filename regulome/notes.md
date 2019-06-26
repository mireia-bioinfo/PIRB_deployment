# Notes on IRB Docker

- [Docker cheatsheet](https://github.com/wsargent/docker-cheat-sheet)

## Success!
- `regulomedeps:latest` downloaded from local registry and pushed to public registry, now accessible.
    - Try to reverse engineer with `docker history`, or [`dive`](https://github.com/wagoodman/dive)
- Private git repos now public on github --> Changed Dockerfile accordingly.
- Building final docker image for regulome __works__. 

## Still struggling
- `docker-compose` for the IRB does not work in Mac, because `syslog`. --> Try in Ubuntu.
- Not able to test standalone Docker image --> No data available (6GB).
    - Data in gattaca and download.
    - Data in Dockerfile directory so it is added to build context.
    - R package with data.