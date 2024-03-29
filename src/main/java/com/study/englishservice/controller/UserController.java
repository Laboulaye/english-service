package com.study.englishservice.controller;

import com.study.englishservice.dto.RoleDTO;
import com.study.englishservice.dto.UserDTO;
import com.study.englishservice.mappers.UserMapper;
import com.study.englishservice.model.Role;
import com.study.englishservice.model.User;
import com.study.englishservice.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final UserMapper userMapper;

    @GetMapping("/users/{id}")
    public UserDTO sayHello(@PathVariable Long id){
        User user = userService.getUser(id);
        return userMapper.toDTO(user);
    }

}
