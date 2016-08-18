package com.vsm.casestudy;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.*;

public class mainTest {
	private String username = "root";
	private String password = "root";
	private String baseURL = "http://10.44.90.13:8080/CaseStudyVulnerability/LoginPage1.jsp";
	WebDriver driver;

	@BeforeClass
	public void setUp() {
		driver = new FirefoxDriver();
		driver.get(baseURL);
	}
	
	@AfterClass
	public void tearDown() { 
		  driver.quit(); 
	} 

	@Test (priority = 1, enabled = true)
	public void verifySuccessful_Login_ToApplication () {
		loginpage login = new loginpage();
		login.applicationlogin(username, password);
	}

	@Test (priority = 2, enabled = true)
	public void verifySuccessful_WelcomePage () {
		welcomepage welcome= new welcomepage();
		welcome.welcomescreen();
	}
	@Test (priority = 3, enabled = true)
	public void verifySuccessful_DarshboardPage () {
		dashboard dash= new dashboard();
		dash.dashboardpage();;
	}
	@Test (priority = 4, enabled = true)
	public void verifySuccessful_ExecutivePage () {
		executiveSummary execsumm = new executiveSummary();
		execsumm.executiveSummarypage();
	}
}
