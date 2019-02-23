# compile and build objects
FROM microsoft/dotnet AS dev
WORKDIR /app
COPY * ./
RUN dotnet restore
RUN dotnet publish -c Release -o out
# runtime image
FROM microsoft/dotnet
WORKDIR /app
COPY --from=dev /app/out .
ENTRYPOINT ["dotnet", "app.dll"]
