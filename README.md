# DevOps Test

This repository contains a simple Spring Boot demo application packaged in Docker and deployed with Helm. The application is served behind an Nginx ingress and acts as the backend for a React frontend stored in a separate repository.

## Workflows

- **CI / Kind + Helm** – Runs for pull requests. It builds the application, loads the image into a local Kind cluster and installs the Helm chart for smoke testing. Docker images are tagged with the short commit SHA.
- **CD / Helm upgrade** – Runs on pushes of git tags that start with `v`. Each run builds and pushes a Docker image tagged with the current UTC date (e.g. `v2025-07-28-00-00-00`) and upgrades the chart in the cluster using that tag.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

