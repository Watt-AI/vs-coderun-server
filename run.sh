# run server
#mkdir -p ~/.config
docker run -it --rm --name $CR_CONTAINER_NAME -p "0.0.0.0:$CR_PORT:$CR_PORT" \
  --runtime=nvidia \
  --ipc=host \
  -v "$CR_PROJECT_DIR:/home/coder/project" \
  -v "$PWD/user_data:/home/coder/user_data" \
  -v "$PWD/config.yaml:/home/coder/config.yaml" \
  -w "/home/coder" \
  -e "DOCKER_USER=$USER" \
  -e "PORT=$CR_PORT" \
  -e "SERVICE_URL=https://open-vsx.org/vscode/gallery" \
  -e "ITEM_URL=https://open-vsx.org/vscode/item" \
  coderun:ubuntu /bin/bash -c \
  "code-server \
    --config /home/coder/config.yaml \
    --install-extension ms-python.python \
    --install-extension KevinRose.vsc-python-indent; \
  code-server \
    --config /home/coder/config.yaml"
