<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
    <title>Agregar Artista</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body>
<div class="contenedor">
    <h1>Agregar Artista</h1>

    <form:form method="POST" action="/artistas/procesa/agregar" modelAttribute="artista">
        <label>Nombre</label>
        <form:input path="nombre"/>

        <label>Apellido</label>
        <form:input path="apellido"/>

        <label>Biografía</label>
        <form:textarea path="biografia"/>

        <button type="submit">Guardar</button>
    </form:form>

    <a href="/artistas">Volver</a>
    
</div>
</body>
</html>
