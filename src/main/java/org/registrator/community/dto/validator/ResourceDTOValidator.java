package org.registrator.community.dto.validator;

import org.registrator.community.dao.ResourceRepository;
import org.registrator.community.dto.ResourceDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class ResourceDTOValidator implements Validator{

    @Autowired
    ResourceRepository resourceRepository;
    
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.equals(ResourceDTO.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ResourceDTO resourceDTO = (ResourceDTO) target;
        
        // Resource already exist
        if (resourceRepository.findByIdentifier(resourceDTO.getIdentifier()) != null) {
            errors.rejectValue("identifier", "msg.resource.identifier.exist");
        }
        
    }

}
