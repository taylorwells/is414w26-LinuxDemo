# Debian Linux Demo Container

Silly container with SSH for doing some in-class demonstration.

- Make sure docker is running
- Run and build the container using `docker compose up -d --build`
- SSH into the container using `ssh -p 414 rootkit@localhost`
- Password: `rootkit`
- When you are done: `docker compose down` and delete the container to save space
