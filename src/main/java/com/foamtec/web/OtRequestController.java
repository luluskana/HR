package com.foamtec.web;

import com.foamtec.domain.AppUser;
import com.foamtec.service.AppUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class OtRequestController {

    @Autowired
    private AppUserService appUserService;

    private final Logger LOGGER = LoggerFactory.getLogger(OtRequestController.class);

    @RequestMapping(value = "/ot", params = "createTemplate", method = RequestMethod.GET)
    public ModelAndView otRequestCreateTemplate(ModelAndView model, Principal principal) {
        try {
            AppUser appUser = appUserService.findByUsername(principal.getName());
            model.addObject("userLogin", appUser);
            LOGGER.debug("-=in otRequestCreateTemplate=-");
            model.setViewName("OT/createTemplate");
        } catch (Exception e) {
            LOGGER.error("-= NO login=-");
            model.addObject("login", "on");
            model.setViewName("404");
        }
        return model;
    }
}
