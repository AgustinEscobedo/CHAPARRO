<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ASP.NET Inline C# Example</title>
</head>
<body>
    <h1>Bienvenido a mi página ASP.NET</h1>

    <p>La fecha y hora actual es:</p>
    <p>
        <%= DateTime.Now.ToString() %>
    </p>

    <p>Lista de productos:</p>
    <ul>
        <% 
            // Crear un arreglo de productos
            string[] productos = { "Producto 1", "Producto 2", "Producto 3" };

            // Iterar sobre el arreglo y mostrar los productos
            foreach (string producto in productos)
            {
        %>
            <li><%= producto %></li>
        <% 
            }
        %>
    </ul>

    <form method="post">
        <label for="nombre">Introduce tu nombre:</label>
        <input type="text" id="nombre" name="nombre" />
        <button type="submit">Enviar</button>
    </form>

    <% 
        // Procesar el formulario y mostrar el nombre si se envió
        if (Request.HttpMethod == "POST")
        {
            string nombre = Request.Form["nombre"];
            if (!string.IsNullOrEmpty(nombre))
            {
    %>
                <p>Hola, <%= nombre %>!</p>
    <% 
            }
        }
    %>

</body>
</html>
