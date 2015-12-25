package org.registrator.community.controller;

import java.util.*;

import javax.validation.Valid;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.registrator.community.dao.TomeRepository;
import org.registrator.community.dto.ResourceDTO;
import org.registrator.community.dto.ResourceDiscreteValueDTO;
import org.registrator.community.dto.ResourceLinearValueDTO;
import org.registrator.community.entity.*;
import org.registrator.community.dto.validator.ResourceDTOValidator;
import org.registrator.community.service.ResourceService;
import org.registrator.community.service.ResourceTypeService;
import org.registrator.community.service.impl.DiscreteParameterServiceImpl;
import org.registrator.community.service.impl.LinearParameterServiceImpl;
import org.registrator.community.service.impl.ResourceDiscreteValueServiceImpl;
import org.registrator.community.service.impl.ResourceLinearValueServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/registrator/resource")
public class ResourceController {
	
	@Autowired
	ResourceDTOValidator validator;

    @Autowired
    ResourceService resourceService;

    // to delete
    @Autowired
    ResourceTypeService resourceTypeService;

    // to delete
    @Autowired
    TomeRepository tomeRepository;

    @Autowired
    DiscreteParameterServiceImpl discreteParameterService;

    @Autowired
    LinearParameterServiceImpl linearParameterService;

    @Autowired
    ResourceLinearValueServiceImpl resourceLinearValueService;

    @Autowired
    ResourceDiscreteValueServiceImpl resourceDiscreteValueService;


	/**
	 * Method for loading form for input the parameter of resource (with
	 * existing resource types and registrator)
	 */
	@RequestMapping(value = "/addresource", method = RequestMethod.GET)
	public String addResourceForm(Model model) {
		List<ResourceType> listOfResourceType = resourceTypeService.findAll();
		model.addAttribute("listOfResourceType", listOfResourceType);
		return "allTypes";
	}

    @RequestMapping(value = "/add/{typeId}", method = RequestMethod.GET)
    public String add(@PathVariable Integer typeId, Model model) {
        ResourceType resType = resourceTypeService.
                findByName(resourceTypeService.findById(typeId).getTypeName());
        model.addAttribute("resType", resType);
        List<Tome> tomes = tomeRepository.findAll();
        model.addAttribute("tomes", tomes);
        ResourceDTO newresource = new ResourceDTO();
        model.addAttribute("newresource", newresource);
        return "addResource";
    }

	/**
	 * Method save the resource in table list_of resources
	 */
	@RequestMapping(value = "/add/addresource", method = RequestMethod.POST)
	public String addResource(@Valid @ModelAttribute("newresource") ResourceDTO resourceDTO, 
			BindingResult result, Model model) {
		
		validator.validate(resourceDTO, result);
		if(result.hasErrors()) {
            return "addResource";
            }
		else {
			resourceService.addNewResource(resourceDTO);
			model.addAttribute("resource", resourceDTO);
			return "showResource";
		}
	}
	
	/**
	 * Show the information about resource by identifier
	 */
	@RequestMapping(value = "/get/{identifier}", method = RequestMethod.GET)
	public String getResourceByIdentifier(@PathVariable("identifier") String identifier, Model model) {
		System.out.println("here");
		ResourceDTO resourceDTO = resourceService.findByIdentifier(identifier);
		model.addAttribute("resource", resourceDTO);
		return "showResource";
	}
    
    @RequestMapping(value = "/showAllResources", method = RequestMethod.GET)
    public String showAllResources(Model model) {
        List<ResourceType> resourceTypes = resourceTypeService.findAll();
        model.addAttribute("resourceTypes", resourceTypes);
        return "showAllResources";
    }

    //    @ResponseBody
    @RequestMapping(value = "/getResourcesByTypeId", method = RequestMethod.POST)
    public String showAllResourcesByTypeId(@RequestParam("resourceTypeId") Integer i, Model model) {
        ResourceType type = resourceTypeService.findById(i);
        List<DiscreteParameter> discreteParameters = discreteParameterService.findAllByResourceType(type);
        List<LinearParameter> linearParameters = linearParameterService.findAllByResourceType(type);
        model.addAttribute("discreteParameters", discreteParameters);
        model.addAttribute("linearParameters", linearParameters);
        return "parameters";
    }

