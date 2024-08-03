# Stage 1:dowanload JMusicBot.jar
FROM cycloid/github-cli as downloader
ENV GH_TOKEN=$GH_TOKEN
WORKDIR /app
RUN gh release download --pattern "JMusicBot-*.jar" --repo jagrosh/MusicBot
RUN mv JMusicBot-*.jar JMusicBot.jar

# Stage 2: execution JMusicBot
FROM eclipse-temurin:11-jre-focal
ENV DC_OWNER_ID=$DC_OWNER_ID
ENV DC_TOKEN=$DC_TOKEN
WORKDIR /app 
COPY --from=downloader /app/JMusicBot.jar /app/JMusicBot.jar
COPY config.txt /app/config.txt
ENTRYPOINT ["java", "-Dconfig=/app/config.txt", "-Dnogui=true", "-jar", "/app/JMusicBot.jar"]