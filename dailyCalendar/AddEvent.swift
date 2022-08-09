//
//  AddEvent.swift
//  dailyCalendar
//
//  Created by Jessika Gerhardsson on 2022-08-09.
//

import SwiftUI

struct AddEvent: View {
    
    @State var activityText = ""
    @State var placeText = ""
    @State private var date = Date()
    @State var startDate = Date()
    @State var endDate = Date()
    
    var body: some View {
        VStack {
            Text("Skapa aktivitet")
            TextField("Aktivitet", text: $activityText)
            TextField("Plats", text: $placeText)
            //Välja bild
            
            DatePicker("Start", selection: $startDate, displayedComponents: [.date, .hourAndMinute])
            
            DatePicker("Start", selection: $endDate, displayedComponents: [.date, .hourAndMinute])
            //Text("Restid")
            Button {
                //Kalender
            } label: {
                Text("Kalender")
            }
            Button {
                //Kalender
            } label: {
                Text("Påminelse")
            }
            TextEditor(text: .constant("Anteckning"))
            Button {
                saveActivity()
            } label: {
                Text("Spara")
            }

            
        }
        
        
        
        //Skapa aktivitet rubrik
        //TextField Aktivitet
        //Textfield Plats
        //Bild
        //Start
        //Slut
        //Restid
        //Kalender
        //Påminnelse
        //Anteckning
        
        
    }
    
    func saveActivity() {
        let newEvent = Event()
        newEvent.id = eventList.count
        newEvent.name = activityText
        newEvent.startDate = startDate
        newEvent.endDate = endDate
        newEvent.place = placeText
        eventList.append(newEvent)
        
        dump(eventList)
    }
        
}

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent()
    }
}
