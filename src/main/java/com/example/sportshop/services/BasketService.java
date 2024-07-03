package com.example.sportshop.services;

import com.example.sportshop.models.Basket;
import com.example.sportshop.models.Product;
import com.example.sportshop.models.User;
import com.example.sportshop.repositories.BasketRepository;
import com.example.sportshop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class BasketService {
    private final BasketRepository basketRepository;
    private final ProductService productService;
    private final UserRepository userRepository;
    public List<Basket> basketList(Long userId) {
        return basketRepository.findAll()
                .stream()
                .filter(item -> item.getUserId().equals(userId))
                .collect(Collectors.toList());
    }
    public void saveProductInBasket(Principal principal, Long id)  {
        Basket basket = new Basket();
        Product product = productService.getProductById(id);
        basket.setTitle(product.getTitle());
        basket.setSize(product.getSize());
        basket.setCompany(product.getCompany());
        basket.setPrice(product.getPrice());
        basket.setUser(getUserByPrincipal(principal));
        log.info("Saving new Product in Basket. Title: {}; Company: {}", basket.getTitle(), basket.getCompany());
        basketRepository.save(basket);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteProductInBasket(Long id){ basketRepository.deleteById(id);}
}
