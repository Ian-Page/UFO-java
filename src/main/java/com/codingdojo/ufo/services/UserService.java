package com.codingdojo.ufo.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.ufo.models.LoginUser;
import com.codingdojo.ufo.models.User;
import com.codingdojo.ufo.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User register(User newUser, BindingResult result) {
		
		Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());
		
		if(potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "An account with that email already exists!");
			
		}
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "Please match the Password!");
		}
		if(result.hasErrors()) {
    		return null;
    	}
		
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepository.save(newUser);
	}
	public User login(LoginUser newLogin, BindingResult result) {
		Optional<User> potentialUser = userRepository.findByEmail(newLogin.getEmail());
		
		if(!potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "User not found, please try again or register!");
    		return null;
    	}
		
		User user = potentialUser.get();
        
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Please enter a valid Password!");
    	}
		if(result.hasErrors()) {
    		return null;
    	}
			return user;
		}
	 public User findById(Long id) {
	    	Optional<User> potentialUser = userRepository.findById(id);
	    	if(potentialUser.isPresent()) {
	    		return potentialUser.get();
	    	}
	    	return null;
	    }
	
}
