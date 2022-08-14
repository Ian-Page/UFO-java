package com.codingdojo.ufo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.ufo.models.Ufo;
import com.codingdojo.ufo.repositories.UfoRepository;



@Service
public class UfoService {
	
	
	
	@Autowired
	private UfoRepository uforepository;
	
	public Ufo findById(Long id) {
		
		Optional<Ufo> result = uforepository.findById(id);
		if(result.isPresent()) {
			
			return result.get();
			
		}
		return null;
	}
	public List<Ufo> all() {
		return uforepository.findAll();
	}
	
	public Ufo update(Ufo ufo) {
		return uforepository.save(ufo);
	}
	
	public Ufo create(Ufo ufo) {
		return uforepository.save(ufo);
	}
	/* this needs findBook below to work*/
	public void delete(Ufo ufo) {
		uforepository.delete(ufo);
	}
	/* recently added for delete*/
	public Ufo findUfo(Long id) {
		Optional<Ufo> optionalUfo = uforepository.findById(id);
		if(optionalUfo.isPresent()) {
			return optionalUfo.get();
		}else {
			return null;
		}
	}
}

