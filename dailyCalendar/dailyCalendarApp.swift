//
//  dailyCalendarApp.swift
//  dailyCalendar
//
//  Created by Jessika Gerhardsson on 2022-08-04.
//

import SwiftUI

@main
struct dailyCalendarApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
            
            var dateHolder = DateHolder()
            ContentView().environmentObject(dateHolder)
        }
        }
    }
}
