How to run
Download the Dockerfile from the folder where this README is located.
Download the application.yml configuration file from the folder where this README is located.
Place the files in the same directory, e.g. /home/user/sp
Create a docker network that ShinyProxy will use to communicate with the Shiny containers.

sudo docker network create sp-example-net

Open a terminal, go to the directory /home/user/sp, and run the following command to build the ShinyProxy image:

sudo docker build . -t shinyproxy-example

Run the following command to launch the ShinyProxy container:

sudo docker run -d -v /var/run/docker.sock:/var/run/docker.sock --net sp-example-net -p 8080:8080 shinyproxy-example


