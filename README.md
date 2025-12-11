Mostrar Canciones
Objetivos
Comprender y aplicar el concepto MVC para rutas GetMapping.
Practicar la creación de modelos de dominio, repositorios de datos, servicios, controladores y vistas JSP en la aplicación de Spring Boot.
Desarrollar una aplicación web en Spring Boot donde el usuario pueda desplegar canciones y sus respectivas características desde la base de datos. La información será almacenada en una base de datos.
Requerimientos
Crea una base de datos llamada canciones_db.
Crea un nuevo proyecto llamado canciones.
Agrega en tu archivo de propiedades las credenciales y nombre de la base de datos que creaste para conectarnos a ella.
Asigna el paquete base com.tunombre para que ahí se cree el archivo principal de la aplicación.
Agrega un paquete para tus modelos de dominio: com.tunombre.modelos.
Dentro de ese nuevo paquete agrega una clase llamada Cancion.java
Asocia la clase a una @Entity y @Table, nombra la tabla “canciones”.
Cada canción contiene las siguientes características:
Id: Identificador de la canción para la base de datos.
Título: El nombre de la canción.
Artista: El nombre del artista o banda que interpreta la canción.
Álbum: El álbum en el que se encuentra la canción.
Género: El género musical de la canción (por ejemplo, rock, pop, jazz, etc.).
Idioma: El idioma en el que está escrita la canción.
Fecha de creación: Fecha utilizada para cuando se crea el registro en la tabla de la base de datos.
Fecha de actualización: Fecha utilizada para mantener el registro de actualización de la canción.
Incluye el constructor vacío y genera los getters y setters para cada atributo.
Asegúrate que la fecha de creación y actualización se den de altas por la base de datos y se actualicen automáticamente.
Ve a tu MySQL Workbench para agregar un par de canciones manualmente.
Agrega un paquete para tus repositorios de datos: com.tunombre.repositorios
Dentro de ese nuevo paquete agrega una interfaz llamada RepositorioCanciones.java
Extiende la clase de CrudRepository en la interfaz y asigna tu modelo creado junto con un Long para asociarlo con el modelo de dominio.
Agrega la anotación de @Repository a la interfaz.
Agrega el método de List<Cancion> findAll()
Agrega un paquete para tus servicios: com.tunombre.servicios.
Dentro de ese nuevo paquete agrega una clase llamada ServicioCanciones.java
Agrega la anotación de @Service a la clase.
Inyecta al servicio tu repositorio con @Autowired.
Agrega los siguientes métodos al servicio:
obtenerTodasLasCanciones(): Devuelve una lista de objetos Cancion de la tabla canciones de nuestra base de datos.
obtenerCancionPorId(Long): Devuelve un solo objeto de tipo Cacion dado el id enviado como parámetro. Si la Cancion no existe devuelve null.
Agrega un paquete para tus controladores: com.tunombre.controladores.
Dentro de ese nuevo paquete agrega una clase llamada ControladorCanciones.java
Agrega la anotación de @Controller a la clase.
Inyecta al controlador tu servicio con @Autowired.
Agrega las siguientes rutas al controlador:
desplegarCanciones(): Ruta a utilizar “/canciones”. Devuelve una lista de objetos Cancion para ser enviadas a la vista JSP canciones.jsp.
desplegarDetalleCancion(): Ruta a utilizar “/canciones/detalle/{idCancion}”. Devuelve un objeto Cancion que coincide con el idCancion recibido en la variable de ruta para ser enviado a la vista JSP detalleCancion.jsp.
Ahora agrega las siguientes vistas en tu carpeta de WEB-INF:
canciones.jsp – JSP que se encarga de mostrar una tabla con las columnas: Titulo, Autor y Detalle. Por cada canción debes de desplegar en la tabla el titulo, su artista y una etiqueta de <a> con el texto de Detalle. Al darle clic a la etiqueta de <a> debemos de conectar con la ruta “/canciones/detalle/{idCancion}”.
detalleCancion.jsp – JSP que se encarga de mostrar el detalle de cada canción, es decir, todos sus atributos. Al final de este JSP agregar una etiqueta de <a> con el texto Volver a lista de canciones. Al darle clic a la etiqueta de <a> debemos de conectar con la ruta “/canciones”.
Ejecuta la aplicación utilizando Spring Boot. Asegúrate de que la aplicación se ejecuta sin errores.
Utiliza un navegador web para acceder a las rutas y verificar que cada una retorne la información esperada.
