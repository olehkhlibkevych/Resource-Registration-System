package org.registrator.community.service;

import java.util.List;

import org.registrator.community.entity.Role;
import org.registrator.community.entity.User;
import org.registrator.community.enumeration.UserStatus;

public interface UserService {

	public void changeUserStatus(String login, UserStatus userStatus);

	public List<User> getAllUsers();
	
	public User getUserByLogin(String login);
	
	public List<User> getAllInACtiveUsers();
	
	public void changeUserRole(String login, Role role);
}
