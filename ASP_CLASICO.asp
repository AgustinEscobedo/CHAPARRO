<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ASP Clásico en HTML</title>
</head>
<body>
    <h1>Bienvenido a mi página ASP</h1>

    <p>La fecha y hora actual es:</p>
    <p>
        <% 
            ' Código ASP Clásico
            Response.Write Now() 
        %>
    </p>

    <p>Lista de productos:</p>
    <ul>
        <% 
            ' Ejemplo de un arreglo en ASP Clásico
            Dim productos
            productos = Array("Producto 1", "Producto 2", "Producto 3")

            ' Iterar a través del arreglo
            Dim i
            For i = 0 To UBound(productos)
        %>
            <li><%= productos(i) %></li>
        <% 
            Next
        %>
    </ul>

    <form method="post" action="procesar.asp">
        <label for="nombre">Introduce tu nombre:</label>
        <input type="text" id="nombre" name="nombre">
        <button type="submit">Enviar</button>
    </form>
</body>
</html>
