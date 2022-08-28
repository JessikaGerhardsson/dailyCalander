//
//  ContentView.swift
//  dailyCalendar
//
//  Created by Jessika Gerhardsson on 2022-08-04.
//

import SwiftUI

struct ContentView: View {
    
    @State var goToMenuView = false
    @State var goToAddEvent = false
    @EnvironmentObject var dateHolder: DateHolder
    @State var isPresented = false
    @ObservedObject var event = Event()
    
    
    var time = ["00:00", "00:30", "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30"]

    
    var body: some View {
        
        VStack {
//            navigationTitle(CalendarHelper().weekDayAsString(date: dateHolder.date) + " " + String(CalendarHelper().dayOfMonth(dateHolder.date)) + " " + CalendarHelper().monthString(date: dateHolder.date))
            Spacer()
            HStack {
                Spacer()
                Button {
                    previousDay()
                } label: {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                }
                

                ZStack {
                    Rectangle()
                        .fill(CalendarHelper().weekDayColor(date: dateHolder.date))
                        .frame(minWidth: 100, maxWidth: 150, minHeight: 20, maxHeight: 50)
                        .padding(1)
                    
                    Text(CalendarHelper().weekDayAsString(date: dateHolder.date) + " " + String(CalendarHelper().dayOfMonth(dateHolder.date)) + " " + CalendarHelper().monthString(date: dateHolder.date)).dayOfWeek()
                        .foregroundColor(Color.white)
                }
                Button {
                    nextDay()
                } label: {
                    Image(systemName: "arrow.forward")
                        .imageScale(.large)
                }
                Spacer()

                
                
                
                Menu {
                    Button {
                        //Kalender
                    } label: {
                        Text("Månad")
                    }
                    Button {
                        //Kalender
                    } label: {
                        Text("Vecka")
                    }
                    Button {
                        //Kalender
                    } label: {
                        Text("Dag")
                    }
                    Button {
                        //Kalender
                    } label: {
                        Text("Rutiner")
                    }
                    Button {
                        //Kalender
                    } label: {
                        Text("Inställningar")
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                }
            }
            Spacer()
            ScrollView {
            LazyVStack {
                ForEach(time, id: \.self) { count in
                    HStack {
                        Text(count)
                                .padding()
                        if event.name == nil {
                            Text("")
                        } else {
                            Text(event.name)
                        }

                            Spacer()
                    }

                }
                //showActivity()
            }
        }
            HStack {
                Spacer()
                NavigationLink(destination: AddEvent(), isActive: $goToAddEvent) {
                    Button(action: addEvent)
                    {
                        Image(systemName: "plus.square")
                            .imageScale(.large)
                    }
                .padding()
                }
//                Button(action: addEvent)
//                {
//                    Image(systemName: "plus.square")
//                        .imageScale(.large)
//
//                }
//                .padding()
            }
        }
        .onChange(of: event.name) { _ in
            showActivity()
        }
//        .background(CalendarHelper().weekDayColor(date: dateHolder.date))
        
        
        
    }
    
    func showActivity() {
        ForEach(time, id: \.self) { count in
            HStack {
                Text(count)
                        .padding()
                if event.name == nil {
                    Text("")
                } else {
                    Text(event.name)
                }
                
                    Spacer()
            }
            
        }
    }
    
    func previousDay() {
        dateHolder.date = CalendarHelper().addDays(date: dateHolder.date, days: -1)
    }
    
    func nextDay() {
        dateHolder.date = CalendarHelper().addDays(date: dateHolder.date, days: 1)
    }
    
    func menu() {
        goToMenuView = true
    }
    
    func addEvent() {
        goToAddEvent = true
        isPresented = true
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}

