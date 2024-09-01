package br.xksoberbado.renderexample.web.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
@RequestMapping("v1")
public class ExampleController {

    @GetMapping("hello")
    public String getHello(final String name) {
        return Objects.isNull(name)
            ? "Hello!"
            : String.format("Wow! Hello %s!", name);
    }
}
