//
//  Event.swift
//  dailyCalendar
//
//  Created by Jessika Gerhardsson on 2022-08-09.
//

import Foundation

var eventList = [Event]()

class Event {

    var id: Int!
    var name: String!
    var startDate: Date!
    var endDate: Date!
    var place: String!
    
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvent = [Event]()
        for event in eventList {
            if (event.startDate == date) {
                daysEvent.append(event)
            }
        }
        return daysEvent
    }
    
    func eventsForDateAndTime(date: Date, hour: Int) -> [Event] {
        var daysEvent = [Event]()
        for event in eventList {
            if (event.startDate == date) {
                let eventHour = CalendarHelper().hourFromDate(date: event.startDate)
                if eventHour == hour {
                    daysEvent.append(event)
                }
                
            }
        }
        return daysEvent
    }
    
}

