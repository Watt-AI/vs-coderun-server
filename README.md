# VS CodeRun Server
Remotely host VS Code and run it in your browser from anywhere. This code is designed to serve development 
environments from the Nvidia DGX-1 or Clemson's Palmetto Cluster. 

# Setting up a new deployment
1. In a terminal, navigate to the directory for your project to download to prepare the code needed to serve coderun
```shell
echo "vs-coderun-server/" >> .gitignore
git clone https://github.com/Watt-AI/vs-coderun-server.git
cd vs-coderun-server
rm -rf .git
```
2. Add any python requirements to the `requirements.txt` folder.
3. Set the desired port and project directory
```shell
export CR_PORT=<port>
export CR_PROJECT_DIR=<project_dir>
export CR_CONTAINER_NAME=<container_name>
```
Alternatively, edit the `set_envs.sh` script with your desired environment variables and then
execute `source set_envs.sh` to set the variables.
4. From within `vs-coderun-server/`, execute
```shell
sh setup_coderun.sh
```
This first builds the docker image then installs the python extensions. 
This compiles python from scratch for performance
reasons and can take a few minutes the first time it runs.
5. Navigate up to your project directory and execute the following comand to run the server
```shell
sh vs-coderun-server/run.sh
```
