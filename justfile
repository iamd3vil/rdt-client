# Development commands. The server (net10.0) builds/runs/tests inside a
# .NET SDK container, so no local SDK is required. The Angular client
# builds locally into server/RdtClient.Web/wwwroot.

sdk_image := "mcr.microsoft.com/dotnet/sdk:10.0-alpine"
docker_dotnet := "docker run --rm -v " + justfile_directory() + "/server:/src -w /src -e DOTNET_CLI_TELEMETRY_OPTOUT=1 " + sdk_image

default:
    @just --list

# Start the dev server on http://127.0.0.1:6500 (data persists in dev/data)
up:
    docker compose -f dev/compose.yaml up -d

# Stop the dev server
down:
    docker compose -f dev/compose.yaml down

# Tail the dev server logs
logs:
    docker compose -f dev/compose.yaml logs -f

# Restart the dev server (picks up server code changes)
restart: down up

# Build the Angular client into server/RdtClient.Web/wwwroot
build-ui:
    cd client && npx ng build

# Install client dependencies
install-ui:
    cd client && npm ci

# Build the .NET solution
build:
    {{docker_dotnet}} dotnet build RdtClient.sln

# Run the .NET tests
test:
    {{docker_dotnet}} dotnet test RdtClient.sln
