#! /bin/bash
echo "eula=true" > /minecraft/data/eula.txt

# configure
echo > /minecraft/data/server.properties
sed -i "s/<<rcon_password>>/${MC_RCON_PASSWORD}/g" /minecraft/server.properties.template
sed -i "s/<<motd>>/${MC_MOTD}/g" /minecraft/server.properties.template
sed -i "s/<<whitelist>>/${MC_WHITELIST}/g" /minecraft/server.properties.template

cp /minecraft/server.properties.template /minecraft/data/server.properties

cd /minecraft/data && java -Xmx${MC_MEM_MAX} -Xms${MC_MEM_MIN} -jar spigot.jar nogui