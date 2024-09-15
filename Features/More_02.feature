Feature: Counter Offer

  @DDISC-1162
  Scenario Outline: Counter offer - Navigation - Counter offer Modal Display
    Given Supplier Use has "Pricing Administrator" access for Supplier codes for current program
    And Supplier Code and Buyer Legal Entity Comabination is having Status as Active for the current program
    And Discount Election is selected as Manual for the Supplier code and Buyer Legal Entity Combination
    And At Least one Invoice is eligible for discouting for the Supplier Code and Buyer Legal Combination
    #Note: Invoice eligibility is already covered for processor in DDISC 1204  --  eligible logic rmains same for pricing admin
    And counter offer is pending for the Supplier Code and Buyer Legal Entity Combination
    When Supplier User navigates to the proposal screen
    Then Counter offer modal window should be displayed to the user
    And Background Page should be disabled

    Examples: 
      | Scenario                                                                                                                                                                                     |     | Counter offer modal display |
      | Supplier Code and Buyer Legal Entity Combination Status is pending Discount Election                                                                                                         | No  |                             |
      | Supplier Code and Buyer Legal Entity Combination Status is Active and Discount Election is Auto and no eligible invoice available for discounting                                            | No  |                             |
      | Supplier Code and Buyer Legal Entity Combination Status is Active and Discount Election is Auto and one or more eligible invoice available for discounting                                   | No  |                             |
      | Supplier Code and Buyer Legal Entity Combination Status is Active and Discount Election is Manual and Counter offer is pending and no eligible invoice available for discounting             | No  |                             |
      | Supplier Code and Buyer Legal Entity Combination Status is Active and Discount Election is Manual and Counter offer is pending and one or more  eligible invoice available for discounting   | Yes |                             |
      | Supplier Code and Buyer Legal Entity Combination Status is Active and Discount Election is Manual and Counter offer is completed and one or more  eligible invoice available for discounting | No  |                             |

  @DDISC-1162
  Scenario: Counter Offer - Modal - UI Layout - Pricing Administrator
    Given Supplier User has "Pricing Adminstrator" access for Supplier codes
    And Supplier User navigates to the Proposal Page
    And Counter offer modal window is displayed to the user
    Then Counter offer Modal should be as defined in FIGMA design
    And Modal Title should be "Counteroffer"
    And Modal Description should be "Dynamic Discounting allow you to send a One-Time counteroffer. If you decide to send a counteroffer, and it's approved by the buyer, your Discounting Election would change from manual to automatic. If the counteroffer is not accepted or if you decide to decline the counteroffer, you will continue with the manual discount."	|
    And Modal should have accordions for Automatic Discount and Manual Discount with default status as collapsed
    And Accordion for Automatic Discount should have read only description text as <Automatic Discount Text> when expanded by clicking on arrow
      | Manual Discount Text                                                                                                                                                                                                                                                                                                                                              |
      | Automatic Discount: Once the buyer sends and offer through the j.p Morgan Dynamic Discounting pliateform (and the rate of the offer is not higher than the pricing you are approving today), automatically it is going to be accepted and therefore paid in the buyer on the agreed date. This Counter offer will allow you tohave access to a preferential rate. |
      | At any point of time, you can change the Counter offer from automatic to manual by contacting the customer service team. If you decide to change at any point of time the automatic discount, you will not be eligible for the preferential rate moving forward.                                                                                                  |
      | In case the buyer's offer included a rate higher than the one mentioned today, your company will be able to choose again the discount mode (automatic or manual discount).                                                                                                                                                                                        |
    And Text formatting should be as per Figma
    And Accordion should collapse by clicking on the arrow again for expanded accordian
    And Accordio for Manual Discount should have read only description text as <Manula Discount Text> when expanded by clicking on arrow
      | Manula Discount Text                                                                                                                                                                                                                            |
      | Manula Discount *: J.P. Morgan Dynamic Discouting plateform will make available the offers sent by the buyer for an autorized user of your company to accept. Once accepted, the buyer will be sending the payment on the date that was agreed. |
      | At any point of time, you can change the counter Offer from manual to automatic by contacting the customer service team.                                                                                                                        |
      | *The pricing is referential rate and it's subject to change at any time.                                                                                                                                                                        |
    And Text formatting should be as per Figma
    And Acccordion sholde collapse by clicking on the arrow again for expanded accordion
    And Tile for details of all Supplier and Buyer Legal Entity combination for which counter offer is pending shoulde have Title as <Supplier Name>(<Supplier code>) - <Legal Entity Name>
    And Title of the Tile can be fitted to upto two lines in the tile and use ellipse with three dots and mouse hover functionality in the end of the second line if needed.
    And Tile for details of all Supplier and Buyer Legal Entity combination if or which counter is pending should have below fields
      | Filedtype | Filed Label     |
      | Read Only | Current APR (%) |
      | Editable  | Propsed APR (%) |
    And Field Label Current APR (%) should display the read only value of Manual APR attribute assigned to the supplier for each supplier buyer legal entity combination
    And Field label Current APR (%) and Proposed APR (%) Values should be aligned to right and move towards left depending on the data lenght
    And Modal should have below field
      | Filed Label | Data Tyepe |
      | Comments    | TEXT(255)  |
    And Modal should have below actions
      | Action buttons  | Default Status |
      | REMIND ME LATER | Enabled        |
      | DECLINE         | Enabled        |
      | SUBMIT          | Enabled        |
    And Modal should have a verticle scroll bar for standard screen resolution if all the tiles are not fitting in the display and action buttons should be visible only whenmodal is scrolled down till end

  @DDISC-1162
  Scenario Outline: Counter Offer - Input Fileds Data Type and Lenght
    Given Supplier User has Pricing Administrator access for Supplier codes
    And Supplier User is successfully logged in
    And Supplier User is on the Counter Offer Model
    Then Input fields should support data type and adata length as below
      | Filed Lebel      | Data Type        | UI Display                                  | Default Value | Minimum Limit | Maximium Limit |
      | Proposed APR (%) | PERCENTAGE	(3,8) | 3 digits before decimal and 8 after decimal |               | >0            | <100           |
      | Comments         | TEXT(255)        |                                             |               |               |                |
    When Supplier User types in or paste <Value>	for <Field>	as given below
    Then System behaviour should be <System Behaviour>
    And System should truncate leading and training blank spaces prior to evaluating data lenght

    Examples: 
      | Scenario                                              | Fieled           | Value                      | System Behaviour                                                |
      | Proposed APR (%) within limit                         | Proposed APR (%) |                        5.7 | System should allow to type in or paste                         |
      | Proposed APR (%) below min limit                      | Proposed APR (%) |                          0 | Field level error "Proposed APR (%) should be greater than 0."  |
      | Proposed APR (%) above max limit                      | Proposed APR (%) |                        101 | Field level error "Proposed APR (%) should be less than 100."   |
      | Proposed APR (%) other than numeric                   | Proposed APR (%) | AB                         | System should not allow to type in or paste                     |
      | Proposed APR (%) special characters other than . or , | Proposed APR (%) | @#                         | System should not allow to type in or paste                     |
      | Proposed APR (%) blank spaces                         | Proposed APR (%) |                            | System should not allow to type in or paste                     |
      | Comments blank                                        | Comments         |                            | Field level error "Comments is required."                       |
      | Comments with balnk spaces                            | Comments         |                            | Field level error "Comments is required."                       |
      | Valid Comments                                        | Comments         | Counter offer is submitted | No field level error                                            |
      | Valid Comments more than allowed length               | Comments         | More than 255 characters   | User should not be allowed to type in or paste beyond the limit |

  @DDISC-1162
  Scenario Outline: Supplier Pricing Assignment - Manual Pricing Assignment - Input Fileds Required/Optional Validation
    Given Supplier User has Pricing Administrator access for Supplier codes
    And Supplier User is successfully logged in
    And Supplier User is on the Counter Offer Modal
    And Page has below fields as "Required"
      | Required Fields |
      | Comments        |
    When Supplier User types in or paste <Value> for <Filed> as given below and tab out or shifts focus
    Then System behaviour should be <System Behaviour>
    And System should truncate leading and trailing blank spaces prior to evaluating data length

    Examples: 
      | Scenario                   | Field    | Value                      | System Behaviour                          |
      | Comments blank             | Comments |                            | Field level error "Comments is required." |
      | Comments with blank spaces | Comments |                            | Field level error "Comments is required." |
      | Valid Comments             | Comments | Counter offer is submitted | No field level error                      |

  @DDISC-1162
  Scenario Outline: Counter offer - REMIND ME LATER button behavior
    Given Supplier User has Pricing Administrator access for supplier codes
    And Supplier User is successfully logged in
    And Supplier User is on the Counter offer Modal
    And Supplier User click on "REMIND ME LATER" button
    Then Modal should be closed and background apge should be enabled
    And Action Buttons on the Proposal Page for both the Tabs should be disabled
    And Success Message should be displayed as "You will be reminded about your ability o submit a counter offer when you return to this page."
