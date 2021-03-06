package org.registrator.community.config.web;


import javax.servlet.Filter;

import org.registrator.community.config.AdditionalAppConfig;
import org.registrator.community.config.AspectConfig;
import org.registrator.community.config.AsyncConfig;
import org.registrator.community.config.SecurityConfiguration;
import org.registrator.community.config.root.DevelopmentConfiguration;
import org.registrator.community.config.root.SpringRootConfig;
import org.registrator.community.config.root.TestingConfiguration;
import org.registrator.community.controller.filter.LocaleConfigurerFilter;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.RequestContextFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class MyWebInitializer extends
        AbstractAnnotationConfigDispatcherServletInitializer  {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { SpringRootConfig.class,DevelopmentConfiguration.class
                ,TestingConfiguration.class ,SecurityConfiguration.class
                , AdditionalAppConfig.class, AsyncConfig.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { SpringWebConfig.class, AspectConfig.class };
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }

    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);

        LocaleConfigurerFilter localeConfigurerFilter = new LocaleConfigurerFilter();
        return new Filter[]{characterEncodingFilter, localeConfigurerFilter};
    }

    @Override
    protected WebApplicationContext createRootApplicationContext() {
        WebApplicationContext context =
                (WebApplicationContext)super.createRootApplicationContext();
        ((ConfigurableEnvironment)context.getEnvironment()).setActiveProfiles("development");
        return context;
    }
}