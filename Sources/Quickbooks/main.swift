import Foundation


let file = "balanceSheet.json"
let filePath = FileManager.default.currentDirectoryPath
let fileURL = URL(fileURLWithPath: filePath+"/JSON/"+file)
let jsonText = try String(contentsOf: fileURL, encoding: .utf8)

let balanceSheet = BalanceSheet()

let jsonEncoder = JSONEncoder()
let jsonData = try jsonEncoder.encode(jsonText)

let accountList = balanceSheet.decodeCashAccounts(with: jsonData)

for account in accountList {
    print("\(account.ID), \(account.name), \(account.balance)")
    }
    
