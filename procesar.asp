<%
' procesar.asp

' Obtener el valor del campo 'nombre' del formulario
Dim nombre
nombre = Request.Form("nombre")

' Verificar si el valor fue enviado
If nombre <> "" Then
    ' Mostrar el mensaje de bienvenida con el nombre
    Response.Write("<h1>Hola, " & nombre & "!</h1>")
    Response.Write("<p>Gracias por enviar el formulario.</p>")
Else
    ' Si no se proporcionó un nombre, mostrar un mensaje de error
    Response.Write("<h1>Error:</h1>")
    Response.Write("<p>No se proporcionó un nombre. Por favor, inténtalo de nuevo.</p>")
End If
%>
