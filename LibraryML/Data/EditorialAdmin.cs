using LibraryML.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryML.Data
{
    public class EditorialAdmin
    {
        public List<Editoriales> ConsultaGen()
        {
            using (DesafioMLEntities contexto = new DesafioMLEntities())
            {
                return contexto.Editoriales.AsNoTracking().ToList();
            }
        }

        //Consulta los datos de una editorial
        public Editoriales ConsultaID(int id = 0)
        {
            using (DesafioMLEntities contexto = new DesafioMLEntities())
            {
                return contexto.Editoriales.FirstOrDefault(l => l.id == id);
            }
        }

        //Guardar datos con Store Procedure
        public void Guardar(long id, string nombre, string ciudad, string fecha)
        {
            using (DesafioMLEntities contexto = new DesafioMLEntities())
            {
                contexto.SP_Editoriales_INUP(id,nombre,ciudad,fecha);
                contexto.SaveChanges();
            }
        }
    }
}