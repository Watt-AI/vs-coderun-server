docker build . -t code-server-python:latest

# install extensions
docker run -it --rm \
  -v "$CR_PROJECT_DIR:/home/coder/project" \
  -v "$PWD/user_data:/home/coder/user_data" \
  -v "$PWD/config.yaml:/home/coder/config.yaml" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  -e "SERVICE_URL=https://open-vsx.org/vscode/gallery" \
  -e "ITEM_URL=https://open-vsx.org/vscode/item" \
  code-server-python:latest \
  code-server \
  --config /home/coder/config.yaml \
  --install-extension ms-python.python \
  --install-extension KevinRose.vsc-python-indent