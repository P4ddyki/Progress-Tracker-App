//
//  ChangeEntries.swift
//  Progress Tracker
//
//  Created by Patrick Knab on 18.03.21.
//

import Foundation
import SwiftUI

struct ChangeEntries: View {
    
    @AppStorage ("SteppervalueWorkHold") var SteppervalueWorkHold = 0
    @AppStorage ("SteppervalueLearnHold") var SteppervalueLearnHold = 0
    @AppStorage ("SteppervalueReadHold") var SteppervalueReadHold = 0
    @AppStorage ("SteppervalueHousWorkHold") var SteppervalueHousWorkHold = 0
    @AppStorage ("SteppervalueMoneyHold") var SteppervalueMoneyHold = 0
    @AppStorage ("SteppervalueSportHold") var SteppervalueSportHold = 0
    @AppStorage ("SteppervalueCreativeHold") var SteppervalueCreativeHold = 0
    @AppStorage ("SteppervalueGoalHold") var SteppervalueGoalHold = 0
    @AppStorage ("SteppervalueInstrumentHold") var SteppervalueInstrumentHold = 0
    @AppStorage ("SteppervalueNineHold") var SteppervalueNineHold = 0
    @AppStorage ("SteppervalueTenHold") var SteppervalueTenHold = 0
    @AppStorage ("SteppervalueMonthHold") var SteppervalueMonthHold = 0
    @AppStorage ("stepperPoints") var stepperPoints = 0
    
    @AppStorage ("AmountDaysN") var AmountDaysN: Double = 31
    
    //variables for arrays
    @AppStorage ("ArrayMonth") var ArrayMonth = "0;0;0"
    @AppStorage ("WorkArray") var WorkArray = "0;0;0"
    @AppStorage ("WorkRead") var WorkRead = "0;0;0"
    @AppStorage ("WorkGoal") var WorkGoal = "0;0;0"
    @AppStorage ("WorkLearn") var WorkLearn = "0;0;0"
    @AppStorage ("WorkMoney") var WorkMoney = "0;0;0"
    @AppStorage ("WorkSport") var WorkSport = "0;0;0"
    @AppStorage ("WorkCreative") var WorkCreative = "0;0;0"
    @AppStorage ("WorkInstrument") var WorkInstrument = "0;0;0"
    @AppStorage ("WorkHouse") var WorkHouse = "0;0;0"
    @AppStorage ("ArrayNine") var ArrayNine = "0;0;0"
    @AppStorage ("ArrayTen") var ArrayTen = "0;0;0"
    @AppStorage ("ArrayPoints") var ArrayPoints = "0;0;0"
    @AppStorage ("testArr") var testArr = "JOJOJOO"
    
    
    @AppStorage ("dataView", store: UserDefaults(suiteName: "group.com.suiteName")) var dataView = "0"
    let defaults = UserDefaults.standard
    //variable if money tracker activated
    @AppStorage ("money") var money: Bool = true
    
    //variables for functionss
    @AppStorage ("dayRes") var dayRes = 0
    @AppStorage ("day1") var day1 = 0
    @AppStorage ("day2") var day2 = 0
    @AppStorage ("month1") var month1 = 0
    @AppStorage ("month2") var month2 = 0
    @AppStorage ("run") var run = 0
    @AppStorage ("longRun") var longRun = 0
    @AppStorage ("allPoints") var allPoints = 0
    
    //variables for names of tasks
    @AppStorage ("minGoal") var minGoal = 0
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
    
    @AppStorage ("defaultMonthValue") var defaultMonthValue = 0
    
    
    @Environment(\.colorScheme) var colorScheme
    
    //    defines the scheme of the app
    func GetScheme(){
        if colorScheme == .dark{
            scheme = 0
        }
        else{
            scheme = 1
        }
    }
    
    //calculates current points
    func calculate()->Int{
        //GetScheme()
        let res = SteppervalueMoneyHold+SteppervalueLearnHold+SteppervalueWorkHold+SteppervalueReadHold+SteppervalueCreativeHold+SteppervalueHousWorkHold+SteppervalueSportHold+SteppervalueInstrumentHold+SteppervalueNineHold+SteppervalueTenHold
        dataView = String(res)
        defaults.set(String(res), forKey: "Number")
        return res
    }
    
    //Splits the sequence of a string
    func splitString(string: String) -> String{
        let outputArray = string.split(separator: ";").map(String.init)
        
        return outputArray[1]
    }
    
