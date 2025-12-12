<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Canciones</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="contenedor">
    <h1>Lista de Canciones</h1>
    <c:if test="${empty listaCanciones}">
        <p>No hay canciones registradas todavía.</p>
    </c:if>

    <ul>
        <c:forEach var="cancion" items="${listaCanciones}">
            <li>
                <a href="${pageContext.request.contextPath}/canciones/detalle/${cancion.id}">
                    ${cancion.titulo}
                </a>
            </li>
        </c:forEach>
    </ul>

    <a class="btn" href="${pageContext.request.contextPath}/canciones/formulario/agregar">Agregar canción</a>

    <a class="btn" href="${pageContext.request.contextPath}/artistas">Ir a artistas</a>

</div>
</body>
</html>