    //    @ResponseBody
    @RequestMapping(value = "/resourceSearch", method = RequestMethod.POST)
    public String resourceSearch(
            @RequestParam("discreteParametersId") List<Integer> discreteParamsIds,
            @RequestParam("discreteParametersCompare") List<String> discreteParamsCompares,
            @RequestParam("discreteParametersValue") List<Double> discreteParamsValues,
            @RequestParam("linearParametersId") List<Integer> linearParamsIds,
            @RequestParam("linearParametersValue") List<Double> linearParamsValues,
            Model model) {

        /*
        To send the array from JavaScript we have to put at least 1 element in the array.
        The next code delete this first element.
         */
        discreteParamsIds.remove(0);
        discreteParamsCompares.remove(0);
        discreteParamsValues.remove(0);
        linearParamsIds.remove(0);
        linearParamsValues.remove(0);

        int countValues = 0;
        for (Double discreteParamsValue : discreteParamsValues) {
            if (discreteParamsValue != null) {
                countValues++;
            }
        }
        for (Double linearParamsValue : linearParamsValues) {
            if (linearParamsValue != null) {
                countValues++;
            }
        }

        List<Resource> resourceList = new ArrayList<>();
        List<Resource> resultResourceList = new ArrayList<>();

        List<DiscreteParameter> discreteParameters = new ArrayList<>();
        for (Integer discreteParamsId : discreteParamsIds) {
            discreteParameters.add(discreteParameterService.findById(discreteParamsId));
        }

        List<LinearParameter> linearParameters = new ArrayList<>();
        for (Integer linearParamsId : linearParamsIds) {
            linearParameters.add(linearParameterService.findById(linearParamsId));
        }

        List<ResourceDiscreteValue> resourceDiscreteValues = new ArrayList<>();
        for (int i = 0; i < discreteParamsValues.size(); i++) {
            if ("less".equals(discreteParamsCompares.get(i))) {
                resourceDiscreteValues.addAll(resourceDiscreteValueService.findAllBySmallerValueAndDiscreteParameter(
                        discreteParamsValues.get(i), discreteParameters.get(i)
                ));
            } else if ("greater".equals(discreteParamsCompares.get(i))) {
                resourceDiscreteValues.addAll(resourceDiscreteValueService.findAllByBiggerValueAndDiscreteParameter(
                        discreteParamsValues.get(i), discreteParameters.get(i)
                ));
            } else {
                resourceDiscreteValues.addAll(resourceDiscreteValueService.findAllByValueAndDiscreteParameter(
                        discreteParamsValues.get(i), discreteParameters.get(i)
                ));
            }
        }

        List<ResourceLinearValue> resourceLinearValues = new ArrayList<>();
        for (int i = 0; i < linearParamsValues.size(); i++) {
            resourceLinearValues.addAll(resourceLinearValueService.findAllByValueAndLinearParameter(linearParamsValues.get(i), linearParameters.get(i)));
        }

        for (ResourceDiscreteValue resourceDiscreteValue : resourceDiscreteValues) {
            resourceList.add(resourceDiscreteValue.getResource());
        }

        for (ResourceLinearValue resourceLinearValue : resourceLinearValues) {
            resourceList.add(resourceLinearValue.getResource());
        }

        if(countValues > 1) {
            for (int i = 0; i < resourceList.size() - 1; i++) {
                int k = 0;
                for (int j = i + 1; j < resourceList.size(); j++) {
                    if (resourceList.get(i).getResourcesId() == resourceList.get(j).getResourcesId()) {
                        k++;
                    }
                    if (k == (countValues-1)) {
                        resultResourceList.add(resourceList.get(i));
                    }
                }
            }
        }
        else {
            resultResourceList.addAll(resourceList);
        }

        /*
        Creating ReaourceDTO
         */
        
        List<ResourceDTO> resourceDTOs = new ArrayList<>();

        for (Resource resource : resultResourceList) {

            ResourceDTO resourceDTO = resourceService.getResourceByIdentifier(resource.getIdentifier());
            resourceDTOs.add(resourceDTO);
        }

        model.addAttribute("Resources", resourceDTOs);
        return "resourceSearch";
    }

    @ResponseBody
    @RequestMapping(value = "/countResources", method = RequestMethod.POST)
    public Long countResources() {
        return resourceService.count();
    }

}