package net.ausiasmarch.persutil.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import net.ausiasmarch.persutil.entity.ZanonEntity;
import net.ausiasmarch.persutil.repository.ZanonRepository;

@Service
public class ZanonService {

    @Autowired
    AleatorioService oAleatorioService;

    @Autowired
    ZanonRepository oZanonRepository;

    ArrayList<String> rutinas = new ArrayList<>();

    public ZanonService() {
        rutinas.add("Pecho: Press banca 4x8, Aperturas 3x12, Fondos 3x10");
        rutinas.add("Espalda: Dominadas 4x6, Remo con barra 4x8, Jalón 3x12");
        rutinas.add("Piernas: Sentadilla 4x8, Prensa 4x12, Extensiones 3x15");
        rutinas.add("Hombro: Press militar 4x8, Elevaciones laterales 3x12");
        rutinas.add("Brazos: Curl bíceps 4x10, Tríceps polea 4x12");
        rutinas.add("Full Body: Sentadilla 3x10, Press banca 3x10, Remo 3x10");
    }

    private String extraerTitulo(String rutina) {
        String titulo = rutina.substring(0, rutina.indexOf(":"))
                              .trim()
                              .toLowerCase();
        return titulo;
    }

    private String extraerContenido(String rutina) {
        String contenido = rutina.substring(rutina.indexOf(":") + 1)
                                 .trim();
        return contenido;
    }

    private String extraerEtiquetas(String contenido) {
        String[] palabras = contenido
                 .replaceAll("[0-9]", "") // Quitamos los números
                 .replaceAll("[.,;:!?]", "") //Quitamos los signos
                 .toLowerCase()
                 .split(" ");
        
        return Arrays.stream(palabras)
                 .filter(p -> p.length() > 4)
                 .distinct()
                 .limit(5)
                 .collect(Collectors.joining(", "));
    }

    private String extraerCategoria(String titulo) {
        titulo = titulo.toLowerCase();

        if (titulo.contains("pecho")) {
            return "pecho";
        } else if (titulo.contains("espalda")) {
            return "espalda";
        } else if (titulo.contains("piernas")) {
            return "piernas";
        } else if (titulo.contains("hombro")) {
            return "hombro";
        } else if (titulo.contains("brazos")) {
            return "brazos";
        } else {
            return "full body";
        }
    }

    public Long registroRutinas(Long numPosts) {
        ZanonEntity.Dificultad[] dificultades = ZanonEntity.Dificultad.values();

        for (long j = 0; j < numPosts; j++) {

            // Llamámos al fichero ZanonEntity
            ZanonEntity oZanonEntity = new ZanonEntity();

            String rutina = rutinas.get(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, rutinas.size() -1));

            // Establecemos un título
            oZanonEntity.setTitulo(extraerTitulo(rutina));

            // Generamos contenido
            oZanonEntity.setContenido(extraerContenido(rutina));

            // Generamos etiquetas a partir del contenido
            oZanonEntity.setEtiquetas(extraerEtiquetas(extraerContenido(rutina)));

            // Establecemos la fecha de creación y modificación
            oZanonEntity.setFechaCreacion(LocalDateTime.now());
            oZanonEntity.setFechaModificacion(null);

            // Establecemos si la rutina es pública o no (Público = 1 | Privado = 0)
            oZanonEntity.setPublico(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, 1));

            // Establecemos la categoría
            oZanonEntity.setCategoria(extraerCategoria(extraerTitulo(rutina)));

            // Establecemos una duración aleatoria
            oZanonEntity.setDuracion(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(5, 60));

            // Establecemos una dificultad aleatoria
            oZanonEntity.setDificultad(dificultades[oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, dificultades.length - 1)]);

            // Establecemos una imagen (como es opcional, la dejamos como null)
            oZanonEntity.setImagen(null);

            // Lo guardamos todo en la base de datos
            oZanonRepository.save(oZanonEntity);
        }

        // Se devuelve el total de registros
        return oZanonRepository.count();
    }
}
