//
//  ViewController.swift
//  BalanceSheetViewer
//
//  Created by Harry on 04/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Load Json File
    func loadJson() -> BalanceSheetModel? {
        if let url = Bundle.main.url(forResource: "balanceSheet", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BalanceSheetModel.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    // MARK: - Display Data
    func loadData(){
        let model = loadJson()
        
//        print("Full Model Data \(model)")
        
        print("<========================= \(model?.header.reportName ?? "") =========================> ")
        print("\n")
        print("========================= Option =========================")
        print("\n")
        for item in model?.header.option ?? []{
            print("Name: \(item.name)")
            print("Value: \(item.value)")
            print("\n")
        }
        
        print("========================= End Option =========================")
        print("\n")
        
        print("DateMacro => \(model?.header.dateMacro ?? "")")
        print("ReportBasis => \(model?.header.reportBasis ?? "")")
        print("StartPeriod => \(model?.header.startPeriod ?? "")")
        print("Currency => \(model?.header.currency ?? "")")
        print("EndPeriod => \(model?.header.endPeriod ?? "")")
        print("Time => \(model?.header.time ?? "")")
        print("SummarizeColumnsBy => \(model?.header.summarizeColumnsBy ?? "")")
        
        print("\n")
        print("========================= ROWS =========================")
        print("\n")
        
        for item in model?.rows.row ?? []{
            print("\n")
            print("ColData: \(item.header.colData.map({$0.value}))")
            print("\n")
            print("Header: \(item.rows.row.map({$0.header}))")
            print("Rows: \(item.rows.row.map({$0.rows}))")
            print("Group: \(item.rows.row.map({$0.group}))")
            print("Summary: \(item.rows.row.map({$0.summary}))")
            print("Type: \(item.rows.row.map({$0.type}))")
            
            print("Header: \(item.rows.row.map({$0.header.}))")
          
        }
        
        print("\n")
        print("========================= Columns =========================")
        for item in model?.columns.column ?? []{
            print("ColTitle: \(item.colTitle) =========  ColType:  \(item.colType)")
            print("Name:     \(item.metaData.map({$0.name})) ========= Value:  \(item.metaData.map({$0.value}))")
            print("\n")
        }
    }

}

