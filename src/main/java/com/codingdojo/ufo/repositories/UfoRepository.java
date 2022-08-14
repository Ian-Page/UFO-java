package com.codingdojo.ufo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.ufo.models.Ufo;

public interface UfoRepository extends CrudRepository<Ufo,Long> {

	List<Ufo>findAll();
}
