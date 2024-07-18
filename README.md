# Server Monitoring tool

## Build

To build this image run the following command:
```bash
docker build -t JayPi4c/monitoring:1.0.0 .
```
You may update the tag to your liking.

## Run

To run the image, execute the following command. You need to copy the env.list.example file (`cp env.list.example env.list`) and fill it with the correct values.

```bash
docker run --env-file ./env.list JayPi4c/monitoring:1.0.0
```

## Docker compose

Instead of manually building and running the image you may as well use the `docker-compose.yml` file that combines the building and running into one file:

1. Clone the repo
2. Build and run the project: `docker compose up`  

