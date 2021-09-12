using LibraryML.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryML.Data
{
    public class LibroAdmin
    {
        //Carga todos los libros
        public List<V_listaLibros> ConsultaGen()
        {
            using(DesafioMLEntities contexto = new DesafioMLEntities())
            {
                return contexto.V_listaLibros.AsNoTracking().ToList();
            }
        }

        //Consulta los datos de un libro
        public V_listaLibros ConsultaID(int id=0)
        {
            using(DesafioMLEntities contexto = new DesafioMLEntities())
            {
                return contexto.V_listaLibros.FirstOrDefault(l => l.id == id);
            }
        }

        //Guardar datos con Store Procedure
        public void Guardar(long id, string titulo, string sinopsis, int añopub, long editorialID, string fecha)
        {
            using(DesafioMLEntities contexto = new DesafioMLEntities())
            {
                contexto.SP_Libros_INUP(id, titulo, sinopsis, añopub, editorialID, fecha);
                contexto.SaveChanges();
            }
        }

        public void AsociaAutor(long id, long autorID, long libroID, string fecha)
        {
            using(DesafioMLEntities contexto = new DesafioMLEntities())
            {
                contexto.SP_LibrosxAutor_INDEL(id, autorID, libroID, fecha);
                contexto.SaveChanges();
            }
        }

        //Cargo todos los autores relacionados al libro
        public List<V_autores_libros> ListaAutores(int id)
        {
            using (DesafioMLEntities contexto = new DesafioMLEntities())
            {
                return contexto.V_autores_libros.AsNoTracking().Where(a=>a.libroID==id).ToList();
            }
        }
    }
}