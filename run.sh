# run server
mkdir -p ~/.config
docker run -it --rm --name $CR_CONTAINER_NAME -p "0.0.0.0:$CR_PORT:$CR_PORT" \
  --runtime=nvidia \
  -v "$CR_PROJECT_DIR:/home/coder/project" \
  -v "$PWD/user_data:/home/coder/user_data" \
  -v "$PWD/config.yaml:/home/coder/config.yaml" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  --env "PORT=$CR_PORT" \
  code-server-python:latest \
  --config /home/coder/config.yaml
