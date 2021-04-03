//
//  GraphsViewController.swift
//  Progress Tracker
//
//  Created by Patrick Knab on 21.01.21.
//

import UIKit
import SwiftUI

import SwiftUICharts

struct GraphsViewController: View {
    
    @AppStorage ("money") var money: Bool = false
    @AppStorage ("day1") var day1 = 0
    @AppStorage ("day2") var day2 = 0
    @AppStorage ("run") var run = 0
    @AppStorage ("highRun") var highRun = 0
    @AppStorage ("dayRes") var dayRes = 0
    @AppStorage ("allPoints") var allPoints = 0
    @AppStorage ("longRun") var longRun = 0
    
    @AppStorage ("ArrayMonth") var ArrayMonth = "0"
    @AppStorage ("WorkArray") var WorkArray = "0"
    @AppStorage ("WorkRead") var WorkRead = "0"
    @AppStorage ("WorkGoal") var WorkGoal = "0"
    @AppStorage ("WorkLearn") var WorkLearn = "0"
    @AppStorage ("WorkMoney") var WorkMoney = "0"
    @AppStorage ("WorkSport") var WorkSport = "0"
    @AppStorage ("WorkCreative") var WorkCreative = "0"
    @AppStorage ("WorkInstrument") var WorkInstrument = "0"
    @AppStorage ("WorkHouse") var WorkHouse = "0"
    @AppStorage ("AmountDays") var AmountDays: Double = 31
    @AppStorage ("ArrayNine") var ArrayNine = "0"
    @AppStorage ("ArrayTen") var ArrayTen = "0"
    @AppStorage ("ArrayPoints") var ArrayPoints = "0"
    
    @AppStorage ("nameOne") var nameOne = "Task1"
    @AppStorage ("nameTwo") var nameTwo = "Task2"
    @AppStorage ("nameThree") var nameThree = "Task3"
    @AppStorage ("nameFour") var nameFour = ""
    @AppStorage ("nameFive") var nameFive = ""
    @AppStorage ("nameSix") var nameSix = ""
    @AppStorage ("nameSeven") var nameSeven = ""
    @AppStorage ("nameEight") var nameEight = ""
    @AppStorage ("nameNine") var nameNine = ""
    @AppStorage ("nameTen") var nameTen = ""
    
    @AppStorage ("scheme") var scheme = 0
    
    @State private var topExpanded: Bool = true
    @State private var topExpanded2: Bool = true
    
    init(){
        UINavigationBar.appearance().tintColor = .orange
        UINavigationBar.appearance().isTranslucent = false
        
    }
    //Returns maximum size of all arrays
    func returnMax (s: String) -> Double {
        return Double(s.split(separator: ";").count)
        /*if (min < WorkArray.split(separator: ";").count){
         min = WorkArray.split(separator: ";").count
         }
         if (min < WorkRead.split(separator: ";").count){
         min = WorkRead.split(separator: ";").count
         }
         if (min < WorkGoal.split(separator: ";").count){
         min = WorkGoal.split(separator: ";").count
         }
         if (min < WorkLearn.split(separator: ";").count){
         min = WorkLearn.split(separator: ";").count
         }
         if (min < WorkMoney.split(separator: ";").count){
         min = WorkMoney.split(separator: ";").count
         }
         if (min < WorkSport.split(separator: ";").count){
         min = WorkSport.split(separator: ";").count
         }
         if (min < WorkCreative.split(separator: ";").count){
         min = WorkCreative.split(separator: ";").count
         }
         if (min < WorkInstrument.split(separator: ";").count){
         min = WorkInstrument.split(separator: ";").count
         }
         if (min < WorkHouse.split(separator: ";").count){
         min = WorkHouse.split(separator: ";").count
         }
         if (min < ArrayNine.split(separator: ";").count){
         min = ArrayNine.split(separator: ";").count
         }
         if (min < ArrayTen.split(separator: ";").count){
         min = ArrayTen.split(separator: ";").count
         }
         if (min < 31) {
         return  Double(min)
         }
         else{
         return 
         }*/
        
    }
    
    func returnArray(chain: String, days: Int) -> Array<Double> {
        
        let array = chain.split(separator: ";").map(String.init)
        var arrayInt = array.compactMap { Double($0) }
        
        if (array.count >= Int(days) && (days > 0)){
            arrayInt = arrayInt.suffix(Int(days))
            
            return arrayInt
        }
        else{
            return arrayInt
        }
        
    }
    
