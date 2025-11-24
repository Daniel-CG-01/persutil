package net.ausiasmarch.persutil.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import net.ausiasmarch.persutil.service.ZanonService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/zanon")
public class ZanonApi {

    @Autowired
    ZanonService oZanonService;
    
    @GetMapping("/registro/{numPosts}")
    public ResponseEntity<Long> registroRutinas(
            @PathVariable Long numPosts
    ) {
        return ResponseEntity.ok(oZanonService.registroRutinas(numPosts));
    }
}
