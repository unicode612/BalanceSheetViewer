//
//  BalanceSheetModel.swift
//  
//
//  Created by Alex Young on 1/1/22.
//

import Foundation

class BalanceSheet {
    
    func decodeCashAccounts(with:Data) -> Array<Account> {
        
        var accounts : Array<Account> = []
        accounts.append(Account(ID: "AccountID", name:"Account Name", balance:"Account Balance"))
        
        // Your code goes here: please use the JSONdecoder() method to decode the JSON (already imported for you from the file balanceSheet.json using the "with" variable) to capture the account ID, account name and account balance for the two accounts in the "Cash" category and store the information in the "acounts" model (already defined and initialized for you).
        
        //This function should then return an array of three "accounts". 0) the header model, 1) a model with ID: 35, name: Checking", balance: 1350.55 and 2) a model with AccountID:36, name: Savings" and balance: 800.00.
    
        //Note: The sample json data is taken from the Quickbooks API Reference. Therefore, the values in this JSON test data are fictional, merely for the purpose of preparing the code.
        
        
        return accounts
    }
    
    struct Account {
        
        var ID: String
        var name : String
        var balance: String
        
        init(ID:String, name:String, balance:String){
            self.ID = ID
            self.name = name
            self.balance = balance
        }
    }
    
}


