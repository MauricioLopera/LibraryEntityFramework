using LibraryML.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryML
{
    public partial class _Default : Page
    {
        //Creamos instancia de los objetos
        LibroAdmin Libro = new LibroAdmin();
        EditorialAdmin Editorial = new EditorialAdmin();
        AutorAdmin Autor = new AutorAdmin();

        //Metodo de consulta para llenar el gridview
        private void ConsultaGrid()
        {
            gridLibros.DataSource = Libro.ConsultaGen();
            gridLibros.DataBind();
        }

        //Metodo que carga los autores asociados al libro
        private void AutoresAsociados(int id)
        {
            gridautoresdet.DataSource = Libro.ListaAutores(id);
            gridautoresdet.DataBind();
        }

        //metodo de consulta para llenar el dropdownlist de editoriales
        private void LlenaEditorial()
        {
            listeditorial.DataSource = Editorial.ConsultaGen();
            listeditorial.DataTextField = "nombre";
            listeditorial.DataValueField = "id";
            listeditorial.DataBind();
        }

        //metodo de consulta para llenar el dropdownlist de autores
        private void LlenaAutor()
        {
            listautor.DataSource = Autor.ConsultaGen();
            listautor.DataTextField = "nombre";
            listautor.DataValueField = "id";
            listautor.DataBind();
        }

        //Metodo de consulta de un libro para edicion
        private void EditLibro(int id)
        {
            var modelo = Libro.ConsultaID(id);

            //cargo datos en pantalla
            txttitulo.Text = modelo.titulo;
            txtsinopsis.Text = modelo.sinopsis;
            txtaño.Text = Convert.ToString(modelo.Publicado);
            listeditorial.SelectedValue = Convert.ToString(modelo.editorialID);
        }

        private void ConsultaLibro(int id)
        {
            var modelo = Libro.ConsultaID(id);

            lbltitdet.Text = modelo.titulo;
            lblañodet.Text = Convert.ToString(modelo.Publicado);
            lblsinopdet.Text = modelo.sinopsis;
            lbleditorialdet.Text = modelo.Editorial;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //validamos que la pagina no este siendo refrescada
            if (!IsPostBack)
            {
                //modificaciones de UI
                gridLibros.Columns[1].Visible = false;
                gridautoresdet.Columns[1].Visible = false;

                //obtengo datos
                ConsultaGrid();
                LlenaEditorial();
                LlenaAutor();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            //variables
            long editorialID;
            int añopub;
            string fecha = DateTime.Now.ToString();

            //validacion de datos
            if (txttitulo.Text == "" || txtaño.Text=="" || txtsinopsis.Text=="")
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "key", "swalert('¡Ups!','Olvidaste escribir toda la informacion del libro','warning');", true);
            }
            else
            {
                try
                {
                    //asigno datos
                    añopub = Convert.ToInt32(txtaño.Text);
                    editorialID = Convert.ToInt32(listeditorial.SelectedValue);

                    //grabamos datos
                    Libro.Guardar(Convert.ToInt32(lblid.Text), txttitulo.Text, txtsinopsis.Text, añopub, editorialID, fecha);

                    //inicializo
                    txtaño.Text = "";
                    txttitulo.Text = "";
                    txtsinopsis.Text = "";
                    lblid.Text = "0";

                    ConsultaGrid();

                    ClientScript.RegisterStartupScript(Page.GetType(), "key", "swalert('¡Bien Hecho!','Información registrada satisfactoriamente','success');", true);
                }
                catch (FormatException)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "key", "swalert('¡Error!','Verfica que los datos ingresados sean correctos','error');", true);
                    throw;
                }
                
            }

            
        }

        protected void gridLibros_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //variables
            int index, codigo;

            //asigno
            index = int.Parse(e.CommandArgument.ToString());
            codigo = Convert.ToInt32(((Label)gridLibros.Rows[index].FindControl("lblidlibro")).Text);
            lblid.Text = Convert.ToString(codigo);

            if (e.CommandName == "Editar")
            {
                EditLibro(codigo);

                //estado para abrir seccion
                newl.Text = "1";
            } else if (e.CommandName == "Ver")
            {
                ConsultaLibro(codigo);
                AutoresAsociados(codigo);

                modl.Text = "1";
            }
        }

        protected void lnkclean_Click(object sender, EventArgs e)
        {
            txtaño.Text = "";
            txttitulo.Text = "";
            txtsinopsis.Text = "";
            lblid.Text = "0";

        }

        protected void lnkadd_Click(object sender, EventArgs e)
        {
            //variables
            int autorID, libroID;
            string fecha= DateTime.Now.ToString();

            //asigno
            autorID = Convert.ToInt32(listautor.SelectedValue);
            libroID = Convert.ToInt32(lblid.Text);

            Libro.AsociaAutor(0, autorID, libroID, fecha);

            AutoresAsociados(libroID);
            modl.Text = "1";
        }

        protected void gridautoresdet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //variables
            int index, codigo, libroID;
            string fecha = DateTime.Now.ToString();

            //asigno
            index = int.Parse(e.CommandArgument.ToString());
            codigo = Convert.ToInt32(((Label)gridautoresdet.Rows[index].FindControl("lblidasoc")).Text);
            libroID = Convert.ToInt32(lblid.Text);

            if (e.CommandName == "Eliminar")
            {
                Libro.AsociaAutor(codigo, 0, 0, fecha);

                AutoresAsociados(libroID);
                modl.Text = "1";
            }
        }
    }
}