//
//  CalendarHelper.swift
//  dailyCalendar
//
//  Created by Jessika Gerhardsson on 2022-08-04.
//

import Foundation
import SwiftUI

class CalendarHelper {
    
    
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    func monthYearString(_ date: Date) -> String  {
        dateFormatter.dateFormat = "LLL yyy"
        return dateFormatter.string(from: date)
    }
    
    //Input: 15 Jan 2021 -> Result: January
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    //Veckodagen för daily calendar
    func monthDayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL dd"
        return dateFormatter.string(from: date)
    }
    
    //Input: 15 Jan 2021 -> Result: 2021
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    func timeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func plusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    
    
    func minusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    //Input: 18 Jan 2021 -> Result: 31
    //Returnar antalet dagar i månaden
    func daysInMonth(_ date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    //Returnar datumet
    //Input: 2 Jan 2020 -> Result: 2
    func dayOfMonth(_ date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    //Returnar den första i månaden
    //Input: 15 Jan 2021 -> Result: 1 Jan 2021
    func firstOfMonth(_ date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    func hourFromDate(date: Date) -> Int {
        let components = calendar.dateComponents([.hour], from: date)
        return components.hour!
    }
    
    //Returnar veckodagen
    //Input: 1 Jan 2021 -> Result: 5(Friday)
    func weekDay(_ date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 2
    }
    
    //Returnar veckodagen till daily calendar
    func weekDayAsString(date: Date) -> String {
        switch weekDay(date) {
        case 0:
            return "Måndag"
        case 1:
            return "Tisdag"
        case 2:
            return "Onsdag"
        case 3:
            return "Torsdag"
        case 4:
            return "Fredag"
        case 5:
            return "Lördag"
        case 6:
            return "Söndag"
        default:
            return ""
        }
    }
    
    func weekDayColor(date: Date) -> Color {
        switch weekDay(date) {
        case 0:
            return .green
        case 1:
            return .blue
        case 2:
            return .red
        case 3:
            return .purple
        case 4:
            return .pink
        case 5:
            return .brown
        case 6:
            return .indigo
        default:
            return .black
        }
    }
    
    func dayColor(date: Date) -> UIColor {
        let weekDayColor = date.formatted(.dateTime.weekday())
        let test = String(weekDayColor)
        switch test {
        case "Mon":
            return UIColor(Color.green)
        case "Tus":
            return UIColor(Color.blue)
        case "Wen":
            return UIColor(Color.red)
        case "Thu":
            return UIColor(Color.purple)
        case "Fri":
            return UIColor(Color.pink)
        case "Sat":
            return UIColor(Color.brown)
        case "Sun":
            return UIColor(Color.indigo)
        default:
            return UIColor(Color.black)
        }
    }
    
//    func testdayColor(date: Date) -> UIColor {
//        let weekDayColor = date.formatted(.dateTime.weekday())
//        switch weekDayColor {
//        case 0:
//            return UIColor(Color.green)
//        case 1:
//            return UIColor(Color.blue)
//        case 2:
//            return UIColor(Color.red)
//        case 3:
//            return UIColor(Color.purple)
//        case 4:
//            return UIColor(Color.pink)
//        case 5:
//            return UIColor(Color.brown)
//        case 6:
//            return UIColor(Color.indigo)
//        default:
//            return UIColor(Color.black)
//        }
//    }
    
    func testdayColor2(date: Date) -> UIColor {
        let weekDayColor = date.dayNumberOfWeek()
        switch weekDayColor {
        case 1:
            return UIColor(Color.green)
        case 2:
            return UIColor(Color.blue)
        case 3:
            return UIColor(Color.red)
        case 4:
            return UIColor(Color.purple)
        case 5:
            return UIColor(Color.pink)
        case 6:
            return UIColor(Color.brown)
        case 7:
            return UIColor(Color.indigo)
        default:
            return UIColor(Color.black)
        }
    }

    func testets(date: Date) -> UIColor {
        let testat = date.formatted(.dateTime.weekday())
        
        if testat == "Mån" {
            return UIColor(Color.green)
        } else if testat == "Tis" {
            return UIColor(Color.blue)
        }else if testat == "Ons" {
            return UIColor(Color.red)
        }else if testat == "Tor" {
            return UIColor(Color.purple)
        }else if testat == "Fre" {
            return UIColor(Color.pink)
        }else if testat == "Lör" {
            return UIColor(Color.brown)
        }else if testat == "Sön" {
            return UIColor(Color.indigo)
        }else {
            return UIColor(Color.black)
        }
    }
    
    func testets2(date: Date) -> UIColor {
        let testat = date.dayOfWeek()
        
        if testat == "Mån" {
            return UIColor(Color.green)
        } else if testat == "Tis" {
            return UIColor(Color.blue)
        }else if testat == "Ons" {
            return UIColor(Color.red)
        }else if testat == "Tor" {
            return UIColor(Color.purple)
        }else if testat == "Fre" {
            return UIColor(Color.pink)
        }else if testat == "Lör" {
            return UIColor(Color.brown)
        }else if testat == "Sön" {
            return UIColor(Color.indigo)
        }else {
            return UIColor(Color.black)
        }
    }
    
    
    
    func addDays(date: Date, days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    func sundayForDate(date: Date) -> Date {
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        
        while(current > oneWeekAgo) {
            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
            if currentWeekDay == 1 {
                return current
            }
            current = addDays(date: current, days: -1)
        }
        return current
        
        
        
    }
    
    

    
//    func weekYearString(_ date: Date) -> String  {
//        dateFormatter.dateFormat = "LLL yyy"
//        return dateFormatter.string(from: date)
//    }
    
//    func plusWeek(_ date: Date) -> Date {
//        return calendar.date(byAdding: .weekOfYear, value: 1, to: date)!
//    }
//
//    func minusWeek(_ date: Date) -> Date {
//        return calendar.date(byAdding: .weekOfYear, value: -1, to: date)!
//    }
//
//    func daysInWeek(_ date: Date) -> Int {
//        let range = calendar.range(of: .day, in: .weekOfYear, for: date)!
//        return range.count
//    }
//
//    func firstOfWeek(_ date: Date) -> Date {
//        let components = calendar.dateComponents([.year, .weekOfYear], from: date)
//        return calendar.date(from: components)!
//    }
    
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}

