package com.foamtec.web;

import com.foamtec.domain.AppUser;
import com.foamtec.service.AppUserService;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class MainController {

    @Autowired
    private AppUserService appUserService;

    private final Logger LOGGER = LoggerFactory.getLogger(MainController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model, Principal principal) {
        try {
            AppUser appUser = appUserService.findByUsername(principal.getName());
            model.addObject("userLogin", appUser);
        } catch (Exception e) {
            LOGGER.error("-= NO login=-");
            model.addObject("login", "on");
        }
        LOGGER.debug("-=in homepage=-");
        model.setViewName("home");
        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout,
                              ModelAndView model, Principal principal) {
        try {
            AppUser appUser = appUserService.findByUsername(principal.getName());
            model.addObject("userLogin", appUser);
            model.setViewName("home");
        } catch (Exception e) {
            LOGGER.error("-= NO login=-");
            if (error != null) {
                model.addObject("error", "Invalid username and password!");
            }
            if (logout != null) {
                model.addObject("msg", "You've been logged out successfully.");
            }
            model.addObject("login", "on");
            model.setViewName("login");
        }
        return model;
    }

    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public ModelAndView error(ModelAndView model, Principal principal) {
        try {
            AppUser appUser = appUserService.findByUsername(principal.getName());
            model.addObject("userLogin", appUser);
        } catch (Exception e) {
            LOGGER.error("-= NO login=-");
            model.addObject("login", "on");
        }
        model.setViewName("404");
        return model;
    }
}
