<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Artistas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="contenedor">
    <h1>Lista de Artistas</h1>

    <c:if test="${empty listaArtistas}">
        <p>No hay artistas registrados todavía.</p>
    </c:if>

    <ul>
        <c:forEach var="a" items="${listaArtistas}">
            <li>
                <a href="${pageContext.request.contextPath}/artistas/detalle/${a.id}">
                    ${a.nombre} ${a.apellido}
                </a>
            </li>
        </c:forEach>
    </ul>

    <a class="btn" href="${pageContext.request.contextPath}/canciones">Ir a canciones</a>
    
</div>
</body>
</html>
