## dev env

enter root folder

```sh
nix-shell
```


## Frontend

### run

dev env
```sh
npm i

npm run dev
```

Run container
```sh
podman build -t todo_frontend .

podman run --rm -it \
  --name frontend-dev \
  -p 3000:3000 \
  todo_frontend
```


See
http://localhost:3000


## Backend

### run

dev env
needs to be in backend folder to run
```sh
uvicorn main:app --host localhost --port 8000
```

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

Interactive API documentation available at:
http://localhost:8000/docs

## tech stack

front: csr, node, npm, solidjs
back: python, fastapi, sqlalchemy, pydantic, uvicorn
db: sqlite
devops(?): podman
