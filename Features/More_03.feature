Feature: Counter Offer

  @DDISC-1162
  Scenario Outline: Discount Election - Business Validation on click of DECLINE
    Given Supplier User Has Pricing Administrator access for Supplier Codes
    And Supplier User is successfully logged in
    And Supplier User is on the Counter Offer Modal
    When Supplier User click on "DECLINE" botton
    Then System validate data for below validations
      | Validation                             | Error                |
      | Validation Comments should be inputted | Comments is required |
    And System Behaviour should be <System Behaviour>

    Examples: 
      | Scenario                   | Field    | Value                      | System Behaviour                          |
      | Comments blank             | Comments |                            | Field level error "Comments is required." |
      | Commnets with blank spaces | Comments |                            | Field level error "Comments is required." |
      | Valid Comments             | Comments | Counter offer is submitted | Field level error "Comments is required." |

  @DDISC-1162
  Scenario Outline: Counter offer - DECLINE button behaviour
    Given Supplier User has Pricing Administarator access for supplier codes
    And Supplier User is successfully logged in
    And Supplier User is on the Counter Offer Modal
    When Supplier User click on "DECLINE" button
    Then Modal should be closed and background page should be enabled
    And Success Message should be displayed as "Counter Offer decline is successfully submitted."
    And Action Buttons on the Proposal Page should be displayed
    And System should save the Counter Offer Batch details
    And Counter Offer Batch Status should be Pending Approval

  @DDISC-1162
  Scenario Outline: Counter offer - Business Validations on click of SUBMIT
    Given Supplier User has Adminstrator access for Supplier codes
    And Supplier User is successfully logged in
    And Supplier User is on the Counter Offer Modal
    When Supplier User click on "SUBMIT" botton
    Then System Validate data for below validations
      | Validation                                                                                          | Error                          |
      | Valid Comment should be inputted                                                                    | "Comment is required"          |
      | Valid Proposed APR should be inputted for all the supplier and buyer legal entity combination tiles | "Proposed APR (%) is required" |
    And System Behaviour should be <System Behaviour>

    Examples: 
      Examples:

      | Scenario                   | Field            | Value                      | System Behaviour                                  |
      | Proposed APR (%) blank     | Proposed APR (%) |                            | Field level error "Proposed APR (%) is required." |
      | Valid Proposed APR (%)     | Proposed APR (%) | 3.4                        | No Field level error                              |
      | Comments blank             | Comments         |                            | Field level error "Comments is required."         |
      | Commnets with blank spaces | Comments         |                            | Field level error "Comments is required."         |
      | Valid Comments             | Comments         | Counter offer is submitted | Field level error "Comments is required."         |
      
      
	 
