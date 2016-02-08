package org.registrator.community.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.registrator.community.dao.InquiryRepository;
import org.registrator.community.dao.ResourceRepository;
import org.registrator.community.dao.UserRepository;
import org.registrator.community.dto.InquiryListDTO;
import org.registrator.community.dto.UserNameDTO;
import org.registrator.community.entity.Inquiry;
import org.registrator.community.entity.Resource;
import org.registrator.community.entity.TerritorialCommunity;
import org.registrator.community.entity.User;
import org.registrator.community.enumeration.InquiryType;
import org.registrator.community.enumeration.RoleType;
import org.registrator.community.service.InquiryService;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service class implements InquiryService interface.
 * Works with procurations of entering data into the register
 *(input inquiry) and with procurations for an extract from register (output inquiry).
 * @author Ann
 *
 */
@Service
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private Logger logger;
	@Autowired
	private InquiryRepository inquiryRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ResourceRepository resourceRepository;
//	@Autowired
//	private TomeRepository tomeRepository;
	

	
	/**
	 * Method saves the data in the table inquiry_list.
	 */
	@Transactional
	@Override
	public Inquiry addOutputInquiry(String resourceIdentifier, String registratorLogin, String userLogin){
		User user = userRepository.findUserByLogin(userLogin);
		User registrator = userRepository.findUserByLogin(registratorLogin);		
		Resource resource = resourceRepository.findByIdentifier(resourceIdentifier);
		logger.info("try write new line to inquiry_list table");
		Inquiry inquiry = new Inquiry("OUTPUT", new Date(), user, registrator, resource);
		logger.info("wrote line to inquiry_list table");
		inquiryRepository.saveAndFlush(inquiry);	
		return inquiry;
	}
	
	/**
     * Method save input inquiry in database for selected user and saved resource
     * @param ownerLogin
     * @param resourceEntity
     * @param registrator
     */
	@Transactional
	@Override
	public void addInputInquiry(String ownerLogin, Resource resourceEntity, User registrator){
		User user = userRepository.findUserByLogin(ownerLogin);
        Inquiry inquiry = new Inquiry("INPUT", resourceEntity.getDate(), user, registrator, resourceEntity);
        inquiryRepository.saveAndFlush(inquiry);
	}
	
	/**
	 * Method for showing form on UI to input the parameters 
	 * for inquiry to get the certificate aboute the resource 
	 * forms List<TomeDTO> to fill inquiryAddOut.jsp.
	 */	
//	@Override
//	public List<TomeDTO> listTomeDTO(){
//		List<TomeDTO> aListTomeDTO = new ArrayList<>();
//		TomeDTO tomeDTO;
//		List<Tome> tomes = tomeRepository.findAll();
//		for (Tome tome : tomes){
//			tomeDTO = new TomeDTO(tome.getIdentifier(), tome.getRegistrator().getFirstName(), tome.getRegistrator().getLastName(), tome.getRegistrator().getMiddleName());
//			aListTomeDTO.add(tomeDTO);
//		}		
//		return aListTomeDTO;
//	}
	
	/**
	 * Method for showing form on UI to input the parameters 
	 * for inquiry to get the certificate about the resource 
	 * forms List<UserNameDTO> - all registrators linked to logged user to fill inquiryAddOut.jsp.
	 */	
	@Override
	public List<UserNameDTO> listUserNameDTO(String userLogin){	
		logger.info("begin");
		User user = userRepository.findUserByLogin(userLogin);
		TerritorialCommunity territorialCommunity = user.getTerritorialCommunity();
		List<User> registrators = userRepository.getUsersByRoleAndCommunity(RoleType.REGISTRATOR,
								territorialCommunity);
		logger.info("set of registrators is empty " + registrators.isEmpty());
		List<UserNameDTO> aListUserNameDTO = new ArrayList<>();
		UserNameDTO userNameDTO;
		for (User registrator : registrators){
			userNameDTO = new UserNameDTO(registrator.getFirstName(), registrator.getLastName(),
					registrator.getMiddleName(), registrator.getLogin());
			aListUserNameDTO.add(userNameDTO);
			logger.info(userNameDTO.toString());
		}	
		logger.info("end");
		return aListUserNameDTO;
	}
	

	/**
	 * Method for showing all output inquiries from logged user on UI 
	 * (if role of logged user is USER)
	 * or for showing all inquiries to registator of type inquiryType
	 * forms List<InquiryListDTO> to fill listInqUserOut.jsp or listInquiryUserInput.jsp.
	 */
	@Transactional
	@Override
	public List<InquiryListDTO> listInquiryUser(String userLogin, InquiryType inquiryType){
		logger.info("begin");
		List<InquiryListDTO> listInquiryDTO = new ArrayList<InquiryListDTO>();
		InquiryListDTO inquiryListDTO;
		User user = userRepository.findUserByLogin(userLogin);
		
		List<Inquiry> listInquiry;
		if (user.getRole().getType().equals(RoleType.USER)){		
			listInquiry = inquiryRepository.findByUserAndInquiryType(user, inquiryType);
		} else {
			listInquiry = inquiryRepository.findByRegistratorAndInquiryType(user, inquiryType);
		}
		for (Inquiry inquiry : listInquiry){
			inquiryListDTO = new InquiryListDTO(inquiry.getInquiryId(), inquiry.getInquiryType().toString(), 
						inquiry.getDate(), null, null, inquiry.getResource().getIdentifier(),
						inquiry.getResource().getStatus());
			User userFrom =inquiry.getUser();
			inquiryListDTO.setUserName(userFrom.getLastName()+ " " +userFrom.getFirstName()
						+ " " +userFrom.getMiddleName());
			User registrator = inquiry.getRegistrator();
			inquiryListDTO.setRegistratorName(registrator.getLastName()+ " " +registrator.getFirstName()
						+ " " +registrator.getMiddleName());
			listInquiryDTO.add(inquiryListDTO);
		}
		logger.info("end");
		return listInquiryDTO;
	}
		
	/**
	 * Method for deleting chosen inquiry by Id.
	 */
	@Transactional
	@Override
	public void removeInquiry (Integer inquiryId){
		inquiryRepository.delete(inquiryId);
		logger.info("delete line from inquiry_list table with inqury_id = " + inquiryId);
	}
	
}


