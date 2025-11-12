package net.ausiasmarch.persutil.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import net.ausiasmarch.persutil.entity.BlogEntity;
import net.ausiasmarch.persutil.service.AleatorioService;
import net.ausiasmarch.persutil.service.BlogService;
import net.ausiasmarch.persutil.service.PalabrasService;

@RestController
@RequestMapping("/blog")
public class BlogApi {

    @Autowired
    AleatorioService oAleatorioService;

    @Autowired
    BlogService oBlogService;

    @Autowired
    PalabrasService oPalabrasService;

    String[] palabras = {
        "sol", "luna", "viento", "mar", "montaña", "corre", "salta", "canta", "mira", "piensa", "brillante", "oscuro", 
        "tranquilo", "rápido", "feliz", "sueño", "camino", "flor", "río", "cielo", "juega", "ama", "busca", "crea", 
        "vive"
    };
    
    @GetMapping("/saludar")
    public ResponseEntity<String> saludar() {
        return new ResponseEntity<>("Hola desde el blog", HttpStatus.OK);
    }

    @GetMapping("/saludar/buenosdias")
    public ResponseEntity<String> saludarPorLaManyana() {
        return new ResponseEntity<>("Hola buenos días desde el blog", HttpStatus.OK);
    }

    @GetMapping("/aleatorio") // endpoint
    public ResponseEntity<Integer> aleatorio() {
        int numeroAleatorio = (int) (Math.random() * 100) + 1;
        return ResponseEntity.ok(numeroAleatorio);
    }

    @GetMapping("/aleatorio/{min}/{max}") // endpoint
    public ResponseEntity<Integer> aleatorioEnRango(@PathVariable int min, @PathVariable int max) {
        int numeroAleatorio = (int) (Math.random() * (max - min + 1)) + min;
        return ResponseEntity.ok(numeroAleatorio);
    }

    @GetMapping("/aleatorio/service/{min}/{max}") // endpoint
    public ResponseEntity<Integer> aleatorioUsandoServiceEnRango(@PathVariable int min, @PathVariable int max) {
        return ResponseEntity.ok(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(min, max));
    }

    // Modificar
    @GetMapping("/rellenauno") // endpoint
    public ResponseEntity<Long> rellenaBlog() {
        return ResponseEntity.ok(oBlogService.rellenaBlog());
    }

    @GetMapping("/palabras") // endpoint
    public ResponseEntity<String> palabras() {
        return ResponseEntity.ok(oPalabrasService.GenerarFrases(palabras));
    }

    // Crud

    // Obtener POSTS por ID
    @GetMapping("/{id}")
    public ResponseEntity<BlogEntity> get(@PathVariable Long id) {
        return ResponseEntity.ok(oBlogService.get(id));
    }

    // Crear POSTS
    @PostMapping("")
    public ResponseEntity<Long> create(@RequestBody BlogEntity blogEntity) {
        return ResponseEntity.ok(oBlogService.create(blogEntity));
    }

    // Modificar POSTS
    @PutMapping("")
    public ResponseEntity<Long> update(@RequestBody BlogEntity blogEntity) {
        return ResponseEntity.ok(oBlogService.update(blogEntity));
    }

    // Borrar POSTS
    @DeleteMapping("/{id}")
    public ResponseEntity<Long> delete(@RequestBody Long id) {
        return ResponseEntity.ok(oBlogService.delete(id));
    }

    // Listado paginado de POSTS
    @GetMapping("")
    public ResponseEntity<Page<BlogEntity>> getPage(Pageable oPageable) {
        return ResponseEntity.ok(oBlogService.getPage(oPageable));
    }

    @GetMapping("/count")
    public ResponseEntity<Long> count() {
        return ResponseEntity.ok(oBlogService.count()); 
    }
}
