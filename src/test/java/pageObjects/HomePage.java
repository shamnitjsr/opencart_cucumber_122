package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class HomePage extends BasePage {

	public HomePage(WebDriver driver) {
		super(driver);
	}

	// Elements
	@FindBy(xpath = "//span[text()='My Account']")
	WebElement lnkMyaccount;

	@FindBy(linkText = "Register")
	WebElement lnkRegister;

	@FindBy(linkText = "Login") // Login link added in step6
	WebElement linkLogin;

	@FindBy(xpath = "//input[@placeholder='Search']") // For search Product Test
	WebElement txtSearchbox;

	@FindBy(xpath = "//div[@id='search']//button[@type='button']") // For Search Product Test
	WebElement btnSearch;

	// Action Methods
	public void clickMyAccount() {
		lnkMyaccount.click();
	}

	public void clickRegister() {
		lnkRegister.click();
	}

	public void clickLogin() {
		linkLogin.click();
	}

	public void enterProductName(String pName) {
		txtSearchbox.sendKeys(pName);
	}

	public void clickSearch() {
		btnSearch.click();
	}

}
