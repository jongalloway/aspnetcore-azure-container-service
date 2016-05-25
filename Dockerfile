FROM microsoft/dotnet-preview

# Commented because I'm using basic web app template - no auth / EF
# RUN printf "deb http://ftp.us.debian.org/debian jessie main\n" >> /etc/apt/sources.list
# RUN apt-get -qq update && apt-get install -qqy sqlite3 libsqlite3-dev && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app

RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]

ENV ASPNETCORE_SERVER.URLS=http://0.0.0.0:5000/

EXPOSE 5000/tcp
ENTRYPOINT ["dotnet", "run"]