FROM ubuntu:trusty

COPY bootstrap.csproj /app/bootstrap.csproj

RUN apt-get update \                                                      
&& apt-get install -y apt-transport-https \
&& sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ trusty main" > /etc/apt/sources.list.d/dotnetdev.list'  \
&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893 \
&& apt-get update \
&& apt-get install -y dotnet-dev-1.0.1 \
&& dotnet restore /app/bootstrap.csproj

WORKDIR /app


ENTRYPOINT ["dotnet", "vstest bootstrap.csproj"]
