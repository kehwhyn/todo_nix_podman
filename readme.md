
# Nix and Podman dev environment test

This project is a simples todo app stack to get started using nix as dev env.
You need to create a sqlite `todos.db` file at root level.

## Nix dev environment

On root folder run the following:

```sh
nix-shell
```

### Front-end

Go to the solidjs_todo folder and run:
```sh
npm i

npm run dev
```

See
http://localhost:3000

### Back-end

Go to back folder to run;:
```sh
uvicorn main:app --host localhost --port 8000
```

Interactive API documentation available at:
http://localhost:8000/docs


## Podman

Podman works similiar as Docker. At root level run:

```sh
podman compose up
```

### Front-end

```sh
podman build -t todo_frontend .

podman run --rm -it \
  --name frontend-dev \
  -p 3000:3000 \
  todo_frontend
```

### Back-end

Run container
```sh
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
