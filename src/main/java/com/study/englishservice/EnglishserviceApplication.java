package com.study.englishservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class EnglishserviceApplication {

    public static void main(String[] args) {
        SpringApplication.run(EnglishserviceApplication.class, args);
    }

    @Bean
    public RestTemplate restTemplate(){
        return new RestTemplateBuilder().build();
    }

}
