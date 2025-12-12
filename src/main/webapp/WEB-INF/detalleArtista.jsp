<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Detalle Artista</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="contenedor">
    <h1>Detalle del Artista</h1>
    <h2>${artista.nombre} ${artista.apellido}</h2>
    <h3>Biografía</h3>
    <p>
        <c:choose>
            <c:when test="${empty artista.biografia}">
                (Sin biografía)
            </c:when>
            <c:otherwise>
                ${artista.biografia}
            </c:otherwise>
        </c:choose>
    </p>

    <h3>Canciones del artista</h3>

    <c:if test="${empty artista.canciones}">
        <p>Este artista aún no tiene canciones registradas.</p>
    </c:if>

    <ul>
        <c:forEach var="c" items="${artista.canciones}">
            <li>
                <strong>${c.titulo}</strong> — ${c.genero} / ${c.idioma}
            </li>
        </c:forEach>
    </ul>

    <a class="btn" href="${pageContext.request.contextPath}/artistas">Volver a lista de artistas</a>
    
</div>
</body>
</html>
