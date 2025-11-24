package net.ausiasmarch.persutil.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import net.ausiasmarch.persutil.entity.ZanonEntity;
import net.ausiasmarch.persutil.repository.ZanonRepository;

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
        rutinas.add("Full body: Sentadilla 3x10, Press banca 3x10, Remo 3x10");
    }

    public Long registroRutinas(Long numPosts) {
        for (long j = 0; j < numPosts; j++) {

            // Crea ZanonEntity, y la rellana con datos aleatorios
            ZanonEntity oZanonEntity = new ZanonEntity();
            oZanonEntity.setTitulo(rutinas.get(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, rutinas.size() - 1)));

            // Rellena el contenido
            String contenidoGenerado = "";
            int numRutinas = oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(1, 30);

            for (int i = 1; i <= numRutinas; i++) {
                contenidoGenerado += rutinas.get(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, rutinas.size() - 1)) + " ";

                if (oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, 10) == 1) {
                    contenidoGenerado += "\n";
                }
            }

            oZanonEntity.setContenido(contenidoGenerado.trim());
            contenidoGenerado += "\n";

            // Se extraen 5 palabras aleatorias del contenido para las etiquetas
            String[] palabras = contenidoGenerado.split(" ");

            // Se eliminan los signos de puntuacion de las palabras
            for (int i = 0; i < palabras.length; i++) {
                palabras[i] = palabras[i].replace(".", "").replace(",", "").replace(";", "").replace(":", "").replace("!", "").replace("?", "");
            }

            // Se convierten todas las palabras a minúsculas
            for (int i = 0; i < palabras.length; i++) {
                palabras[i] = palabras[i].toLowerCase();
            }

            // Se seleccionan palabras de más de 4 letras
            ArrayList<String> alPalabrasFiltradas = new ArrayList<>();

            for (String palabra : palabras) {
                if (palabra.length() > 4 && !alPalabrasFiltradas.contains(palabra)) {
                    alPalabrasFiltradas.add(palabra);
                }
            }

            palabras = alPalabrasFiltradas.toArray(new String[0]);

            String etiquetas = "";

            for (int i = 0; i < 5; i++) {
                String palabra = palabras[oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, palabras.length - 1)];
                if (!etiquetas.contains(palabra)) {
                    etiquetas += palabra + ", ";
                }
            }

            // Se elimina la última coma y el espacio
            if (etiquetas.endsWith(", ")) {
                etiquetas = etiquetas.substring(0, etiquetas.length() - 2);
            }

            oZanonEntity.setEtiquetas(etiquetas);

            // Se establece la fecha de creación y modificación
            oZanonEntity.setFechaCreacion(LocalDateTime.now());
            oZanonEntity.setFechaModificacion(null);

            // Se guarda la Entity en la base de datos
            oZanonRepository.save(oZanonEntity);
        }

        return oZanonRepository.count();
    }
}
