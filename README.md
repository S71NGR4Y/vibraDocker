# all-in-one-Vibranium

Run a docker container include Vibranium, apache, mysql, and nodejs with express server

This work is based on Vibranium

# Instructions

To build the container:
docker build --rm -t Vibranium

then run via: 
docker run --name Vibranium -d -p 80:80 Vibranium

Login into Vibranium at http:// (( your host here... )) and begin configuring...
