package com.example.sportshop.controllers;

import com.example.sportshop.models.User;
import com.example.sportshop.services.BasketService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class BasketController {
    private final BasketService basketService;
    @GetMapping("/basket")
    public String recycler(Principal principal, Model model) {
        User user = basketService.getUserByPrincipal(principal);
        model.addAttribute("basket", basketService.basketList(user.getId()));
        model.addAttribute("user", basketService.getUserByPrincipal(principal));
        return "basket";
    }
    @PostMapping("/product/add/{id}")
    public String addProductInBasket(@PathVariable Long id, Principal principal) {
        basketService.saveProductInBasket(principal, id);
        return "redirect:/";
    }
    @PostMapping("basket/{id}")
    public String deleteProductInBasket(@PathVariable Long id){
     basketService.deleteProductInBasket(id);
    return "redirect:/basket";
    }
}
