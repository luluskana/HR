package com.foamtec.web;

import com.foamtec.domain.AppUser;
import com.foamtec.service.AppUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@Controller
public class AppUserController {

    @Autowired
    private AppUserService appUserService;

    private final Logger LOGGER = LoggerFactory.getLogger(AppUserController.class);

    @RequestMapping(value = "/appuser", params = "create", method = RequestMethod.GET)
    public ModelAndView appuserCreate(ModelAndView model, Principal principal) {
        try {
            AppUser appUser = appUserService.findByUsername(principal.getName());
            model.addObject("userLogin", appUser);
            if(appUser.getRoleName().equals("admin")) {
                LOGGER.debug("-=in appuserCreate=-");
                model.setViewName("APPUSER/create");
            } else {
                LOGGER.debug("-= not access appuserCreate=-");
                model.setViewName("404");
            }
        } catch (Exception e) {
            LOGGER.error("-= NO login=-");
            model.addObject("login", "on");
            model.setViewName("404");
        }
        return model;
    }

    @RequestMapping(value = "/appuser/{id}", params = "update", method = RequestMethod.GET)
    public ModelAndView appuserUpdate(@PathVariable("id") Long id, ModelAndView model, Principal principal) {
        try {
            AppUser appUser = appUserService.findByUsername(principal.getName());
            model.addObject("userLogin", appUser);
            if(appUser.getRoleName().equals("admin")) {
                model.addObject("appUser", appUserService.findById(id));
                LOGGER.debug("-=in appuserUpdate=-");
                model.setViewName("APPUSER/update");
            } else {
                LOGGER.debug("-= not access appuserUpdate=-");
                model.setViewName("404");
            }
        } catch (Exception e) {
            LOGGER.error("-= NO login=-");
            model.addObject("login", "on");
            model.setViewName("404");
        }
        return model;
    }

    @RequestMapping(value = "/appuser/{id}", params = "profile", method = RequestMethod.GET)
    public ModelAndView appuserUpdateProfile(@PathVariable("id") Long id, ModelAndView model, Principal principal) {
        try {
            AppUser appUserInLogon = appUserService.findByUsername(principal.getName());
            AppUser appUserEdit = appUserService.findById(id);
            model.addObject("userLogin", appUserInLogon);
            if(appUserEdit != null) {
                if(appUserInLogon.getUsername().equals(appUserEdit.getUsername())) {
                    model.addObject("appUser", appUserService.findById(id));
                    LOGGER.debug("-=in updateProfile=-");
                    model.setViewName("APPUSER/updateProfile");
                }
            } else {
                LOGGER.debug("-= not access appuserUpdate=-");
                model.setViewName("404");
            }
        } catch (Exception e) {
            LOGGER.error("-= NO login=-");
            model.addObject("login", "on");
            model.setViewName("404");
        }
        return model;
    }

    @RequestMapping(value = "/appuser", params = "list", method = RequestMethod.GET)
    public ModelAndView appUserPageList(ModelAndView model, Principal principal) {
        try {
            AppUser userLogin = appUserService.findByUsername(principal.getName());
            model.addObject("userLogin", userLogin);
            if(userLogin.getRoleName().equals("admin")) {
                model.addObject("appUserList", appUserService.findAllAppUser());
                model.setViewName("APPUSER/list");
            } else {
                model.setViewName("404");
            }
        } catch (Exception e) {
            LOGGER.error("-= NO login=-");
            model.addObject("login", "on");
            model.setViewName("404");
        }
        return model;
    }
}
