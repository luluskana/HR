package com.foamtec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import javax.sql.DataSource;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/resources/**").permitAll()
                .and().authorizeRequests().antMatchers("/login/**").permitAll()
                .and().authorizeRequests().antMatchers("/appuser**").authenticated()
                .and().authorizeRequests().antMatchers("/appuser/**").authenticated()
                .and().authorizeRequests().antMatchers("/ot**").authenticated()
                .and().authorizeRequests().antMatchers("/ot/**").authenticated()

                .and().csrf().disable().formLogin().loginPage("/login").loginProcessingUrl("/resources/j_spring_security_check").failureUrl("/login?error")
                .defaultSuccessUrl("/", false).usernameParameter("username").passwordParameter("password").permitAll()

                .and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/resources/j_spring_security_logout")).logoutSuccessUrl("/login?logout").permitAll();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("SELECT U.username AS username, U.password as password, U.enabled as enabled FROM APP_USER U where U.username=?")
                .authoritiesByUsernameQuery("SELECT U.username as username, U.rolename as authority FROM APP_USER U WHERE U.username=?")
                .and().inMemoryAuthentication().withUser("hradmin").password("p@ssw0rd").roles("ADMIN");
    }
}

