FROM openjdk:25-jdk-slim-bullseye

# I am using 8G system with 30GB of storage, different systems might need manual validation
ENV EULA=true \
    MAX_MEMORY=5G \
    MIN_MEMORY=2G \
    GC_MAXPAUSE=100 \
    GC_NEWSIZEPERCENT=50 \
    GC_MAXNEWSIZEPERCENT=80 \
    JAVA_OPTS="-Xms${MIN_MEMORY} -Xmx${MAX_MEMORY} -XX:+UseG1GC \
               -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=${GC_MAXPAUSE} \
               -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=${GC_NEWSIZEPERCENT} \
               -XX:G1MaxNewSizePercent=${GC_MAXNEWSIZEPERCENT} -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AlwaysPreTouch"

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends bash curl && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /minecraft_fabric_server

# Set up mods directory
RUN mkdir -p mods

# Download server and mods
RUN curl https://meta.fabricmc.net/v2/versions/loader/1.21.4/0.16.9/1.0.1/server/jar -o fabric_server.jar
RUN curl https://cdn.modrinth.com/data/P7dR8mSH/versions/d6uc3lSM/fabric-api-0.112.2%2B1.21.4.jar -o mods/fabric-api-0.112.2+1.21.4.jar
RUN curl https://cdn.modrinth.com/data/aZj58GfX/versions/cNfqAFbs/easyauth-mc1.21.2-3.0.27.jar -o mods/easyauth-mc1.21.2-3.0.27.jar

# Expose Minecraft server port
EXPOSE 25565

# Persist Minecraft data
VOLUME ["/minecraft_fabric_server/data"]

# Copy startup script
COPY ./startup_docker.sh /minecraft_fabric_server/startup_docker.sh

# Ensure the startup script is executable
RUN chmod +x /minecraft_fabric_server/startup_docker.sh

# Define entry point
ENTRYPOINT ["/minecraft_fabric_server/startup_docker.sh"]
