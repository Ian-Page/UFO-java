package com.codingdojo.ufo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.ufo.models.Ufo;
import com.codingdojo.ufo.models.User;
import com.codingdojo.ufo.services.UfoService;
import com.codingdojo.ufo.services.UserService;



@Controller
public class UfoController {

	@Autowired
	private UserService users;
	
	@Autowired
    private UfoService ufos;
	
	
	@GetMapping("/home")
    public String home(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	model.addAttribute("ufos", ufos.all());
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "home.jsp";
    }
    
    @GetMapping("/addUfo")
    public String addUfo(@ModelAttribute("ufo") Ufo ufo, Model model, HttpSession session) {
    	
    	
    	User user = users.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	
    	
    	return "add.jsp";
    }
    
    @PostMapping("/ufos")
    public String createUfo(@Valid @ModelAttribute("ufo") Ufo ufo, BindingResult result) {

    	if (result.hasErrors()) {
    		return "add.jsp";
    	}
    	
    	ufos.create(ufo);
    	
    	return "redirect:/home";
    }
    
    @GetMapping("/ufos/{id}/edit")
    public String editUfo(Model model, @PathVariable("id") Long id, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	Ufo ufo = ufos.findById(id);
    	
  
    	
				if ( ufo.getUser().getId() != (Long) session.getAttribute("userId" )) { // check if valid
					
			    	 
			    	return "redirect:/home";	
				}
    	model.addAttribute("ufo", ufo);
    	
    	return "edit.jsp";
    }
    @GetMapping("/ufos/{id}")
    public String showUfo(Model model, @PathVariable("id") Long id, HttpSession session) {
    	
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	Ufo ufo = ufos.findById(id);
    	
    	model.addAttribute("ufo", ufo);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	
    	return "ufo.jsp";
    }
    
    @PutMapping("/ufos/{id}")
    public String updateUfo(@Valid @ModelAttribute("ufo") Ufo ufo, BindingResult result, Model model) {
    	
    	if (result.hasErrors()) {
    		return "edit.jsp";
    	}

    	
        ufos.update(ufo);
        
    	
    	return "redirect:/reports";
    }
    
    /* recently added for delete*/
    @RequestMapping("/ufos/delete/{id}")
	public String deleteUfo(@PathVariable("id") Long id, HttpSession session) {
		
    	
    	if(session.getAttribute("userId") != null) {
		
			Ufo ufo = this.ufos.findById(id);
			
			if (ufo != null) {
				if ( ufo.getUser().getId() == (Long) session.getAttribute("userId" )) { // check if valid
					ufos.delete(ufos.findUfo(id));
			    	 
			    	return "redirect:/home";	
				}
			}
    	}
		
		return "redirect:/home";
    }
    
	@GetMapping("/videos")
    public String videos(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	model.addAttribute("ufos", ufos.all());
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "videos.jsp";
    }
	@GetMapping("/reports")
    public String reports(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	model.addAttribute("ufos", ufos.all());
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "reports.jsp";
    }
	@GetMapping("/contact")
    public String contac(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	model.addAttribute("ufos", ufos.all());
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "contact.jsp";
    }
}
    
		