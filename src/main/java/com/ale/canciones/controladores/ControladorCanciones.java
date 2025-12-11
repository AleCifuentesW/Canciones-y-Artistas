package com.ale.canciones.controladores;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.ale.canciones.servicios.ServicioCanciones;
import com.ale.canciones.modelos.Cancion;
//nuevos:
import org.springframework.validation.BindingResult;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ControladorCanciones{

    @Autowired
    private ServicioCanciones servicioCanciones;

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
    //formularioAgregarCancion()
    @GetMapping("/canciones/formulario/agregar")
    public String formularioAgregarCancion(@ModelAttribute("cancion") Cancion cancion) {
        return "agregarCancion.jsp";
    }
    //procesarAgregarCancion():
    @PostMapping("/canciones/procesa/agregar")
    public String procesarAgregarCancion(
        @Valid @ModelAttribute("cancion") Cancion cancion,
        BindingResult validaciones) 
    {

    if(validaciones.hasErrors()){
        return "agregarCancion.jsp";
    }

    servicioCanciones.agregarCancion(cancion);

        return "redirect:/canciones";
    }



}