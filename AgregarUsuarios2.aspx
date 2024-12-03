<%@ Page Language="C#" aspcompat="true" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.DirectoryServices" %>

<script runat="server">
    protected void btnAgregarUsuariosDesdeArchivo_Click(object sender, EventArgs e)
    {
        string filePath = Server.MapPath("~/texto.txt"); // Ruta del archivo texto.txt en el servidor

        if (!File.Exists(filePath))
        {
            Response.Write("El archivo texto.txt no se encontró en el servidor.<br>");
            return;
        }

        try
        {
            string adminDN = "cn=Administrador,dc=teolo,dc=acme,dc=com";
            string adminPassword = "Pepe3lPollo..";
            string dominio = "LDAP://192.168.130.1"; // Dirección IP del servidor AD

            // Intentar conectar al servidor LDAP
            DirectoryEntry ldapConnection = new DirectoryEntry(dominio, "teolo\\Administrador", adminPassword);
            try
            {
                // Verificar la conexión LDAP
                object nativeObject = ldapConnection.NativeObject;
                Response.Write("Conexión exitosa al servidor LDAP.<br>");
            }
            catch (Exception ex)
            {
                Response.Write("Error de conexión LDAP: " + ex.Message + "<br>");
                return;
            }

            // Leer cada línea del archivo
            string[] lines = File.ReadAllLines(filePath);
            foreach (string line in lines)
            {
                if (string.IsNullOrWhiteSpace(line))
                    continue;

                string[] parts = line.Split(':');
                if (parts.Length != 3)
                {
                    Response.Write("Formato incorrecto en la línea: " + line + "<br>");
                    continue;
                }

                string usuario = parts[0];
                string contraseña = parts[1];
                string ouPath = parts[2];

                // Imprimir los datos que estamos leyendo
                Response.Write("Procesando Usuario: '" + usuario + "', Contraseña: '" + contraseña + "'<br>");
                Response.Write("Buscando OU: '" + ouPath + "'<br>");

                try
                {
                    // Verificar si la OU existe
                    DirectorySearcher searcher = new DirectorySearcher(ldapConnection);
                    searcher.Filter = "(distinguishedName=" + ouPath + ")";
                    searcher.PropertiesToLoad.Add("distinguishedName");
                    SearchResult result = searcher.FindOne();

                    if (result == null)
                    {
                        Response.Write("La OU '" + ouPath + "' no existe en el directorio.<br>");
                        continue;
                    }
                    else
                    {
                        Response.Write("La OU '" + ouPath + "' encontrada.<br>");
                    }

                    // Conectar al servidor LDAP con la OU especificada
                    DirectoryEntry container = new DirectoryEntry(dominio + "/" + ouPath, "teolo\\Administrador", adminPassword);

                    // Crear un nuevo usuario
                    DirectoryEntry nuevoUsuario = container.Children.Add("cn=" + usuario, "user");
                    nuevoUsuario.Properties["sAMAccountName"].Value = usuario;
                    nuevoUsuario.Properties["userPrincipalName"].Value = usuario + "@teolo.acme.com";
                    nuevoUsuario.Properties["displayName"].Value = usuario;
                    nuevoUsuario.CommitChanges();

                    // Establecer la contraseña y habilitar la cuenta
                    nuevoUsuario.Invoke("SetPassword", contraseña);
                    nuevoUsuario.Properties["userAccountControl"].Value = 512; // Habilitar cuenta
                    nuevoUsuario.CommitChanges();

                    Response.Write("Usuario '" + usuario + "' creado exitosamente en '" + ouPath + "'.<br>");
                }
                catch (Exception ex)
                {
                    Response.Write("Error al crear el usuario '" + usuario + "': " + ex.Message + "<br>");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error al procesar el archivo: " + ex.Message + "<br>");
        }
    }
</script>

<html>
<head>
    <title>Agregar Usuarios desde Archivo</title>
</head>
<body>
    <form runat="server">
        <h2>Agregar Usuarios desde Archivo</h2>
        <p>Este proceso leerá los datos del archivo <b>texto.txt</b> ubicado en el servidor.</p>
        <asp:Button ID="btnAgregarUsuariosDesdeArchivo" runat="server" Text="Agregar Usuarios" OnClick="btnAgregarUsuariosDesdeArchivo_Click" />
        <br /><br />
        <asp:Label ID="lblResultado" runat="server" ForeColor="Green"></asp:Label>
    </form>
</body>
</html>
