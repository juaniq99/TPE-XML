# TPE-XML
T.P. 2do Parcial
Grupo 5
Quintairos, Juan Ignacio. Leg: n° 59715
Riera Torraca, Valentino. Leg: n° 60212
Spitzner, Agustín. Leg: n° 60142

 _____  ______          _____  __  __ ______ 
|  __ \|  ____|   /\   |  __ \|  \/  |  ____|
| |__) | |__     /  \  | |  | | \  / | |__   
|  _  /|  __|   / /\ \ | |  | | |\/| |  __|  
| | \ \| |____ / ____ \| |__| | |  | | |____ 
|_|  \_\______/_/    \_\_____/|_|  |_|______|

*********************************************************************************************************
Para el correcto funcionamiento del programa se requiere:
*********************************************************************************************************
Tener instalado:
Java
Un parser, como el proporcionado por Apache: Xerces.
Saxon-HE 9.5.1.10
*********************************************************************************************************
Contener los siguientes archivos en la misma carpeta que tp.sh:
data.xml
metadata.xml
xml_query.xq 
json_convert.xsl
En caso de que falte alguno, el programa le informará.
*********************************************************************************************************
Primero, es necesario descomprimir el archivo TPE.zip. Para esto correr el comando "unzip TPE.zip"
*********************************************************************************************************
Darle los permisos de ejecución a tp.sh: correr el comando “chmod u+x tp.sh”
*********************************************************************************************************
Ejemplo de invocación del programa(Encontrándose en la carpeta contenedora del mismo):

bash tp.sh 4

donde 4 debe ser remplazado por el parámetro deseado
*********************************************************************************************************
El programa solo aceptará un argumento, este debe ser un número entero positivo o cero.
Caso contrario, será indicado por el mismo con un error.
*********************************************************************************************************


