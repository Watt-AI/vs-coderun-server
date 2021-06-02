# run server
docker run -it --rm --name code-server -p 0.0.0.0:8080:8080 \
  -v "$PWD:/home/coder/project" \
  -v "$PWD/user_data:/home/coder/user_data" \
  -v "$PWD/config.yaml:/home/coder/config.yaml" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  code-server-python:latest \
  --config /home/coder/config.yaml \
  --disable-update-check \
  --user-data-dir user_data