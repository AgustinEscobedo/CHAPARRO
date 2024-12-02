<%@ Page Language="C#" aspcompat="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.DirectoryServices" %>
<%@ Import Namespace="System.Net" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        // Conectar a Active Directory usando LDAP
        DirectoryEntry entry = new DirectoryEntry("LDAP://192.168.130.1/cn=Administrador,cn=Users,DC=teolo,DC=acme,DC=com", "acme\\Administrador", "Pepe3lPollo..");
        DirectorySearcher searcher = new DirectorySearcher(entry);
        SearchResult res = searcher.FindOne();

        // Obtener y mostrar las propiedades del usuario
        foreach (string homePhone in entry.Properties["homePhone"])
        {
            Response.Write("Telefono de casa: " + homePhone + "<br>");
        }

        foreach (string mobile in entry.Properties["mobile"])
        {
            Response.Write("Numero de movil: " + mobile + "<br>");
        }

        foreach (string name in entry.Properties["name"])
        {
            Response.Write("Nombre de usuario: " + name + "<br>");
        }

        // Validar la existencia del usuario
        if (res == null)
        {
            Response.Write("No existe el usuario, Cachorrita.");
        }
        else
        {
            Response.Write("Conex exitosa");
        }
    }
</script>

<html>
<head>
    <title>Ejemplo de ASP en C#</title>
</head>
<body>
    <asp:DataGrid ID="dgrdAlumnos" runat="server"></asp:DataGrid>
</body>
</html>
