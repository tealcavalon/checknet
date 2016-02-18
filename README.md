# checknet
This is little script to check if my router &amp; Raspberry PI can connect to the internet

Just copy the script to /etc or something like that and them make it executable
chmod u+x checknet.sh

Them edit your crontab to add the fucntion to run the file

sudo crontab -e

*/10 * * * * /bin/sh /path/to/checknet.sh
