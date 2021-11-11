# all-in-one-ShoppingStreet

Run a docker container include ShoppingStreet, apache, mysql, and nodejs with express server

This work is based on https://github.com/cmutzel/all-in-one-ShoppingStreet

# Instructions

To build the container:
docker build --rm -t bepsoccer/all-in-one-ShoppingStreet .

then run via: 
docker run --name ShoppingStreet -d -p 80:80 bepsoccer/all-in-one-ShoppingStreet

Login into ShoppingStreet at http:// (( your host here... )) and begin configuring...  You can just select to use the existing db password as it is set in the startup script.  The admin password will be the same as the db password and is echoed at startup and can be found in /ShoppingStreet-db-pw.txt.