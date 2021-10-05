from conexion import conexion

class crudUsuario:
   def __init__(self, miHost, miDatabase, miUser, miPassword):     # Constructor
      self.miConn = conexion(miHost, miDatabase, miUser, miPassword)

   def selectUsuario (self):
      miQuery = "select * from usuario order by usuId;"
      rta = self.miConn.consultar(miQuery)
      return rta

   def insertUsuario (self, id, nom, ape, email, passwd, rol):
      miQuery = "Insert into usuario values "+\
                "("+id+", '"+nom+"', '"+ape+"', '"+email+"', '"+passwd+"', "+rol+");"
      self.miConn.escribir(miQuery)

   def updateUsuario(self, id, nom, ape, email, passwd, rol):
      miQuery = "update usuario set usuId="+id+", "+\
                                   "usuNom='"+nom+"', "+\
                                   "usuApe='"+ape+"', "+\
                                   "usuEmail='"+email+"', "+\
                                   "usupass='"+passwd+"', "+\
                                   "usurol="+rol+\
                                "where usuId="+id+");"
      self.miConn.escribir(miQuery)

   def deteUsuario(self, id):
      miQuery = "delete from usuario where usuId="+id+");"
      self.miConn.escribir(miQuery)

   def cerrar_conexion(self):
      self.miConn.cerrar()