package com.ale.canciones.modelos;

import java.time.LocalDateTime;
import java.util.List;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="artistas")
public class Artista{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Size(min = 2, message = "El nombre debe tener al menos 2 caracteres")
    private String nombre;

    @Size(min = 2, message = "El apellido debe tener al menos 2 caracteres")
    private String apellido;

    @Column(columnDefinition = "TEXT")
    @Size(min = 10, message = "La biografía debe tener al menos 10 caracteres")
    private String biografia;

    @CreationTimestamp
    @Column(name="fecha_creacion", updatable=false)
    private LocalDateTime fechaCreacion;

    @UpdateTimestamp
    @Column(name="fecha_actualizacion")
    private LocalDateTime fechaActualizacion;

    @OneToMany(mappedBy="artista", fetch=FetchType.LAZY,cascade = CascadeType.ALL)
    private List<Cancion> canciones;

    public Artista(){}

    public Long getId(){ return id; }
    public void setId(Long id){ this.id = id; }

    public String getNombre(){ return nombre; }
    public void setNombre(String nombre){ this.nombre = nombre; }

    public String getApellido(){ return apellido; }
    public void setApellido(String apellido){ this.apellido = apellido; }

    public String getBiografia(){ return biografia; }
    public void setBiografia(String biografia){ this.biografia = biografia; }

    public LocalDateTime getFechaCreacion(){ return fechaCreacion; }
    public LocalDateTime getFechaActualizacion(){ return fechaActualizacion; }
    

    public List<Cancion> getCanciones(){ return canciones; }
    public void setCanciones(List<Cancion> canciones){ this.canciones = canciones; }
}
