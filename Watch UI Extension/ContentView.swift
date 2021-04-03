//
//  ContentView.swift
//  Watch UI Extension
//
//  Created by Patrick Knab on 28.01.21.
//

import SwiftUI

struct ContentView: View {
    
    
    @AppStorage ("DailyGoal") var DailyGoal = 0
    @AppStorage ("SteppervalueWork") var SteppervalueWork = 0

    @AppStorage ("day1") var day1 = 0
    @AppStorage ("day2") var day2 = 0
    
    
    func endOfDay() {
        day2 = day1
        SteppervalueWork = 0
    }
    
    func dating() -> Int {
        let date = Date()
        let calendar = Calendar.current
        day1 = calendar.component(.day, from: date)
        if (day1 != day2){
            endOfDay()
        }
        return DailyGoal
    }
    
    func calculate() -> Double {
        if (Double((Double(SteppervalueWork))/Double(DailyGoal))>=1){
            WKInterfaceDevice.current().play(.success)
        }
        
        return Double((Double(SteppervalueWork))/Double(DailyGoal))
    }
    
    var body: some View {
        
        ScrollView(){
            VStack(){
                HStack(){
                    Text("Progress Tracker")
                        .font(.title2)
                        .fontWeight(.light)
                        .padding([.top, .leading, .trailing])
                    Spacer()
                }
                Spacer()
                HStack(){
                    Text("Your Score:")
                        .font(.title3)
                        .fontWeight(.light)
                        .padding([.top, .leading, .trailing])
                    Spacer()
                    Text("\(dating())")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.orange)
                        .padding([.top, .leading, .trailing])
                    Spacer()
                }
                Spacer()
                ProgressView(value: calculate())
                    .padding()
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.orange))
                
                VStack(){
                    HStack(){
                        Text("Points:")
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                            .frame(width: 65)

                        Spacer()
                        Text("\(SteppervalueWork)")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                            .padding(.leading)
                            .frame(width: 28.0)
                        
                        Spacer()
                        Button(action:{
                                SteppervalueWork -= 1
                            
                        }) {
                            Text("-")
                                .fontWeight(.heavy)
                            
                        }
                        .frame(width: 35.0)
                        Button(action:{
                                SteppervalueWork += 1}) {
                            Text("+")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.orange)
                        }
                        .frame(width: 35.0)
                    }
                    .padding(.trailing)
                }
                
                VStack(){
                    HStack(){
                        Text("Goal:    ")
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                            .frame(width: 65)

                        Spacer()
                        Text("\(DailyGoal)")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                            .padding(.leading)
                            .frame(width: 28.0)
                        Spacer()
                        Button(action:{
                                DailyGoal -= 1}) {
                            Text("-")
                                .fontWeight(.heavy)
                            
                        }
                        .frame(width: 35.0)
                        Button(action:{
                                DailyGoal += 1}) {
                            Text("+")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.orange)
                        }
                        .frame(width: 35.0)
                    }
                    .padding(.trailing)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
