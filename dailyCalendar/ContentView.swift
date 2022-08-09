//
//  ContentView.swift
//  dailyCalendar
//
//  Created by Jessika Gerhardsson on 2022-08-04.
//

import SwiftUI

struct ContentView: View {
    
    @State var goToMenuView = false
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var time = ["00:00", "00:30", "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30"]
    
    func test() -> Rectangle {
        let testat = dateHolder.date.formatted(.dateTime.weekday())
        
        if testat == "Mån" {
            return Rectangle().fill(.green) as! Rectangle
        } else if testat == "Tis" {
            return Rectangle().fill(.blue) as! Rectangle
        }else if testat == "Ons" {
            return Rectangle().fill(.red) as! Rectangle
        }else if testat == "Tor" {
            return Rectangle().fill(.purple) as! Rectangle
        }else if testat == "Fre" {
            return Rectangle().fill(.pink) as! Rectangle
        }else if testat == "Lör" {
            return Rectangle().fill(.brown) as! Rectangle
        }else if testat == "Sön" {
            return Rectangle().fill(.mint) as! Rectangle
        }else {
            return Rectangle().fill(.black) as! Rectangle
        }
    }

    
    var body: some View {
        VStack {
            
            Spacer()
            //test()
            HStack {
                Spacer()
                ZStack {
                    Rectangle()
                        //.fill(.indigo)
                        
                        .frame(minWidth: 100, maxWidth: 150, minHeight: 20, maxHeight: 50)
                        .padding(1)
                    
                    Text(CalendarHelper().weekDayAsString(date: dateHolder.date) + " " + String(CalendarHelper().dayOfMonth(dateHolder.date)) + " " + CalendarHelper().monthString(date: dateHolder.date)).dayOfWeek()
                        .foregroundColor(Color.white)
                }
                Spacer()
                NavigationLink(destination: MenuView(), isActive: $goToMenuView) {
                    Button(action: menu)
                    {
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                    }
                    .padding()
                }
            }
            Spacer()
            ScrollView {
            LazyVStack {
                ForEach(time, id: \.self) { count in
                    HStack {
                    Text(count)
                            .padding()
                        Spacer()
                    }
                }
            }
        }
        }
        
    }
    
    func menu() {
        goToMenuView = true
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
