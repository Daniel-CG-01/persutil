package net.ausiasmarch.persutil.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
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
        rutinas.add("Full body: Sentadilla 3x10, Press banca 3x10, Remo 3x10");
    }

    public Long registroRutinas(Long numPosts) {
        String[] categorias = {"Pecho", "Espalda", "Piernas", "Brazos", "Hombros", "Full Body"};
        ZanonEntity.Dificultad[] dificultades = ZanonEntity.Dificultad.values();

        for (long j = 0; j < numPosts; j++) {

            // Llamámos al fichero ZanonEntity
            ZanonEntity oZanonEntity = new ZanonEntity();

            // Establecemos un título aleatorio
            oZanonEntity.setTitulo(
                rutinas.get(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, rutinas.size() -1))
            );

            // Generamos contenido aleatorio
            String contenidoGenerado = "";
            int numRutinas = oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(1, 5);

            for (int i = 1; i <= numRutinas; i++) {
                contenidoGenerado += rutinas.get(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, rutinas.size() - 1)) + " ";

                if (oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, 10) == 1) {
                    contenidoGenerado += "\n";
                }
            }

            oZanonEntity.setContenido(contenidoGenerado.trim());

            // Generamos etiquetas aleatorias a partir del contenido
            String[] palabras = contenidoGenerado.replace("[.,;:!?]", "").toLowerCase().split(" ");
            ArrayList<String> palabrasFiltradas = new ArrayList<>();

            for (String palabra : palabras) {
                if (palabra.length() > 4 && !palabrasFiltradas.contains(palabra)) {
                    palabrasFiltradas.add(palabra);
                }
            }

            palabras = palabrasFiltradas.toArray(new String[0]);

            String etiquetas = "";

            for (int i = 0; i < 5; i++) {
                if (palabras.length == 0) {
                    break;
                }

                String palabra = palabras[oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, palabras.length -1)];

                if (!etiquetas.contains(palabra)) {
                    etiquetas += palabra + ", ";
                }
            }

            if (etiquetas.endsWith(", ")) {
                etiquetas = etiquetas.substring(0, etiquetas.length() - 2);
            }

            oZanonEntity.setEtiquetas(etiquetas);

            // Establecemos la fecha de creación y modificación
            oZanonEntity.setFechaCreacion(LocalDateTime.now());
            oZanonEntity.setFechaModificacion(null);

            // Establecemos si la rutina está pública (Público = 1 | Privado = 0)
            oZanonEntity.setPublico(oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, 1));

            // Establecemos una categoría aleatoria
            oZanonEntity.setCategoria(categorias[oAleatorioService.GenerarNumeroAleatorioEnteroEnRango(0, categorias.length - 1)]);

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
