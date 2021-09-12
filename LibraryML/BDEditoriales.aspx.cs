using LibraryML.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryML
{
    public partial class BDEditoriales : System.Web.UI.Page
    {
        EditorialAdmin Editorial = new EditorialAdmin();

        //Metodo de consulta para llenar el gridview
        private void ConsultaGrid()
        {
            gridEditorial.DataSource = Editorial.ConsultaGen();
            gridEditorial.DataBind();
        }

        //Metodo de consulta de una editorial para edicion
        private void EditEditorial(int id)
        {
            var modelo = Editorial.ConsultaID(id);

            //cargo datos en pantalla
            txtnomedit.Text = modelo.nombre;
            txtciuedit.Text = modelo.ciudad;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //validamos que la pagina no este siendo refrescada
            if (!IsPostBack)
            {
                //modificaciones de UI
                gridEditorial.Columns[1].Visible = false;

                //obtengo datos
                ConsultaGrid();
            }
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            //variables
            string fecha = DateTime.Now.ToString();

            //validacion de datos
            if (txtnomedit.Text == "" || txtciuedit.Text=="")
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "key", "swalert('¡Ups!','Olvidaste escribir toda la informacion de la editorial','warning');", true);
            }
            else
            {
                //grabamos datos
                Editorial.Guardar(Convert.ToInt32(lblid.Text), txtnomedit.Text, txtciuedit.Text, fecha);

                //inicializo
                txtnomedit.Text = "";
                txtciuedit.Text = "";
                lblid.Text = "0";

                ConsultaGrid();

                ClientScript.RegisterStartupScript(Page.GetType(), "key", "swalert('¡Bien Hecho!','Información registrada satisfactoriamente','success');", true);
            }

        }

        protected void gridEditorial_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //variables
            int index, codigo;

            //asigno
            index = int.Parse(e.CommandArgument.ToString());
            codigo = Convert.ToInt32(((Label)gridEditorial.Rows[index].FindControl("lblidedito")).Text);
            lblid.Text = Convert.ToString(codigo);

            if (e.CommandName == "Editar")
            {
                EditEditorial(codigo);

                //estado para abrir seccion
                newl.Text = "1";
            }
        }
        protected void lnkclean_Click(object sender, EventArgs e)
        {
            txtnomedit.Text = "";
            txtciuedit.Text = "";
            lblid.Text = "0";

        }
    }
}