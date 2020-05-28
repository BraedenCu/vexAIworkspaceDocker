# vexAIworkspaceDocker
To create and run the container: docker run --name vexai3 -it vexaiimage

To copy files from host to container, do docker cp foo.txt mycontainer:/foo.txt

To give docker access to usb devices run (for like a camera or something): docker run -t -i --device=/dev/ttyUSB0 ubuntu bash
