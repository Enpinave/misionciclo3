import psycopg2

class conexion:                                                  # Definicion de la Clase
    def __init__(self, miHost, miDatabase, miUser, miPassword):     # Constructor
        try:
                                                                    # conn es un atributo de la clase por eso lleva el self
            self.conn = psycopg2.connect(
                host = miHost, 
                database = miDatabase, 
                user = miUser, 
                password = miPassword) 
   
            self.cur = self.conn.cursor()                           # Objeto encargado de Ejecutar las Querys 
   
        except:
            print("Conexion no Lograda")
    
    def consultar(self, miQuery):
        try:
            self.cur.execute(miQuery)                               # Ejecutar la Query
            response = self.cur.fetchall()                          # Asignar la respuesta de la Query a response
        except (Exception, psycopg2.DatabaseError) as error:
            print("Error en conexion/consultar: ",error)
            response = "error"
        
        return(response)

    def escribir(self, miQuery):
        try:
            self.cur.execute(miQuery)                               # Ejecutar la Query
            self.conn.commit()                                     # Actualiza las Tablas
            response = "ok"            
        except (Exception, psycopg2.DatabaseError) as error:
            print("Error en  conexion/escribir: ",error)
            response = "error"
        
        return(response)
            
    def cerrar(self):
        self.cur.close()
        self.conn.close()