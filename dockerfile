FROM vdhwouter/craftbukkit
MAINTAINER vandenheede.wouter

RUN mkdir -p /craftbukkit

RUN curl http://tcpr.ca/files/craftbukkit/craftbukkit-1.9.2-R0.1-SNAPSHOT-latest.jar -o /craftbukkit/craftbukkit.jar

RUN echo "#!/bin/bash\ncd /craftbukkit/\njava -Xmx1536M -jar craftbukkit.jar -o false" > /usr/local/bin/craftbukkit
RUN chmod +x /usr/local/bin/craftbukkit

RUN echo "[]" > /craftbukkit/banned-players.json
RUN echo "[]" > /craftbukkit/banned-ips.json
RUN echo "[]" > /craftbukkit/ops.json
RUN echo "[]" > /craftbukkit/whitelist.json

COPY src/ /craftbukkit/

EXPOSE 25565:25565

ENTRYPOINT craftbukkit
