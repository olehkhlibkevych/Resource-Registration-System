package org.registrator.community.config;

import java.io.IOException;
import java.util.Properties;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.registrator.community.mailer.ReloadableMailSender;
import org.registrator.community.mailer.ReloadableMailSenderImpl;
import org.registrator.community.service.SettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;


@Configuration
@ComponentScan({"org.registrator.community.components", "org.registrator.community.dao"})
@PropertySource(value = "classpath:mail.properties")
public class AdditionalAppConfig {

    @Autowired
    private Environment env;

    @Autowired
    private SettingsService settingsService;

    @Bean(name = "mailSender")
    public ReloadableMailSender mailSender(){
        return new ReloadableMailSenderImpl(settingsService.getSmtpParameters());
    }
    
    @Bean
    public VelocityEngine velocityEngine() throws VelocityException, IOException{
        VelocityEngineFactoryBean factory = new VelocityEngineFactoryBean();
        factory.setResourceLoaderPath(env.getProperty("velocity.resource.loader.path"));
        factory.setPreferFileSystemAccess(env.getProperty("velocity.prefer.file.systema.access", Boolean.class, false));
        Properties props = new Properties();
        props.put("resource.loader", "class");
        props.put("class.resource.loader.class", env.getProperty("velocity.resource.loader.class"));
        factory.setVelocityProperties(props);
        return factory.createVelocityEngine();
    }
    

    
}

