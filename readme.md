
# Nix and Podman dev environment test

This project is a simple todo app stack to get started using nix as dev env.
You need to create a sqlite `todos.db` file at root level.

## Nix dev environment

On root folder run the following:

```bash
nix-shell
```

### Front-end

Go to the solidjs_todo folder and run:
```bash
npm i

npm run dev
```

See
http://localhost:3000

### Back-end

Go to back folder to run;:
```bash
uvicorn main:app --host localhost --port 8000
```

Interactive API documentation available at:
http://localhost:8000/docs


## Podman

Podman works similiar as Docker. At root level run:

```bash
podman compose up
```

### Front-end

```bash
podman build -t todo_frontend .

podman run --rm -it \
  --name frontend-dev \
  -p 3000:3000 \
  todo_frontend
```

### Back-end

Run container
```bash
podman build -t todo_backend .

podman run --rm -it \
  --name backend-dev \
  -p 8000:8000 \
  -e DATABASE_URL=sqlite:////app/todos.db \
  -v $HOME/Documents/todo-app/todos.db:/app/todos.db \
  todo_backend
```

## Tech Stack

front: csr, node, npm, solidjs

back: python, fastapi, sqlalchemy, pydantic, uvicorn

db: sqlite

devops: podman
