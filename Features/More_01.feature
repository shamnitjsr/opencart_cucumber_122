Feature: Counter Offer

  @DDISC-1162 @sanity @regression
  Scenario Outline: Navigation for supplier User
    Given Supplier User Has "<User Entitlements>" access
    When User click on <Menu>
    And User click on <Menu Group>
    And User click on <Menu Item>
    Then User Should be navigated to <Navigate To Page>

    Examples: 
      | User Entitlements     | Menu         | Menu Group   | Menu Item | Navigate To Page |
      | Pricing Administrator | Transactions | TRANSACTIONS | Proposal  | Proposal         |

  #Note: This scenario is already covered for processor in DDISC 1202
  @DDISC-1162 @sanity @regression
  Scenario Outline: Proposal - New Tab - Invoice List Data Loading - No data available for User
    Given	 Supplier User has "<User Entitlements>" access

    When Supplier User navigates to "Proposal" page
    And System tries to populate the Invoice List
    When There are no records found
    Then Grid should have message "No Rows To Show"

    Examples: 
      | User Entitlements     |
      | Pricing Administrator |

  #Note: this scenario is already covered for processor in DDISC 1202
  @DDISC-1162 @sanity @regression
  Scenario Outline: proposal - UI Layout - Pricing Administrator
    Given Supplier User has "<User Entitlements>" access
    And one or more Supplier codes has "Early Payment Approval" set as One
    When Supplier User navigates to "Proposal" page
    Then "Proposal" page should be as defined in FIGMA Design
    And Page Title should be "Proposal"
    And Page subtitle should be "Use this screen to select available invoice(s) for early payment and submit."
    And Page should have Amount Summary with below details
      | Field Type         | Content/Field Name                                                   |
      | Summary Title      | These total amounts are calculated based on the invoice(s) selected. |
      | Read Only Text Box | Total Invoice Amount                                                 |
      | Read Only text Box | Total Discount Amount                                                |
      | Read Only Text Box | Total Amount to be paid                                              |
    And Amount Summary should have defailt value as
      | Filed                   | Default Value |
      | Total Invoice Amount    | USD 0.00      |
      | Total Discount Amount   | USD 0.00      |
      | Total Amount to be paid | USD 0.00      |
    And Page should have tabs as below
      | Tab Name         |
      | New              |
      | Pending Approval |
    And Tab "New" should have grid with below fields
      | Fileds             | Data Alignment |
      | Invoice Number     | Left           |
      | Maturity Data      | Center         |
      | Currency           | Left           |
      | Invoice Amount     | Right          |
      | Early Payment Date | Center         |
      | APR                | Right          |
      | Discount	Amount    | Right          |
      | Buyer Name         | Left           |
    #    		|	Status	|	Left	|
    And Tab "New" should not have actions button
    And Tab "Pending Approval" should have grid with belo fields
      | Fileds             | Data Alignment |
      | Invoice Number     | Left           |
      | Maturity Data      | Center         |
      | Currency           | Left           |
      | Invoice Amount     | Right          |
      | Early Payment Date | Center         |
      | APR                | Right          |
      | Discount	Amount    | Right          |
      | Buyer Name         | Left           |
    And Tab "Pending Approval" should not have ACTIONS button
    And Grid should have ability to multiselect rows
    And Grid should have ability to select all rows
    And Page should not have verticle scroll bar for standard screen resolutuon
    And Invoice List should not have verticle scroll for Standard screen resolution
    And Invoice List should horizontal scroll basis Number of fileds in grid.
    And Grid columns should be resizable
    And Grid columns should be rearrangeable
    And Mouse hover functionality should be available in case Data in column is more than maximum supported width (This Functionality is default for overall grid columns)
    And There should not be any Data Wrapping in Grid

    Examples: 
      | User Entitlements     |
      | Pricing Administrator |

  #	Note: this scenario is already covered for processor in DDISC 1202
  @DDISC-1162 @sanity @regression
  Scenario Outline: Proposal - Pending Approval Tab - Invoice List Data Loading - No data avaliable for User
    Given	 Supplier User has "<User Entitlements>" access
    When	 Supplier User navigates to "Proposal" page

    And System tries to populate the Invoice List
    When There are no records found
    Then Grid sould have message "No Rows To Show"

    Examples: 
      | User Entitlements     |
      | Pricing Administrator |
      
	@DDISC-1162 @sanity @regression
#  Additional filters for Buyer Legal Entity/Buyer	Party and Supplier Code Active is adeed as part of DDISC-1206
	Scenario Outline: Proposal - New Tab - Invoice List Data Loading
		Given	 Supplier User has "<User Entitlements>" access
		And	 Supplier User Navigates to "Proposal" page
		When  System tries to populate the Invoice List
		Then All the Invoices whichare in "New" status with Buyer Party with Supplier codes having Discount Election set as "Manual" for Buyer Legal Entity to which current logged in User has entitlement should be loaded
	#Note: Invoice eligiblity is already covered for processor in DDISC 1204 and eligibility logic remains same for pricing administrator
	  Examples:
	  	|	User Entitlements			|
	  	|	Pricing Administrator	|
#Note: this scenario is already cobered for processor in DDISC 1204

