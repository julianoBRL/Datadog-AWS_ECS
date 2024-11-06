package io.github.julianobrl.datadog_aws_ecs.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/simple2")
public class SimpleController2 {

    @GetMapping
    protected String Simple1get(Model model){
        return "simple2";
    }

}
