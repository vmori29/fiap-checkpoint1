package br.com.fiap.checkpoint1.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class CheckpointController {


	@Value("${spring.profiles.active:}")
	private String profile;
	
	@GetMapping("/ping")
	public String ping() {
		return "Pong em: "+profile;
	}
	
}
