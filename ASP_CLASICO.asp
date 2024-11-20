<%
' ASP_CLASICO.asp

' Mostrar el título de la página
Response.Write("<h1>Bienvenido a mi página ASP</h1>")

' Mostrar la fecha y hora actual
Response.Write("<p>La fecha y hora actual es: " & Now() & "</p>")

' Mostrar lista de productos
Response.Write("<p>Lista de productos:</p>")
Response.Write("<ul>")

' Crear arreglo de productos
Dim productos
productos = Array("Producto 1", "Producto 2", "Producto 3")

' Iterar a través del arreglo de productos y mostrarlos en una lista
Dim i
For i = 0 To UBound(productos)
    Response.Write("<li>" & productos(i) & "</li>")
Next

Response.Write("</ul>")

' Crear formulario para ingresar nombre
Response.Write("<form method='post' action='procesar.asp'>")
Response.Write("<label for='nombre'>Introduce tu nombre:</label>")
Response.Write("<input type='text' id='nombre' name='nombre'>")
Response.Write("<button type='submit'>Enviar</button>")
Response.Write("</form>")
%>
