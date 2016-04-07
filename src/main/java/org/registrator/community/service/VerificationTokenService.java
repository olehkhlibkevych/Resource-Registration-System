package org.registrator.community.service;

import java.util.Date;
import java.util.List;

import org.registrator.community.entity.VerificationToken;
import org.registrator.community.enumeration.TokenType;

public interface VerificationTokenService {
	
	public boolean deletePasswordVerificationTokenByEmail(String email);
	
	public void deleteVerificationToken(VerificationToken verificationToken);
	
	public VerificationToken savePasswordVerificationToken(String userEmail, Date nowTime);
	
	public String createHashForPasswordToken();
	
	public VerificationToken findVerificationTokenByTokenAndTokenType(String token, TokenType type);
	
	public boolean isExistValidVerificationToken(String token);

    VerificationToken saveEmailConfirmationToken(String login, String userEmail, Date nowTime, String baseLink);

    VerificationToken findVerificationTokenByLoginAndTokenType(String login, TokenType type);

    List<VerificationToken> findVerificationTokensByLoginsAndTokenType(List<String> loginList, TokenType type);

}
