# dockerized-minecraft
Simple Minecraft server based on SpigotMC. 

## Sample Compose file
```yaml
version: '3.0'
volumes:
  mcdata:
services: 
  mcsrv:
    build:
      context: ./src
    ports:
      - 25565:25565
      - ${MC_RCON_PORT}:25575
    environment:
      MC_VERSION: 1.20.1
      MC_MEM_MIN: 4G
      MC_MEM_MAX: 8G
      MC_RCON_PASSWORD: ${MC_RCON_PW}
    volumes:
      - mcdata:/minecraft/data
      - ./plugins:/minecraft/data/plugins
```
