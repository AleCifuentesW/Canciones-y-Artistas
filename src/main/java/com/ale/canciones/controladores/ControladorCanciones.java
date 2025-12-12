package com.ale.canciones.controladores;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.ale.canciones.servicios.ServicioCanciones;
import com.ale.canciones.modelos.Cancion;
import org.springframework.validation.BindingResult;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import com.ale.canciones.modelos.Artista;
import com.ale.canciones.servicios.ServicioArtistas;

@Controller
public class ControladorCanciones{
    @Autowired
    private ServicioCanciones servicioCanciones;
    @Autowired
    private ServicioArtistas servicioArtistas;

    @GetMapping("/canciones")
    public String desplegarCanciones(Model modelo){
        List<Cancion> lista= servicioCanciones.obtenerTodasLasCanciones();
        modelo.addAttribute("listaCanciones", lista);
        return "canciones.jsp";
    }

    @GetMapping("/canciones/detalle/{idCancion}")
    public String desplegarDetalleCancion(@PathVariable Long idCancion,Model modelo){
        Cancion cancion=servicioCanciones.obtenerCancionPorId(idCancion);

        modelo.addAttribute("cancion",cancion);
        return "detalleCancion.jsp";
    }
    @GetMapping("/canciones/formulario/agregar")
    public String formularioAgregarCancion(@ModelAttribute("cancion") Cancion cancion, Model modelo){
        modelo.addAttribute("listaArtistas",servicioArtistas.obtenerTodosLosArtistas());
        return "agregarCancion.jsp";
    }
    @PostMapping("/canciones/procesa/agregar")
    public String procesarAgregarCancion(
        @Valid @ModelAttribute("cancion") Cancion cancion,
        BindingResult validaciones,
        Model modelo) 
    {

        if(validaciones.hasErrors()){
            modelo.addAttribute("listaArtistas",servicioArtistas.obtenerTodosLosArtistas());
            return "agregarCancion.jsp";
        }
        Long idArtista= cancion.getArtista().getId();
        Artista artista= servicioArtistas.obtenerArtistaPorId(idArtista);
        cancion.setArtista(artista);

        servicioCanciones.agregarCancion(cancion);
            return "redirect:/canciones";
    }


    @GetMapping("/canciones/formulario/editar/{idCancion}")
    public String formularioEditarCancion(@PathVariable Long idCancion,Model modelo){
        Cancion cancion= servicioCanciones.obtenerCancionPorId(idCancion);

        if(cancion == null){
            return "redirect:/canciones";
        }

        modelo.addAttribute("cancion",cancion);
        modelo.addAttribute("listaArtistas",servicioArtistas.obtenerTodosLosArtistas());
        return "editarCancion.jsp";
    }

    @PutMapping("/canciones/procesa/editar/{idCancion}")
    public String procesarEditarCancion(@Valid @ModelAttribute("cancion") Cancion cancionFormulario,BindingResult validaciones,@PathVariable Long idCancion, Model modelo){

        if (validaciones.hasErrors()){
            modelo.addAttribute("listaArtistas",servicioArtistas.obtenerTodosLosArtistas());
            return "editarCancion.jsp";
        }

        cancionFormulario.setId(idCancion);
        servicioCanciones.actualizaCancion(cancionFormulario);
            return "redirect:/canciones";
    }
    
    @DeleteMapping("/canciones/eliminar/{idCancion}")
    public String procesarEliminarCancion(@PathVariable Long idCancion){
        servicioCanciones.eliminaCancion(idCancion);
        return "redirect:/canciones";
    }


}