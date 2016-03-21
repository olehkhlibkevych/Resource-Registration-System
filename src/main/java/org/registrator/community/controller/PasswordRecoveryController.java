package org.registrator.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.registrator.community.dto.PasswordChangeDTO;
import org.registrator.community.dto.PasswordRecoveryDTO;
import org.registrator.community.service.PasswordRecoveryService;
import org.registrator.community.service.VerificationTokenService;
import org.registrator.community.validator.PasswordChangeValidator;
import org.registrator.community.validator.PasswordRecoveryValidator;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PasswordRecoveryController {

    @Autowired
    Logger logger;

    @Autowired
    private PasswordRecoveryService passwordRecoveryService;
    
    @Autowired
    private VerificationTokenService verificationTokenService;
    
    @Autowired
    private PasswordRecoveryValidator passwordRecoveryValidator;

    @Autowired
    private PasswordChangeValidator passwordChangeValidator;

    @PreAuthorize("hasRole('ROLE_ANONYMOUS')")
    @RequestMapping(value = "/forgot_password", method = RequestMethod.GET)
    public String getForgotPasswordPage() {
        return "forgot_password";
    }
    
    @PreAuthorize("hasRole('ROLE_ANONYMOUS')")
    @RequestMapping(value = "/forgot_password", method = RequestMethod.POST)
    public String handleForgotPasswordEmail(@RequestParam("email") String email, HttpServletRequest request, Model model) {
    	String baseLink = (request.getRequestURL()).toString().split("forgot_password")[0];
    	passwordRecoveryService.sendRecoverPasswordEmail(email,baseLink);
    	model.addAttribute("msg",true);
    	return "forgot_password";
    }   
   
    @PreAuthorize("hasRole('ROLE_ANONYMOUS')")
    @RequestMapping(value = "/password_recovery/{hash}", method = RequestMethod.GET)
    public String getPasswordRecoveryPage(@PathVariable("hash")String hash,Model model){
    	if(verificationTokenService.isExistValidVerificationToken(hash)){
    		model.addAttribute("hash", hash);
    		if (!model.containsAttribute("passwordRecoveryDTO")) {
    	        model.addAttribute("passwordRecoveryDTO", new PasswordRecoveryDTO());
    	    }
    		return "password_recovery";
    	}
    	return "redirect:/";
    }
    
    @PreAuthorize("hasRole('ROLE_ANONYMOUS')")
    @RequestMapping(value = "/password_recovery", method = RequestMethod.POST)
    public String handlePasswordRecoveryForm(@ModelAttribute("passwordRecoveryDTO") PasswordRecoveryDTO passwordRecoveryDTO, BindingResult bindingResult,Model model,
    		RedirectAttributes attr,HttpServletRequest request){
    	passwordRecoveryValidator.validate(passwordRecoveryDTO, bindingResult);
    	if(bindingResult.hasErrors()){
    		attr.addFlashAttribute("org.springframework.validation.BindingResult.passwordRecoveryDTO", bindingResult);
    		attr.addFlashAttribute("passwordRecoveryDTO", passwordRecoveryDTO);
    		return "redirect:"+request.getHeader("Referer");
    	}
    	boolean changePasswordResult=passwordRecoveryService.recoverPasswordByEmailLink(passwordRecoveryDTO.getHash(), passwordRecoveryDTO.getPassword());
    	if(changePasswordResult){
    		model.addAttribute("msg",true);
    		return "password_recovery";
    	}
    	return "redirect:"+request.getHeader("Referer");
    }

	@RequestMapping(value = "/change_password", method = RequestMethod.GET)
	public String getChangePasswordPage() {
		return "change_password";
	}

    @RequestMapping(params = "cancel", value = "/change_password", method = RequestMethod.POST)
    public String cancelChangePassword() {
        return "redirect:/";
    }

    @RequestMapping(params = "update", value = "/change_password", method = RequestMethod.POST)
	public String handleChangePassword(@ModelAttribute("passwordChangeDTO") @Valid PasswordChangeDTO passwordChangeDTO,
            BindingResult bindingResult, Model model) {

        if (!model.containsAttribute("passwordChangeDTO")) {
            model.addAttribute("passwordChangeDTO", new PasswordChangeDTO());
        }

        passwordChangeValidator.validate(passwordChangeDTO, bindingResult);
        if(bindingResult.hasErrors()){
            model.addAttribute("passwordChangeDTO", passwordChangeDTO);
            return "change_password";
        }

        boolean changePasswordResult = passwordRecoveryService.changePasswordByLogin(passwordChangeDTO.getNewPassword());
        if(changePasswordResult){
            model.addAttribute("msg",true);
        }
		return "change_password";
	}

}
