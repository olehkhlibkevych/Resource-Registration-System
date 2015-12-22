package org.registrator.community.controller;


import org.registrator.community.dto.ResourceTypeDTO;
import org.registrator.community.dto.UserDTO;
import org.registrator.community.entity.ResourceType;
import org.registrator.community.service.ResourceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/registrator/resourcetypes/")
public class EditResTypeController {

	@Autowired
	ResourceTypeService resourceTypeService;

	@RequestMapping(value = "/edit/{typeName}", method = RequestMethod.GET)
	public String addResourceEditTypeForm(@PathVariable ("typeName") String typeName, Model model) {
		ResourceType rt = resourceTypeService.findByName(typeName);
		model.addAttribute("oneResType", rt);
		return "findOneResType";
	}
	
	@RequestMapping(value = "/edit/{typeName}", method = RequestMethod.POST)
    public String editResourceType(@ModelAttribute("newrestype") ResourceTypeDTO resourceTypeDTO, Model model) {
		resourceTypeService.editResourceType(resourceTypeDTO);
		model.addAttribute("editResType", resourceTypeDTO);
		return "findOneResType";
    }
}

