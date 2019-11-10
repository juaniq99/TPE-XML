#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Error de cantidad de argumentos"
	exit 1
fi

error=0
echo "$1" | egrep "^[0-9]+$" &> /dev/null
if [ $? -ne 0 ]
then
	echo "Error de argumento, ingrese un numero entero"
	let error=1
elif [ 0 -gt $1 ]
then
	echo "Error de argumento, su numero no es positivo"
	let error=1
elif [ ! -e data.xml ]
then
	echo "Error, falta data.xml"
	let error=1
elif [ ! -e metadata.xml ]
then
	echo "Error, falta metadata.xml"
	let error=1
elif [ ! -e xml_query.xq ]
then
	echo "Error, falta xml_query.xq"
	let error=1
elif [ ! -e json_convert.xsl ]
then
	echo "Error, falta json_convert.xsl"
	let error=1
fi

if [ $error -eq 0 ]
then
	java net.sf.saxon.Query xml_query.xq years=$1 > intermediate.xml
	java net.sf.saxon.Transform -s:intermediate.xml -xsl:json_convert.xsl -o:output.json
	exit 0 
else
	exit 1
fi
