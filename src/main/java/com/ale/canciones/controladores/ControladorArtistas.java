package com.ale.canciones.controladores;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import com.ale.canciones.modelos.Artista;
import com.ale.canciones.servicios.ServicioArtistas;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

@Controller
public class ControladorArtistas{
    @Autowired
    private ServicioArtistas servicioArtistas;

    @GetMapping("/artistas")
    public String desplegarArtistas(Model modelo){
        List<Artista> lista = servicioArtistas.obtenerTodosLosArtistas();
        modelo.addAttribute("listaArtistas",lista);
        return "artistas.jsp";
    }

    @GetMapping("/artistas/detalle/{idArtista}")
    public String desplegarDetalleArtista(@PathVariable Long idArtista,Model modelo){
        Artista artista = servicioArtistas.obtenerArtistaPorId(idArtista);
        
        if(artista == null) 
            return "redirect:/artistas";
        modelo.addAttribute("artista",artista);
            return "detalleArtista.jsp";
        }
    @GetMapping("/artistas/formulario/agregar/{idArtista}")
    public String formularioAgregarArtista(@PathVariable Long idArtista, @ModelAttribute("artista") Artista artista){
        return "agregarArtista.jsp";
    }
    @PostMapping("/artistas/procesa/agregar")
    public String procesarAgregarArtista(@Valid @ModelAttribute("artista") Artista artista,BindingResult validaciones){
        
        if(validaciones.hasErrors()) 
            return "agregarArtista.jsp";

        servicioArtistas.agregarArtista(artista);
            return "redirect:/artistas";
    }

}