    //Return array with all names
    func getArray() -> Array<String>{
        var arrayReturn: [String] = []
        arrayReturn.append("Daily Goal")
        arrayReturn.append("Daily Points")
        if (nameOne != ""){
            arrayReturn.append(nameOne)
        }
        if (nameTwo != ""){
            arrayReturn.append(nameTwo)
        }
        if (nameThree != ""){
            arrayReturn.append(nameThree)
        }
        if (nameFour != ""){
            arrayReturn.append(nameFour)
        }
        if (nameFive != ""){
            arrayReturn.append(nameFive)
        }
        if (nameSix != ""){
            arrayReturn.append(nameSix)
        }
        if (nameSeven != ""){
            arrayReturn.append(nameSeven)
        }
        if (nameEight != ""){
            arrayReturn.append(nameEight)
        }
        if (nameNine != ""){
            arrayReturn.append(nameNine)
        }
        if (nameTen != ""){
            arrayReturn.append(nameTen)
        }
        if (money){
            arrayReturn.append("Money Savings")
        }
        
        return arrayReturn
    }
    
    //getArrayname from name
    
    func getArrayName (s: String) -> String {
        if (nameOne == s){
            return WorkArray
        }
        if (nameTwo == s){
            return WorkLearn
        }
        if (nameThree == s){
            return WorkHouse
        }
        if (nameFour == s){
            return WorkCreative
        }
        if (nameFive == s){
            return WorkRead
        }
        if (nameSix == s){
            return WorkInstrument
        }
        if (nameSeven == s){
            return WorkSport
        }
        if (nameEight == s){
            return WorkMoney
        }
        if (nameNine == s){
            return ArrayNine
        }
        if (nameTen == s){
            return ArrayTen
        }
        if ("Money Savings" == s){
            return ArrayMonth
        }
        if ("Daily Goal" == s){
            return WorkGoal
        }
        if ("Daily Points" == s){
            return ArrayPoints
        }
        
        return WorkGoal
    }
    
    
    @State private var selectedTopic = "Daily Points"
    
    
    var body: some View {
        
        NavigationView(){
            VStack(){
                VStack(){
                    if (scheme == 0){
                        LineView(data: returnArray(chain: getArrayName(s: selectedTopic), days: Int(AmountDays)), title: "\(selectedTopic)", style: Styles.barChartStyleOrangeDark).padding([.leading, .bottom, .trailing]).frame(height: 320.0)
                    }
                    else{
                        LineView(data: returnArray(chain: getArrayName(s: selectedTopic), days: Int(AmountDays)), title: "\(selectedTopic)", style: Styles.barChartStyleOrangeLight).padding([.leading, .bottom, .trailing]).frame(height: 320.0)
                    }
                    ScrollView(){
                        VStack(){
                            let topic = getArray()
                            HStack(){
                                Text("Select Topic: ")
                                    .fontWeight(.bold)
                                    .padding()
                                    .font(.title)
                                Spacer()
                            }
                            Picker("Please choose a topic", selection: $selectedTopic) {
                                ForEach(topic, id: \.self) {
                                    Text($0)
                                }
                            }
                            .padding(.top, -35.0)
                            
                            HStack{
                                Text("Days: ")
                                    .fontWeight(.bold)
                                    .padding()
                                    .font(.title)
                                Text("\(Int(AmountDays))")
                                    .fontWeight(.bold)
                                    .padding(.trailing)
                                    .font(.title)
                                    .frame(width: 55.0)
                                Slider(value: $AmountDays, in: 1...returnMax(s: getArrayName(s: selectedTopic)), step: 1)
                                    .padding([.trailing])
                                    .accessibilityAddTraits(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Traits@*/AccessibilityTraits()/*@END_MENU_TOKEN@*/)
                            }
                            .padding(.top, -20.0)
                            
                        }
                    }
                    Spacer()
                    /*HStack{
                     Text("Topic: ")
                     .fontWeight(.bold)
                     .padding()
                     .font(.title)
                     Spacer()
                     }
                     .padding(.bottom, -30.0)
                     HStack{
                     Text("Period: ")
                     .fontWeight(.bold)
                     .padding()
                     .font(.title)
                     Spacer()
                     }
                     .padding(.bottom, -30.0)
                     HStack{
                     Text("Days: ")
                     .fontWeight(.bold)
                     .padding()
                     .font(.title)
                     Text("\(Int(AmountDays))")
                     .fontWeight(.bold)
                     .padding(.trailing)
                     .font(.title)
                     .frame(width: 55.0)
                     Slider(value: $AmountDays, in: 1...returnMax(), step: 1)
                     .padding([.trailing])
                     .accessibilityAddTraits(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Traits@*/AccessibilityTraits()/*@END_MENU_TOKEN@*/)
                     }
                     }
                     ScrollView{
                     if (scheme == 0){
                     LineView(data: returnArray(chain: WorkGoal, days: Int(AmountDays)), title: "Daily Goal", style: Styles.barChartStyleOrangeDark).padding([.top], -20.0).frame(height: 320.0).padding([.leading, .trailing])
                     LineView(data: returnArray(chain: ArrayPoints, days: Int(AmountDays)), title: "Earned Points", style: Styles.barChartStyleOrangeDark).padding([.top], -20.0).frame(height: 320.0).padding([.leading, .trailing])
                     
                     if (nameOne != ""){
                     LineView(data: returnArray(chain: WorkArray, days: Int(AmountDays)), title: "\(nameOne)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     if (nameTwo != ""){
                     LineView(data: returnArray(chain: WorkLearn, days: Int(AmountDays)), title: "\(nameTwo)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     if (nameThree != ""){
                     LineView(data: returnArray(chain: WorkHouse, days: Int(AmountDays)), title: "\(nameThree)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     if (nameFour != ""){
                     LineView(data: returnArray(chain: WorkCreative, days: Int(AmountDays)), title: "\(nameFour)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     if (nameFive != ""){
                     LineView(data: returnArray(chain: WorkRead, days: Int(AmountDays)), title: "\(nameFive)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     if (nameSix != ""){
                     LineView(data: returnArray(chain: WorkInstrument, days: Int(AmountDays)), title: "\(nameSix)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     if (nameSeven != ""){
                     LineView(data: returnArray(chain: WorkSport, days: Int(AmountDays)), title: "\(nameSeven)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     VStack(){
                     if (nameEight != ""){
                     LineView(data: returnArray(chain: WorkMoney, days: Int(AmountDays)), title: "\(nameEight)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     if (nameNine != ""){
                     LineView(data: returnArray(chain: ArrayNine, days: Int(AmountDays)), title: "\(nameNine)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     
                     if (nameTen != ""){
                     LineView(data: returnArray(chain: ArrayTen, days: Int(AmountDays)), title: "\(nameTen)", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     
                     }
                     if (money){
                     LineView(data: returnArray(chain: ArrayMonth, days: Int(AmountDays)), title: "Money saved per month", style: Styles.barChartStyleOrangeDark).padding().frame(height: 320.0)
                     }
                     }
                     }
                     else{
                     LineView(data: returnArray(chain: WorkGoal, days: Int(AmountDays)), title: "Daily Goal", style: Styles.barChartStyleOrangeLight).padding([.top], -20.0).frame(height: 320.0).padding([.leading, .trailing])
                     
                     LineView(data: returnArray(chain: ArrayPoints, days: Int(AmountDays)), title: "Earned Points", style: Styles.barChartStyleOrangeLight).padding([.top], -20.0).frame(height: 320.0).padding([.leading, .trailing])
                     
                     if (nameOne != ""){
                     LineView(data: returnArray(chain: WorkArray, days: Int(AmountDays)), title: "\(nameOne)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     if (nameTwo != ""){
                     LineView(data: returnArray(chain: WorkLearn, days: Int(AmountDays)), title: "\(nameTwo)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     if (nameThree != ""){
                     LineView(data: returnArray(chain: WorkHouse, days: Int(AmountDays)), title: "\(nameThree)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     if (nameFour != ""){
                     LineView(data: returnArray(chain: WorkCreative, days: Int(AmountDays)), title: "\(nameFour)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     if (nameFive != ""){
                     LineView(data: returnArray(chain: WorkRead, days: Int(AmountDays)), title: "\(nameFive)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     if (nameSix != ""){
                     LineView(data: returnArray(chain: WorkInstrument, days: Int(AmountDays)), title: "\(nameSix)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     if (nameSeven != ""){
                     LineView(data: returnArray(chain: WorkSport, days: Int(AmountDays)), title: "\(nameSeven)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     
                     VStack(){
                     if (nameEight != ""){
                     LineView(data: returnArray(chain: WorkMoney, days: Int(AmountDays)), title: "\(nameEight)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     if (nameNine != ""){
                     LineView(data: returnArray(chain: ArrayNine, days: Int(AmountDays)), title: "\(nameNine)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     
                     if (nameTen != ""){
                     LineView(data: returnArray(chain: ArrayTen, days: Int(AmountDays)), title: "\(nameTen)", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     if (money){
                     LineView(data: returnArray(chain: ArrayMonth, days: Int(AmountDays)), title: "Money saved per month", style: Styles.barChartStyleOrangeLight).padding().frame(height: 320.0)
                     }
                     }
                     }
                     */
                }
                .padding(.top, -10.0)
            }
        }
        .navigationBarTitle("Graphs")
        //.navigationBarTitleDisplayMode(.inline)
        
    }
}
