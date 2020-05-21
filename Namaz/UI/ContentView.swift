//
//  ContentView.swift
//  Namaz
//
//  Created by Камиль Зиязетдинов on 14.05.2020.
//  Copyright © 2020 Камиль Зиязетдинов. All rights reserved.
//

import SwiftUI


  

extension Double {
  func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
    formatter.unitsStyle = style
    guard let formattedString = formatter.string(from: self) else { return "" }
    return formattedString
  }
}

struct ContentView: View {
    
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    @State var selected = 1
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = .blue
        
    }
    var body: some View {
       TabView {
               
        CountDownPray().tabItem {
                   
                Image(systemName: "clock").font(.system(size: 25))
               }
               
               Text("Search").tabItem {
                   
                   Image(systemName: "safari").font(.system(size: 25))
               }
               
               Text("Person").tabItem {
                   
                   Image(systemName: "book").font(.system(size: 25))
               }
               
               Text("Menu").tabItem {
                   
                  Image(systemName: "person").font(.system(size: 25))
               }
               
           }.accentColor(.black)
          
        
       }
    }


    


struct CountDownPray: View {
  
    @State var nextPrayer: Prayer? {
        
        willSet {
            
            self.prayerDateText = newValue?.date == nil ? "Не удалось опредеить дату молитвы" : "Следущий намаз в: \(format: .HHmm, date: newValue!.date)"
            
            self.prayerNameText = "до конца \(newValue?.name.uppercased() ?? "emptyName")"
            
            self.forNextPrayerTimer = newValue?.date == nil ? "" : " \((newValue!.date.timeIntervalSinceNow.asString(style: .positional)))"
            self.allPrayer = "\(newValue?.pray.uppercased() ?? "")"
        }
    
        
    }
    @State var allPrayer: String = ""
    @State var select = false
    @State var prayerDateText:      String = ""
    @State var prayerNameText:      String = ""
    @State var forNextPrayerTimer:  String = ""
    @State var sheet = false
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
           Text(allPrayer)
           Text(prayerNameText)
                .bold()
            Text(forNextPrayerTimer).font(Font.custom("Montserrat-Medium", size: 60))
            Text(prayerDateText).font(Font.custom("Montserrat-Medium", size: 15))
            HStack(spacing: 10) {
            Button(action: {
                self.select.toggle()
            }) {
                Rectangle().foregroundColor(Color("Color1")).frame(width: 130, height: 40).cornerRadius(20).shadow(radius: 5).overlay(Text("Расписание").foregroundColor(.white).font(Font.custom("Montserrat-Medium", size: 15)))
            }.sheet(isPresented: $select, content: {ModalSetting()})
                Button(action: {
                    self.sheet = true
                }) {
                Image("gear2").font(.system(size: 20)).foregroundColor(.black)
                }.sheet(isPresented: $sheet) {
                    ModalSetting()
                }
            }.padding()
        }
        .onReceive(PrayerManager.shared.$nextPray) { self.nextPrayer = $0 }
    }
}

  
