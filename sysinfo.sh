#!/bin/bash

CORES=$(cat /proc/cpuinfo | grep processor | wc -l)
MEMORY=$(cat /proc/meminfo | grep MemTotal | sed 's/[^0-9.]//g')
SPACE=$(cat /proc/meminfo | grep SwapTotal | sed 's/[^0-9.]//g')

echo "Processor cores: $CORES; Available memory: $MEMORY килобайт; Disk Space: $SPACE килобайт" > /usr/share/nginx/html/sys.txt

cat > /usr/share/nginx/html/index.html << EOF
<html>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<br>
<iframe src="./sys.txt"></iframe>
<br>
</html>
EOF

echo "chmod 0777 /usr/share/nginx/html -R"



