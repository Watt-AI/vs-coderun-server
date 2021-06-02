docker build . -t code-server-python:latest

# install extensions
docker run -it --rm --name code-server \
  -v "$PWD:/home/coder/project" \
  -v "$PWD/user_data:/home/coder/user_data" \
  -v "$PWD/config.yaml:/home/coder/config.yaml" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  code-server-python:latest \
  --config /home/coder/config.yaml \
  --install-extension ms-python.python