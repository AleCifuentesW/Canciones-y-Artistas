<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Detalle cancion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="contenedor">
    <h1>Detalle de la canción</h1>
    

    <div class="detalle_cancion">
        <p>Título: ${cancion.titulo}</p>
        <p>Artista: ${cancion.artista.nombre}
            <c:choose>
                <c:when test="${empty cancion.artista}">(Sin artista asignado)</c:when>
                <c:otherwise>${cancion.artista.nombre} ${cancion.artista.apellido}</c:otherwise>
            </c:choose>
        </p>
        
        <p>Álbum: ${cancion.album}</p>
        <p>Género: ${cancion.genero}</p>
        <p>Idioma: ${cancion.idioma}</p>
        <p>Creada: ${cancion.fechaCreacion}</p>
        <p>Actualizada: ${cancion.fechaActualizacion}</p>
        
    </div>
    
    <div style="margin-top: 15px;">
        <a class="btn" href="${pageContext.request.contextPath}/canciones/formulario/editar/${cancion.id}">Editar la canción</a>
    </div>

    

    <c:if test="${not empty cancion.id}">
        <form action="${pageContext.request.contextPath}/canciones/eliminar/${cancion.id}" method="POST">
            <input type="hidden" name="_method" value="DELETE"/>
            <button type="submit" class="btn">Eliminar canción</button>
        </form>
    </c:if>

    <p style="margin-top:15px;">
        <a href="${pageContext.request.contextPath}/canciones">Volver a lista de canciones</a>
    </p>

</div>
</body>
</html>