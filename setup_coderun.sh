docker build . -t code-server-python:latest

mkdir -p ~/.config

# install extensions
docker run -it --rm --name code-server \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  code-server-python:latest \
  --user-data-dir user_data \
  --install-extension ms-python.python