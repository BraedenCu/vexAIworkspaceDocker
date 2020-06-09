# vexAIworkspaceDocker
In the following I am using my container, named vexai3 
to run :docker run --name vexai3 -it vexaiimage /bin/bash
to copy files from host to container, do docker cp foo.txt mycontainer:/foo.txt
to run from use do: docker run -t -i --device=/dev/ttyUSB0 ubuntu bash
to stop: docker stop vexai3
to pause: docker pause vexai3
to start a previously built docker container: docker start -a -i vexai3

Use full pre-built images for the jetson: https://ngc.nvidia.com/catalog/containers/nvidia:l4t-tensorflow
