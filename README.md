# DevOps Demo — .NET Web API with Docker & GitHub Actions

A production-style CI/CD pipeline built to demonstrate DevOps skills.

## What this project does
- A .NET 8 Web API containerized with Docker
- Every push to `main` automatically builds and pushes the Docker image to Docker Hub
- No manual steps needed after the initial setup

## Tech Stack
- .NET 8 Web API
- Docker (multi-stage build)
- GitHub Actions (CI/CD pipeline)
- Docker Hub (image registry)

## Project Structure
```
devops-demo/
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Actions pipeline
├── DemoApi/
│   ├── DemoApi.csproj      # .NET project file
│   ├── Program.cs          # App entry point
│   └── Controllers/        # API endpoints
├── Dockerfile              # Multi-stage Docker build
└── README.md
```

## How to run locally

### Without Docker
```bash
cd DemoApi
dotnet run
# Visit http://localhost:5000/weatherforecast
```

### With Docker
```bash
docker build -t demo-api .
docker run -p 8080:8080 demo-api
# Visit http://localhost:8080/weatherforecast
```

## CI/CD Pipeline
The `.github/workflows/deploy.yml` pipeline:
1. Triggers on every push to `main`
2. Spins up a fresh Ubuntu runner
3. Builds the Docker image
4. Logs into Docker Hub using GitHub Secrets
5. Pushes the image to `monisdocker/demo-api:latest`

## Docker Hub
Image is publicly available at:
`docker pull monisdocker/demo-api`

## Key Concepts Learned
- Multi-stage Docker builds (smaller final image)
- GitHub Actions secrets (never hardcode credentials)
- Automated CI/CD (push code → deploy automatically)