    //Saves the data in a String
    func updatePoints() {
        
        
    }
    //returns the naming for the tasks
    func naming (name: String) -> String{
        if (name == ""){
            return "Empty"
        }
        else{
            return (name + " Points:")
        }
    }
    
    func format(i: Int) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        let toDate = Date()
        let today = Calendar.current.date(byAdding: .day, value: -i, to: toDate)!
        return formatter.string(from: today)
    }
    init(){
        UINavigationBar.appearance().tintColor = .orange
        UINavigationBar.appearance().isTranslucent = false
        UITextField.appearance().tintColor = .orange
    }
    
    
    /*
     func clearArray () -> String{
     let outputArray = WorkLearn.split(separator: ";").map(String.init)
     if (outputArray.count > 1){
     var stringArr = ""
     for i in (0)...(outputArray.count-2){
     stringArr = stringArr + ";" + String(outputArray[i])
     }
     WorkLearn = stringArr
     return String(outputArray.count)
     }
     return ""
     }
     */
    func saveValue(i: Int){
        var outputArray = WorkArray.split(separator: ";").map(String.init)
        var save = ""
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueWorkHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkArray = save
        }
        outputArray = WorkRead.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueReadHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkRead = save
        }
        outputArray = WorkGoal.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueGoalHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkGoal = save
        }
        outputArray = WorkLearn.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueLearnHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkLearn = save
        }
        outputArray = WorkSport.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueSportHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkSport = save
        }
        outputArray = WorkCreative.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueCreativeHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkCreative = save
        }
        
        outputArray = WorkInstrument.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueInstrumentHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkInstrument = save
        }
        
        outputArray = WorkHouse.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueHousWorkHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkHouse = save
        }
        
        outputArray = ArrayNine.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueNineHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            ArrayNine = save
        }
        outputArray = ArrayTen.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueTenHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            ArrayTen = save
        }
        outputArray = WorkMoney.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueMoneyHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            WorkMoney = save
        }
        outputArray = ArrayPoints.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            save = ""
            outputArray[outputArray.count-Int(i)] = String(SteppervalueTenHold+SteppervalueWorkHold+SteppervalueReadHold+SteppervalueNineHold+SteppervalueLearnHold+SteppervalueSportHold+SteppervalueCreativeHold+SteppervalueInstrumentHold+SteppervalueHousWorkHold+SteppervalueMoneyHold)
            for j in outputArray{
                save = save +  String(j) + ";"
            }
            ArrayPoints = save
        }
        
    }
    
    func getValue(i: Int){
        var outputArray = WorkArray.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueWorkHold  = Int(outputArray[outputArray.count-Int(i)])!
        }
        outputArray = WorkRead.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueReadHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        outputArray = WorkGoal.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueGoalHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        outputArray = WorkLearn.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueLearnHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        outputArray = WorkSport.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueSportHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        outputArray = WorkCreative.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueCreativeHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        
        outputArray = WorkInstrument.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueInstrumentHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        
        outputArray = WorkHouse.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueHousWorkHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        
        outputArray = ArrayNine.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueNineHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        outputArray = ArrayTen.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueTenHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        outputArray = WorkMoney.split(separator: ";").map(String.init)
        if (outputArray.count >= Int(i)){
            SteppervalueMoneyHold = Int(outputArray[outputArray.count-Int(i)])!
        }
        /*
         outputArray = ArrayPoints.split(separator: ";").map(String.init)
         if (outputArray.count >= Int(i)){
         stepperPoints = SteppervalueTenHold+SteppervalueWorkHold+SteppervalueReadHold+SteppervalueNineHold+SteppervalueLearnHold+SteppervalueSportHold+SteppervalueCreativeHold+SteppervalueInstrumentHold+SteppervalueHousWorkHold+SteppervalueMoneyHold
         }
         */
    }
    
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Change Entries:")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(Color.orange)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .trailing])
                    Spacer()
                }
                .padding(.leading, 7.0)
                HStack{
                    Text("\(format(i: Int(AmountDaysN)))")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -10.0)
                        .frame(width: 170, height: nil)
                    Spacer()
                    Slider(value: $AmountDaysN, in: 1...30, step:1)
                        .padding([.trailing])
                        .accessibilityAddTraits(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Traits@*/AccessibilityTraits()/*@END_MENU_TOKEN@*/)
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    getValue(i: Int(AmountDaysN))
                }, label: {
                    HStack {
                        Text("Show")
                            .fontWeight(.medium)
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.orange)
                    }
                    .frame(width: 80)
                })
                .padding(.vertical, 5.0)
                .padding(.horizontal, 10.0)
                .foregroundColor(Color.white)
                .background(Color.gray)
                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                .padding(.trailing)
            }
            ScrollView{
                VStack(){
                    if (nameOne != ""){
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueWorkHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameOne)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueWorkHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                }
                                
                            }
                            Spacer()
                        }
                    }
                    if (nameTwo != ""){
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueLearnHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameTwo)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueLearnHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                            }
                            Spacer()
                        }
                    }
                    if (nameThree != ""){
                        
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueHousWorkHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameThree)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueHousWorkHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                                
                            }
                            Spacer()
                        }
                    }
                    if (nameFour != ""){
                        
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueCreativeHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameFour)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueCreativeHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                            }
                            Spacer()
                        }
                    }
                    if (nameFive != ""){
                        
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueReadHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameFive)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueReadHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                            }
                            Spacer()
                        }
                    }
                    if (nameSix != ""){
                        
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueInstrumentHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameSix)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueInstrumentHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                            }
                            Spacer()
                        }
                    }
                    if (nameSeven != ""){
                        
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueSportHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameSeven)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueSportHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                                
                            }
                            Spacer()
                        }
                    }
                    if (nameEight != ""){
                        
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueMoneyHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameEight)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueMoneyHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                            }
                            Spacer()
                        }
                    }
                    if (nameNine != ""){
                        
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueNineHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameNine)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueNineHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                            }
                            Spacer()
                        }
                    }
                    
                    if (nameTen != ""){
                        HStack(){
                            Spacer()
                            Stepper(value: $SteppervalueTenHold, in: 0...100) {
                                HStack(){
                                    Text("\(naming(name: nameTen)) ")
                                        .fontWeight(.light)
                                        .font(.title3)
                                    Spacer()
                                    Text("\(SteppervalueTenHold)")
                                        .fontWeight(.light)
                                        .font(.title3)
                                        .padding(.trailing)
                                    
                                }
                            }
                            Spacer()
                        }
                    }
                }
                
                
                .padding(.top, 5.0)
                .padding(.bottom)
                VStack(){
                    HStack(){
                        Spacer()
                        Stepper(value: $SteppervalueGoalHold, in: minGoal...100) {
                            HStack(){
                                Text("Today's goal: ")
                                    .fontWeight(.light)
                                    .font(.title3)
                                Spacer()
                                Text("\(SteppervalueGoalHold)")
                                    .fontWeight(.light)
                                    .font(.title3)
                                    .padding(.trailing)
                                
                            }
                            
                        }
                        Spacer()
                    }
                }
                
                VStack(){
                    HStack(){
                        Spacer()
                        HStack(){
                            Text("Sum: ")
                                .fontWeight(.light)
                                .font(.title3)
                            Spacer()
                            Text("\(SteppervalueTenHold+SteppervalueWorkHold+SteppervalueReadHold+SteppervalueNineHold+SteppervalueLearnHold+SteppervalueSportHold+SteppervalueCreativeHold+SteppervalueInstrumentHold+SteppervalueHousWorkHold+SteppervalueMoneyHold)")
                                .fontWeight(.light)
                                .font(.title3)
                                .padding(.trailing)
                            
                        }
                        
                        
                        Spacer()
                    }
                }
                
                HStack{
                    Spacer()
                    Button(action: {
                        saveValue(i: Int(AmountDaysN))
                    }, label: {
                        HStack {
                            Text("Save")
                                .fontWeight(.medium)
                            Image(systemName: "square.and.arrow.down.fill")
                                .foregroundColor(Color.orange)
                        }
                        .frame(width: 80)
                    })
                    .padding(.vertical, 5.0)
                    .padding(.horizontal, 10.0)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                    .padding(.trailing)
                }
                .padding(.top)
                
                
            }
            .padding(.top, 5.0)
            
            
        }
        .padding(.top, 40.0)
        .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("")
        //.navigationBarHidden(true)
    }
    
}

