using LibraryML.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryML
{
    public partial class BDAutores : System.Web.UI.Page
    {
        AutorAdmin Autor = new AutorAdmin();

        //Metodo de consulta para llenar el gridview
        private void ConsultaGrid()
        {
            gridAutores.DataSource = Autor.ConsultaGen();
            gridAutores.DataBind();
        }

        //Metodo de consulta de un autor para edicion
        private void EditAutor(int id)
        {
            var modelo = Autor.ConsultaID(id);

            //cargo datos en pantalla
            txtnomaut.Text = modelo.nombre;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //validamos que la pagina no este siendo refrescada
            if (!IsPostBack)
            {
                //modificaciones de UI
                gridAutores.Columns[1].Visible = false;

                //obtengo datos
                ConsultaGrid();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            //variables
            string fecha = DateTime.Now.ToString();

            //validacion de datos
            if (txtnomaut.Text == "")
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "key", "swalert('¡Ups!','Olvidaste escribir el nombre del autor','warning');", true);
            }
            else
            {
                //grabamos datos
                Autor.Guardar(Convert.ToInt32(lblid.Text), txtnomaut.Text,fecha);

                //inicializo
                txtnomaut.Text = "";
                lblid.Text = "0";

                ConsultaGrid();

                ClientScript.RegisterStartupScript(Page.GetType(), "key", "swalert('¡Bien Hecho!','Información registrada satisfactoriamente','success');", true);
            }

        }

        protected void gridAutores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //variables
            int index, codigo;

            //asigno
            index = int.Parse(e.CommandArgument.ToString());
            codigo = Convert.ToInt32(((Label)gridAutores.Rows[index].FindControl("lblidautor")).Text);
            lblid.Text = Convert.ToString(codigo);

            if (e.CommandName == "Editar")
            {
                EditAutor(codigo);

                //estado para abrir seccion
                newl.Text = "1";
            }
        }
        protected void lnkclean_Click(object sender, EventArgs e)
        {
            txtnomaut.Text = "";
            lblid.Text = "0";

        }
    }
}