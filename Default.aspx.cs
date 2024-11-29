using System;
using System.Web.UI;

public partial class Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Este código se ejecuta al cargar la página por primera vez.
        if (!IsPostBack)
        {
            lblMessage.Text = "Bienvenido a tu primera página en ASP.NET Web Forms.";
        }
    }

    protected void btnClick_Click(object sender, EventArgs e)
    {
        // Cambia el texto del Label cuando se presiona el botón.
        lblMessage.Text = "¡Hola, usuario! Este mensaje viene del servidor.";
    }
}
