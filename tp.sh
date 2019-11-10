#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Error de cantidad de argumentos"
	exit 1
fi

echo "$1" | egrep "^[0-9]+$" &> /dev/null
error=0
if [ $? -ne 0 ]
then
	echo "Error de argumento, ingrese un numero entero"
	let error = 1
elif [ ! -e data.xml ]
then
	echo "Error, falta data.xml"
	let error=1
elif [ ! -e metadata.xml ]
then
	echo "Error , falta metadata.xml"
	let error=1
elif [ ! -e xml_query.xq ]
then
	echo "Error , falta xml_query.xq"
	let error=1
fi

if [ $error -eq 0 ]
then
	java net.sf.saxon.Query xml_query.xq years=$1 > intermediate.xml
	java net.sf.saxon.Transform -s:intermediate.xml -xsl:orig_json.xsl > output.json
	exit 0 
else
	exit 1
fi
