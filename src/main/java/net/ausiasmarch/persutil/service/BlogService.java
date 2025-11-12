package net.ausiasmarch.persutil.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import net.ausiasmarch.persutil.entity.BlogEntity;
import net.ausiasmarch.persutil.repository.BlogRepository;

@Service
public class BlogService {
    
    @Autowired
    BlogRepository oBlogRepository;

    // @Autowired
    // AleatorioService oAleatorioService

    ArrayList<String> alFrases = new ArrayList<>();

    public BlogService() {
        alFrases.add("La vida es bella");
        alFrases.add("El conocimiento es poder");
        alFrases.add("La perseverancia es la clave del éxito");
        alFrases.add("El tiempo es oro");
        alFrases.add("La creatividad es la inteligencia divertiéndose");
        alFrases.add("Más vale tarde que nunca");
    }

    public Long rellenaBlog() {
        BlogEntity oBlogEntity = new BlogEntity();

        // oBlogEntity.setTitulo(alFrases.get(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, alFrases.size()) - 1));

        String contenidoGenerado = "";
        // int numFrases = oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, 30);

        // for  (int i = 1; i <= numFrases; i++) {
        //     contenidoGenerado += alFrases.get(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, alFrases.size()) - 1) + " ";
        // }

        oBlogEntity.setContenido(contenidoGenerado.trim());
        
        String[] palabras = contenidoGenerado.split(" ");
        String etiquetas = "";

        // for (int i = 0; i < 5; i++) {
        //     String palabra = palabras[oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, palabras.length - 1)];
        //     if (!etiquetas.contains(palabra)) {
        //         etiquetas += palabra + ", ";
        //     }
        // }

        if (etiquetas.endsWith(", ")) {
            // Acabar
        }

        oBlogEntity.setEtiquetas(etiquetas);
        oBlogEntity.setFechaCreacion(LocalDateTime.now());
        oBlogEntity.setFechaModificacion(null);
        oBlogRepository.save(oBlogEntity);
        return oBlogRepository.count();
    }

    // CRUD

    public BlogEntity get(Long id) {
        return oBlogRepository.findById(id).orElseThrow(() -> new RuntimeException("Blog not found"));
    }

    public Long create(BlogEntity blogEntity) {
        blogEntity.setFechaCreacion(LocalDateTime.now());
        blogEntity.setFechaModificacion(null);
        oBlogRepository.save(blogEntity);
        return blogEntity.getId();
    }

    public Long update(BlogEntity blogEntity) {
        BlogEntity existingBlog = oBlogRepository.findById(blogEntity.getId())
            .orElseThrow(() -> new RuntimeException("Blog not found"));
        existingBlog.setTitulo(blogEntity.getTitulo());
        existingBlog.setContenido(blogEntity.getContenido());
        existingBlog.setEtiquetas(blogEntity.getEtiquetas());
        existingBlog.setFechaModificacion(null);
        oBlogRepository.save(existingBlog);
        return existingBlog.getId();
    }

    // Función DELETE

    // Función getPage()
}
