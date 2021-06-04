# VS CodeRun Server
Remotely host VS Code and run it in your browser from anywhere. This code is designed to serve development 
environments from the Nvidia DGX-1 or Clemson's Palmetto Cluster. This is
a deployment of the code 
maintained at https://github.com/cdr/code-server customized for data science in python.  

# Setting up a new deployment
1. **Server source code:** In a terminal, navigate to the directory for your project to download to prepare the code needed to serve coderun
```shell
echo "vs-coderun-server/" >> .gitignore
git clone https://github.com/Watt-AI/vs-coderun-server.git
```
2. **Required environment variables:** You must the following environment variables for the server
to run correctly: 
    * `CR_PORT`: this is the port number for the web-server.
    * `CR_PROJECT_DIR`: this is the path to your project folder containing any data and code 
    that you will be working with. This directory is made available within VSCode.
    * `CR_CONTAINER_NAME`: this is the name of the docker container running the server. 
    The actual value doesn't matter very much, but the names of running containers must be 
      unique.
      
Set these variables by running: 
```shell
export CR_PORT=<port>
export CR_PROJECT_DIR=<project_dir>
export CR_CONTAINER_NAME=<container_name>
```

Alternatively, edit the `set_envs.sh` script with your desired environment variables and then
execute `source set_envs.sh` to set the variables.
3. **Dependencies:** the deploy script looks for a `requirements.txt` 
   file in `CR_PROJECT_DIR`. The dependencies listed in this file 
   are installed via pip while building the docker image. 
   
4. **Setup script:** From within `vs-coderun-server/`, execute
```shell
sh setup_coderun.sh
```
This script builds the docker image with any dependencies then 
installs the VSCode python extensions. For performance reasons, 
the build involves compiling python from scratch. This can take
a few minutes.

5. **Startup script:** Start the server by running
```shell
sh run.sh
```
This runs the container in attached mode allowing you to see the server terminal outputs.
You can detach the terminal without killing the server by pressing `ctrl+p, ctrl+q`.

# Accessing the server
Connect to the remote machine with
```shell
ssh -L <port>:localhost:<port> <username>@<host>
```
In your browser, navigate to `http://localhost:<port>`. 

