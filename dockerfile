# Stage 1:dowanload JMusicBot.jar
FROM cycloid/github-cli as downloader
ARG GH_TOKEN
ARG DC_OWNER_ID
ARG DC_TOKEN
ENV GH_TOKEN=$GH_TOKEN
ENV DC_OWNER_ID = $DC_OWNER_ID
ENV DC_TOKEN = $DC_TOKEN
WORKDIR /app
RUN gh release download --pattern "JMusicBot-*.jar" --repo jagrosh/MusicBot
RUN mv JMusicBot-*.jar JMusicBot.jar

# Stage 2: generate config.txt
FROM alpine as config-generator
ENV DC_TOKEN=$DC_TOKEN
ENV DC_OWNER_ID=$DC_OWNER_ID
COPY config.template.txt /app/config.template.txt
COPY generate-config.sh /app/generate-config.sh
WORKDIR /app
RUN chmod +x /app/generate-config.sh
RUN /app/generate-config.sh

# Stage 3: execution JMusicBot
FROM eclipse-temurin:11-jre-focal
COPY --from=downloader /app/JMusicBot.jar /app/JMusicBot.jar
COPY --from=config-generator /app/config.txt /app/config.txt
WORKDIR /app 
ENTRYPOINT ["java", "-Dconfig=/app/config.txt", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]