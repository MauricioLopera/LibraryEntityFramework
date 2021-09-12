using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using LibraryML.Data;

namespace LibraryML.Tests
{
    [TestClass]
    public class LibrosTest
    {
        [TestMethod]
        public void Test_CreaLibroconEditorialValida()
        {
            //Datos
            string titulo = "Libro de Prueba";
            string sinopsis = "Lorem";
            int añopub = 2021;
            int editorialID = 6;
            string fecha = "12/09/2021";

            LibroAdmin prueba = new LibroAdmin();

            //ejecutamos
            prueba.Guardar(0, titulo, sinopsis, añopub, editorialID, fecha);

            Assert.ThrowsException<InvalidOperationException>(() => prueba.Guardar(0, "", "", 0, 0, ""));
        }
    }
}
