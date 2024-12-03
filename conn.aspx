<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.DirectoryServices" %>

<!DOCTYPE html>
<html>
<head>
    <title>Verificar Conexión con Active Directory</title>
</head>
<body>
    <h1>Verificar Conexión con Active Directory</h1>
    <form runat="server">
        <asp:Button ID="btnVerificar" runat="server" Text="Verificar Conexión" OnClick="btnVerificar_Click" />
        <br /><br />
        <asp:Label ID="lblResultado" runat="server" Font-Size="Large"></asp:Label>
    </form>

    <script runat="server">
        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            // Parámetros de conexión
            string ldapPath = "LDAP://teolo.acme.com";
            string username = "teolo\\Administrador"; // Dominio + Usuario
            string password = "Pepe3lPollo..";

            try
            {
                // Intentar conectar al servidor LDAP
                using (DirectoryEntry entry = new DirectoryEntry(ldapPath, username, password))
                {
                    // Forzar validación de credenciales y conexión
                    object nativeObject = entry.NativeObject;
                    lblResultado.Text = "Conexión exitosa con Active Directory en 'teolo.acme.com'.";
                    lblResultado.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception ex)
            {
                // Mostrar el mensaje de error
                lblResultado.Text = "Error de conexión con Active Directory: " + ex.Message;
                lblResultado.ForeColor = System.Drawing.Color.Red;
            }
        }
    </script>
</body>
</html>
