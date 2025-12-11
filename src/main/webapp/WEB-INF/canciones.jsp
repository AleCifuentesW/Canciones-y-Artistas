<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Canciones</title>
<link rel="stylesheet" href="/css/style.css">
</head>
</head>

<body>
<div class="contenedor">
    <h1>Canciones</h1>
    
    <table class="tabla_canciones">
        <thead>
            <tr>
                <th>Título</th>
                <th>Artista</th>
                <th>Álbum</th>
                <th>Género</th>
                <th>Idioma</th>
                <th>Detalle</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="cancion" items="${listaCanciones}">
                <tr>
                    <td>${cancion.titulo}</td>
                    <td>${cancion.artista}</td>
                    <td>${cancion.album}</td>
                    <td>${cancion.genero}</td>
                    <td>${cancion.idioma}</td>
                    <td>
                        <a class="link_detalle" href="/canciones/detalle/${cancion.id}">Detalle</a>

                    </td>
                </tr>
            </c:forEach>
        </tbody>
        
    </table>

    <p style="text-align:right; margin-bottom: 10px;">
    <a class="btn" href="/canciones/formulario/agregar">Agregar nueva canción</a>

    </p>
</div>
</body>
</html>
