docker build . -t coderun:ubuntu

# install extensions
docker run -it --rm \
  -v "$CR_PROJECT_DIR:/home/coder/project" \
  -v "$PWD/user_data:/home/coder/user_data" \
  -v "$PWD/config.yaml:/home/coder/config.yaml" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  -e "SERVICE_URL=https://open-vsx.org/vscode/gallery" \
  -e "ITEM_URL=https://open-vsx.org/vscode/item" \
  coderun:ubuntu \
  code-server \
  --config /home/coder/config.yaml \
  --install-extension ms-python.python \
  --install-extension KevinRose.vsc-python-indent
