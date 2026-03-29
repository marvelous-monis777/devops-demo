# Stage 1 — Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY DemoApi/*.csproj ./DemoApi/
RUN dotnet restore ./DemoApi/DemoApi.csproj

COPY DemoApi/. ./DemoApi/
RUN dotnet publish ./DemoApi/DemoApi.csproj -c Release -o /app/publish

# Stage 2 — Run
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 8080
ENTRYPOINT ["dotnet", "DemoApi.dll"]