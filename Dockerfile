# Use the official image as a parent image.
FROM ubuntu:latest

# Set the working directory.
WORKDIR /usr/mc/

# Copy the rest of your app's source code from your host to your image filesystem.
COPY server.properties .

# Agree to Minecraft EULA
COPY eula.txt .

# Copy the rest of your app's source code from your host to your image filesystem.
ARG worldorigin="20200505-bluehouse-mc/the bluehouse korea_0505"
COPY ${worldorigin} ./world

# Download Minecraft Server
CMD [ "wget", "https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar" ]

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 25565

# Run the specified command within the container.
CMD [ "java", "-jar", "server.jar" ]
