//
//  MonthDateManager.swift
//  OriginalCalendarSample
//
//  Created by 木元健太郎 on 2021/11/06.
//


import Foundation

enum calendarError: Error {
    case getToday
    
    var title: String {
        return "通信エラー"
    }
    
    var message: String {
        switch self {
        case .getToday:
            return "今日の日付の取得に失敗しました"
        }
    }
}



final class MonthDateManager {
    
    private let calendar = Calendar.current
    private (set) var days: [Date] = []
    private var firstDate: Date! {
        didSet {
            days = createDaysForMonth()
        }
    }
    
    
    var monthString: String {
        return firstDate.string(format: "YYYY/MM")
    }
    
    
    
    init() {
        var component = calendar.dateComponents([.year, .month], from: Date())
        component.day = 1
        firstDate = calendar.date(from: component)
        days = createDaysForMonth()
    }
    
    func createToday(completion: ((Result<String, calendarError>) -> Void)?){
        let dt = Date()
        let dateFormatter = DateFormatter()
        
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "YYYY/MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
        completion?(.success(dateFormatter.string(from: dt)))
        
    }
    
    
    private func createDaysForMonth() -> [Date] {
        // 月の初日の曜日
        let dayOfTheWeek = calendar.component(.weekday, from: firstDate) - 1
        // 月の日数
        let numberOfWeeks = calendar.range(of: .weekOfMonth, in: .month, for: firstDate)!.count
        // その月に表示する日数
        let numberOfItems = numberOfWeeks * 7
        
        return (0..<numberOfItems).map { i in
            var dateComponents = DateComponents()
            dateComponents.day = i - dayOfTheWeek
            return calendar.date(byAdding: dateComponents, to: firstDate)!
        }
    }
    
    func nextMonth() {
        firstDate = calendar.date(byAdding: .month, value: 1, to: firstDate)
    }
    
    func prevMonth() {
        firstDate = calendar.date(byAdding: .month, value: -1, to: firstDate)
    }
}
