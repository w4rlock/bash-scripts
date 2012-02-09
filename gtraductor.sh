#!/bin/bash

if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then

 echo    "Traduce textos usando el traductor de Google"
 echo
 echo 	Uso: traducir [Frase] [Idioma Origen] [Idioma Destino]
 echo 	[Frase]: Frase a traducir.
 echo 	[Idioma actual"/"deseado]: es \(español\), fr \(frances\), etc.
 echo
 echo
 exit
fi
# Reemplaza los espacios en blanco ' ' por %20
AT="$(echo -e $1 | sed  's/ /%20/g';)"

# Setear por defecto en caso de no ingresar
DEL="en"
AL="es"

#Resultado en color
echo -e "\033[31;1m"

#Testea parametros vacios [origen][destino]
if [ -z $2 ] || [ -z $3 ]; then
# Consulta a google
lynx -dump "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$AT&langpair=$DEL%7C$AL" | sed 's/"}, "responseDetails": null, "responseStatus": 200}//g' | sed 's/{"responseData": {"translatedText":"//g'
else
lynx -dump "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$AT&langpair=$2%7C$3" | sed 's/"}, "responseDetails": null, "responseStatus": 200}//g' | sed 's/{"responseData": {"translatedText":"//g'
fi

#Cierra color
echo -e "\033[0m"

echo ""
