import json # Para dar formato JSON
from flask import Flask #clase Flask de extensión flask
from flask import request, make_response, redirect
from werkzeug.wrappers import response
from crudUsuario import crudUsuario
app = Flask(__name__) #instancia de Flask

#Ruta de Prueba
@app.route('/')#ruta en el navegador
def holaMundo():# Funcion que se realiza cuando se acceda a esa ruta
   numero=6
   texto='Hola Mundo: '+str(numero)
   return texto #Retorna el String
# Para Probar esto se corre este archivo y en un navegador se ingresa http://localhost:5000

#Consultar Ip 
@app.route('/ip')#ruta en el navegador
def ip():# Funcion que se realiza cuando se acceda a esa ruta
   userIp = request.remote_addr # Captura la Ip
   response = make_response(redirect('/consultarUsuario')) # Redirecciona 
   response.set_cookie('userIp', userIp) # Establece Cookie en el Navegador Desarrollo Clase22sep x2 35:00 min

   #rtaJson = json.dumps({"ip=":userIp})
   #return rtaJson
   return response

@app.route('/consultarUsuario')
def consultarUsuario():
    crud = crudUsuario("localhost", "miBD", "postgres", "12345")
    rta = crud.selectUsuario()
    registro = rta[0]
    #registro = "id="+str(primerRegistro[0])+" nom= "+str(primerRegistro[1])+" ape= "+str(primerRegistro[2])+" email= "+str(primerRegistro[3])+" passwd= "+str(primerRegistro[4])+" rol= "+str(primerRegistro[5])
    # La linea anterior retorna sin un formato standar
    la_ip = request.cookies.get('userIp')  #Recupera la cookie de ip
    rtaJson = json.dumps({"usuid=":registro[0]," usunom= ":registro[1]," usuape= ":registro[2]," usuemail= ":registro[3]," usupass= ":registro[4]," usurol= ":registro[5], "Ip=":la_ip})
    return rtaJson

@app.route('/consultarAllUsuario')
def consultarAllUsuario():
    crud = crudUsuario("localhost", "miBD", "postgres", "12345")
    rta = crud.selectUsuario()
    #allRegistro = ""
    #for registro in rta:
    #   allRegistro+= "id="+str(registro[0])+" nom= "+str(registro[1])+" ape= "+str(registro[2])+" email= "+str(registro[3])+" passwd= "+str(registro[4])+" rol= "+str(registro[5])+"</br>"
    #  La linea anterior retorna sin un formato standar 
    listaRegistro = []
    for registro in rta:
       listaRegistro.append({"usuid=":registro[0]," usunom= ":registro[1]," usuape= ":registro[2]," usuemail= ":registro[3]," usupass= ":registro[4]," usurol= ":registro[5]})
    rtaJson = json.dumps(listaRegistro)       
    return rtaJson



if __name__=="__main__": #Punto de Partida donde Python empieza a ejecutar
	while(True):
		print("starting web server")
		app.run(debug=False,host='0.0.0.0') # Arranca el Servidor 0.0.0.0 -> LocalHost
        # En el Navegador se accede localhost:5000/





# Para ejecurtar se ubica en la ruta de la carpeta en la terminal, y se lanza con python xxxx.py