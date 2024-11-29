<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Página ASP.NET Básica</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>¡Hola desde ASP.NET Web Forms!</h1>
            <asp:Label ID="lblMessage" runat="server" Text="Presiona el botón para saludar."></asp:Label>
            <br />
            <asp:Button ID="btnClick" runat="server" Text="Haz clic aquí" OnClick="btnClick_Click" />
        </div>
    </form>
</body>
</html>
