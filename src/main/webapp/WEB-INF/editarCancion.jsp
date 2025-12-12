<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Editar Canción</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="contenedor">
    <h1>Editar Canción</h1>

    <form:form
        action="${pageContext.request.contextPath}/canciones/procesa/editar/${cancion.id}"
        method="POST"
        modelAttribute="cancion">

        <input type="hidden" name="_method" value="PUT"/>

        <div class="form-grupo">
            <form:label path="artista.id">Artista:</form:label>
            <form:select path="artista.id">
                <form:option value="" label="Selecciona un artista"/>
                <c:forEach var="a" items="${listaArtistas}">
                    <form:option value="${a.id}">${a.nombre} ${a.apellido}</form:option>
                </c:forEach>
            </form:select>
            <form:errors path="artista" cssClass="error"/>
        </div>

        <div class="form-grupo">
            <label for="titulo">Título:</label>
            <form:input path="titulo" id="titulo" />
            <form:errors path="titulo" cssClass="error"/>
        </div>



        <div class="form-grupo">
            <label for="album">Álbum:</label>
            <form:input path="album" id="album"/>
            <form:errors path="album" cssClass="error"/>
        </div>

        <div class="form-grupo">
            <label for="genero">Género:</label>
            <form:input path="genero" id="genero"/>
            <form:errors path="genero" cssClass="error"/>
        </div>

        <div class="form-grupo">
            <label for="idioma">Idioma:</label>
            <form:input path="idioma" id="idioma"/>
            <form:errors path="idioma" cssClass="error"/>
        </div>

        <button type="submit">Guardar cambios</button>
    </form:form>

    <p style="margin-top:15px;">
        <a href="${pageContext.request.contextPath}/canciones">Volver a lista de canciones</a>
    </p>

</div>
</body>
</html>
