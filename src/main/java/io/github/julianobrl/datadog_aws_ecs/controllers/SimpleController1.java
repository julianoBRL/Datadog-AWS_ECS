package io.github.julianobrl.datadog_aws_ecs.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/simple1")
public class SimpleController1 {

    @GetMapping
    protected String Simple1get(){
        return "SimpleController1 return";
    }

}
