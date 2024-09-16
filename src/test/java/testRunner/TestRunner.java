package testRunner;

import org.junit.runner.RunWith;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(
		//features = {".//Features/"},
		//features = {".//Features/Login.feature"},
		//features = {".//Features/Registration.feature"},
		//features = {".//Features/LoginDDTExcel.feature"},
		features = {".//Features/Login.feature",".//Features/Registration.feature"},
		//features = {"@target/rerun.txt"},

		glue = {"stepDefinitions","hooks"},

		plugin = { "pretty", "html:reports/myreport.html",
					"rerun:target/rerun.txt",
					"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:" 
				}, 
		dryRun = false,		//checks mapping between scenario steps and step definition methods
		monochrome = true,	//to avoid junk characters in output
		
		publish = true // to publish report in cucumber tagged with @sanity
		
		//tags="@sanity",	//this will execute scenarios tagged with @sanity
//		tags="@regression",
//		tags="@sanity and @regression",
//		tags="@sanity and not @regression",
//		tags="@sanity or @regression"
		
		

)
public class TestRunner {

}
