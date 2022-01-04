import Foundation

// MARK: - BalanceSheetModel
struct BalanceSheetModel: Decodable {
    let header: BSModelHeader
    let rows: BSModelRows
    let columns: Columns

    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case rows = "Rows"
        case columns = "Columns"
    }
}

// MARK: - Columns
struct Columns: Decodable {
    let column: [Column]

    enum CodingKeys: String, CodingKey {
        case column = "Column"
    }
}

// MARK: - Column
struct Column: Decodable {
    let colType, colTitle: String
    let metaData: [Option]

    enum CodingKeys: String, CodingKey {
        case colType = "ColType"
        case colTitle = "ColTitle"
        case metaData = "MetaData"
    }
}

// MARK: - Option
struct Option: Decodable {
    let name, value: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
    }
}

// MARK: - WelcomeHeader
struct BSModelHeader: Decodable {
    let reportName: String
    let option: [Option]
    let dateMacro, reportBasis, startPeriod, currency: String
    let endPeriod: String
    let time: String
    let summarizeColumnsBy: String

    enum CodingKeys: String, CodingKey {
        case reportName = "ReportName"
        case option = "Option"
        case dateMacro = "DateMacro"
        case reportBasis = "ReportBasis"
        case startPeriod = "StartPeriod"
        case currency = "Currency"
        case endPeriod = "EndPeriod"
        case time = "Time"
        case summarizeColumnsBy = "SummarizeColumnsBy"
    }
}

// MARK: - WelcomeRows
struct BSModelRows: Decodable {
    let row: [PurpleRow]

    enum CodingKeys: String, CodingKey {
        case row = "Row"
    }
}

// MARK: - PurpleRow
struct PurpleRow: Decodable {
    let header: Header
    let rows: PurpleRows
    let type: TypeEnum
    let group: String
    let summary: Header
    
    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case rows = "Rows"
        case type, group
        case summary = "Summary"
    }
}

// MARK: - Header
struct Header: Decodable {
    let colData: [SummaryColDatum]

    enum CodingKeys: String, CodingKey {
        case colData = "ColData"
    }
}

// MARK: - SummaryColDatum
struct SummaryColDatum: Decodable {
    let value: String
}

// MARK: - PurpleRows
struct PurpleRows: Decodable {
    let row: [FluffyRow]

    enum CodingKeys: String, CodingKey {
        case row = "Row"
    }
}

// MARK: - FluffyRow
struct FluffyRow: Decodable {
    let header: Header
    let rows: FluffyRows
    let type: TypeEnum
    let group: String
    let summary: Header

    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case rows = "Rows"
        case type, group
        case summary = "Summary"
    }
}

// MARK: - FluffyRows
struct FluffyRows: Decodable {
    let row: [TentacledRow]

    enum CodingKeys: String, CodingKey {
        case row = "Row"
    }
}

// MARK: - TentacledRow
struct TentacledRow: Decodable {
    let header: PurpleHeader?
    let rows: TentacledRows?
    let type: TypeEnum
    let group: String?
    let summary: Header?
    let colData: [RowColDatum]?

    enum CodingKeys: String, CodingKey {
        case header = "Header"
        case rows = "Rows"
        case type, group
        case summary = "Summary"
        case colData = "ColData"
    }
}

// MARK: - RowColDatum
struct RowColDatum: Decodable {
    let id: String?
    let value: String
}

// MARK: - PurpleHeader
struct PurpleHeader: Decodable {
    let colData: [RowColDatum]

    enum CodingKeys: String, CodingKey {
        case colData = "ColData"
    }
}

// MARK: - TentacledRows
struct TentacledRows: Decodable {
    let row: [StickyRow]

    enum CodingKeys: String, CodingKey {
        case row = "Row"
    }
}

// MARK: - StickyRow
struct StickyRow: Decodable {
    let colData: [RowColDatum]?
    let type: TypeEnum
    let header: Header?
    let rows: StickyRows?
    let group: String?
    let summary: Header?
    
    enum CodingKeys: String, CodingKey {
        case colData = "ColData"
        case type
        case header = "Header"
        case rows = "Rows"
        case group
        case summary = "Summary"
    }
}

// MARK: - StickyRows
struct StickyRows: Decodable {
    let row: [IndigoRow]

    enum CodingKeys: String, CodingKey {
        case row = "Row"
    }
}

// MARK: - IndigoRow
struct IndigoRow: Decodable {
    let colData: [RowColDatum]
    let type: TypeEnum

    enum CodingKeys: String, CodingKey {
        case colData = "ColData"
        case type
    }
}

enum TypeEnum: String, Codable {
    case data = "Data"
    case section = "Section"
}
