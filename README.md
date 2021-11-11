# all-in-one-hackazon
2
​
3
Run a docker container include hackazon, apache, mysql, and nodejs with express server
4
​
5
This work is based on https://github.com/cmutzel/all-in-one-hackazon
6
​
7
# Instructions
8
​
9
To build the container:
10
docker build --rm -t bepsoccer/all-in-one-hackazon .
11
​
12
then run via: 
13
docker run --name hackazon -d -p 80:80 bepsoccer/all-in-one-hackazon
14
​
15
Login into hackazon at http:// (( your host here... )) and begin configuring...  You can just select to use the existing db password as it is set in the startup script.  The admin password will be the same as the db password and is echoed at startup and can be found in /hackazon-db-pw.txt.
