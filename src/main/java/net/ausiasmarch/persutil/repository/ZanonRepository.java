package net.ausiasmarch.persutil.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import net.ausiasmarch.persutil.entity.ZanonEntity;

public interface ZanonRepository extends JpaRepository<ZanonEntity, Long> {

    @Query("SELECT r FROM ZanonEntity r")
    Page<ZanonEntity> buscador(String texto, Pageable oPageable);
}
