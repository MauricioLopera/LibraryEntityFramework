using LibraryML.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryML.Data
{
    public class AutorAdmin
    {
        public List<Autores> ConsultaGen()
        {
            using(DesafioMLEntities contexto = new DesafioMLEntities())
            {
                return contexto.Autores.AsNoTracking().ToList();
            }
        }

        //Consulta los datos de un autor
        public Autores ConsultaID(int id = 0)
        {
            using (DesafioMLEntities contexto = new DesafioMLEntities())
            {
                return contexto.Autores.FirstOrDefault(l => l.id == id);
            }
        }

        //Guardar datos con Store Procedure
        public void Guardar(long id, string nombre, string fecha)
        {
            using (DesafioMLEntities contexto = new DesafioMLEntities())
            {
                contexto.SP_Autores_INUP(id, nombre,fecha);
                contexto.SaveChanges();
            }
        }
    }
}