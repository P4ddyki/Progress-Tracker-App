//
//  Statistics.swift
//  Progress Tracker
//
//  Created by Patrick Knab on 24.12.20.
//

import SwiftUI
//import CorePlot


struct Statistics: View {
    
    @AppStorage ("day1") var day1 = 0
    @AppStorage ("day2") var day2 = 0
    @AppStorage ("run") var run = 0
    @AppStorage ("highRun") var highRun = 0
    @AppStorage ("dayRes") var dayRes = 0
    @AppStorage ("allPoints") var allPoints = 0
    @AppStorage ("longRun") var longRun = 0
    
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
    @AppStorage ("ArrayMonth") var ArrayMonth = "0"
    
    @State private var topExpanded: Bool = true
    @State private var topExpanded2: Bool = true
    @State private var topExpanded3: Bool = true
    
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
    
    @AppStorage ("SteppervalueMonth") var SteppervalueMonth = 0

    
    // returns the total saved money so far
    func allMoney() -> Int{
        var total = 0
        let array = ArrayMonth.split(separator: ";").map(String.init)
        for a in array{
            total += Int(a)!
        }
        total += SteppervalueMonth
        return total
    }
    
    //get highest run so far
    func calculateHighestRun () -> Int{
        if dayRes > highRun {
            highRun = dayRes
        }
        
        return highRun
    }
    
    //calcualtes all earned points so far
    func calculateAllPoints() -> Int {
        return (allPoints + dayRes)
    }
    
    //retyrns the naming for the tasks
    func naming (name: String) -> String{
        if (name == ""){
            return "Empty"
        }
        else{
            return name
        }
    }
    
    //Returns maximum size of all arrays
    func returnMax () -> Double {
        var min = 1
        if (min < WorkArray.split(separator: ";").count){
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
        if (min < 60) {
            return  Double(min)
        }
        else{
            return 60
        }
        
    }
    
    //return max of givin array
    func returnMaximum(number: Double) -> String {
        var chain = ""
        switch number{
        case 0:
            chain = WorkArray
        case 1:
            chain = WorkRead
        case 2:
            chain = WorkGoal
        case 3:
            chain = WorkLearn
        case 4:
            chain = WorkMoney
        case 5:
            chain = WorkSport
        case 6:
            chain = WorkCreative
        case 7:
            chain = WorkInstrument
        case 8:
            chain = WorkHouse
        case 9:
            chain = ArrayNine
        case 10:
            chain = ArrayTen
        case 11:
            chain = ArrayPoints
        default:
            chain = ""
        }
        let array = chain.split(separator: ";").map{Int($0)!}
        return String(array.max()!)
        
    }
    
    //returns average of given array
    func returnAverage(number: Double, amount: Double) -> String {
        var chain = ""
        switch number{
        case 0:
            chain = WorkArray
        case 1:
            chain = WorkRead
        case 2:
            chain = WorkGoal
        case 3:
            chain = WorkLearn
        case 4:
            chain = WorkMoney
        case 5:
            chain = WorkSport
        case 6:
            chain = WorkCreative
        case 7:
            chain = WorkInstrument
        case 8:
            chain = WorkHouse
        case 9:
            chain = ArrayNine
        case 10:
            chain = ArrayTen
        case 11:
            chain = ArrayPoints
        default:
            chain = ""
        }
        var array = chain.split(separator: ";").map(String.init)
        var number: Double = 0
        if (array.count >= Int(amount) && (amount > 0)){
            array = array.suffix(Int(amount))
            for i in array {
                number += Double(i) ?? 0
            }
            number = (number/amount)
            return String(format: "%.2f", number)
        }
        else{
            let length = array.count
            array = array.suffix(length)
            for i in array {
                number += Double(i) ?? 0
            }
            number = (number/Double(length))
            return String(format: "%.2f", number)
        }
        
    }
    
    
    init(){
        UINavigationBar.appearance().tintColor = .orange
        UISlider.appearance().minimumTrackTintColor = .orange
        UISlider.appearance().maximumTrackTintColor = UIColor.darkGray
        UINavigationBar.appearance().isTranslucent = false
        
    }
    
    var body: some View {
        
        
        NavigationView(){
            VStack{
                HStack{
                    Text("Days: ")
                        .padding()
                        .font(.title)
                    Text("\(Int(AmountDays))")
                        .padding(.trailing)
                        .font(.title)
                        .frame(width: 55.0)
                    Slider(value: $AmountDays, in: 1...returnMax(), step: 1)
                        .padding([.trailing])
                        .accessibilityAddTraits(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Traits@*/AccessibilityTraits()/*@END_MENU_TOKEN@*/)
                }
                ScrollView(){
                    
                    DisclosureGroup("Statistical Average:", isExpanded: $topExpanded) {
                        VStack{
                            ScrollView(){
                                if (nameOne != ""){
                                    HStack{
                                        Text("\(naming( name:nameOne)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                            .padding(.top)
                                        Spacer()
                                        Text("\(returnAverage(number: 0, amount: AmountDays))")
                                            .font(.title2)
                                            .padding(.vertical)
                                    }
                                }
                                if (nameTwo != ""){
                                    HStack{
                                        Text("\(naming( name:nameTwo)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 3, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameThree != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameThree)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 8, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameFour != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameFour)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 6, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameFive != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameFive)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 1, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameSix != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameSix)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 7, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameSeven != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameSeven)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 5, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameEight != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameEight)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 4, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameNine != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameNine)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 9, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                VStack {
                                    if (nameTen != ""){
                                        
                                        HStack{
                                            Text("\(naming( name:nameTen)): ")
                                                .font(.title2)
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            Text("\(returnAverage(number: 10, amount: AmountDays))")
                                                .font(.title2)
                                                .padding([.bottom])
                                        }
                                    }
                                    HStack{
                                        Text("Daily Goal: ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 2, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                    HStack{
                                        Text("Earned Points: ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnAverage(number: 11, amount: AmountDays))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                            }
                        }
                    }
                    .font(.title)
                    .padding(.horizontal)
                    .accentColor(.orange)
                    Divider()
                        .background(Color.orange)

                    DisclosureGroup("Maximum Points:", isExpanded: $topExpanded3) {
                        VStack{
                            ScrollView(){
                                if (nameOne != ""){
                                    HStack{
                                        Text("\(naming( name:nameOne)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                            .padding(.top)
                                        Spacer()
                                        Text("\(returnMaximum(number: 0))")
                                            .font(.title2)
                                            .padding(.vertical)
                                    }
                                }
                                if (nameTwo != ""){
                                    HStack{
                                        Text("\(naming( name:nameTwo)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 3))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameThree != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameThree)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 8))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameFour != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameFour)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 6))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameFive != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameFive)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 1))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameSix != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameSix)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 7))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameSeven != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameSeven)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 5))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameEight != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameEight)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 4))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                if (nameNine != ""){
                                    
                                    HStack{
                                        Text("\(naming( name:nameNine)): ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 9))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
                                }
                                VStack {
                                    if (nameTen != ""){
                                        
                                        HStack{
                                            Text("\(naming( name:nameTen)): ")
                                                .font(.title2)
                                                .fontWeight(.light)
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                            Text("\(returnMaximum(number: 10))")
                                                .font(.title2)
                                                .padding([.bottom])
                                        }
                                    }
                                    HStack{
                                        Text("Daily Goal: ")
                                            .font(.title2)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Text("\(returnMaximum(number: 2))")
                                            .font(.title2)
                                            .padding([.bottom])
                                    }
//                                    HStack{
//                                        Text("Earned Points: ")
//                                            .font(.title2)
//                                            .fontWeight(.light)
//                                            .multilineTextAlignment(.leading)
//                                        Spacer()
//                                        Text("\(returnMaximum(number: 11))")
//                                            .font(.title2)
//                                            .padding([.bottom])
//                                    }
                                }
                            }
                        }
                    }
                    .font(.title)
                    .padding(.horizontal)
                    .accentColor(.orange)
                    Divider()
                        .background(Color.orange)
  
                    DisclosureGroup("Further Statistics:", isExpanded: $topExpanded2) {
                        VStack{
                            ScrollView(){
                                HStack{
                                    Text("All Earned Points: ")
                                        .font(.title2)
                                        .fontWeight(.light)
                                        .multilineTextAlignment(.leading)
                                        .padding([.top])
                                    Spacer()
                                    Text("\(calculateAllPoints())")
                                        .font(.title2)
                                        .padding(.vertical)
                                    
                                }                                
                                HStack{
                                    Text("Highest Earned Points: ")
                                        .font(.title2)
                                        .fontWeight(.light)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    Text("\(calculateHighestRun())")
                                        .font(.title2)
                                        .padding([.bottom])
                                    
                                }
                                HStack{
                                    Text("Longest Run: ")
                                        .font(.title2)
                                        .fontWeight(.light)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    Text("\(longRun)")
                                        .font(.title2)
                                        .padding([.bottom])
                                    
                                }
                                HStack{
                                    Text("Saved Money: ")
                                        .font(.title2)
                                        .fontWeight(.light)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    Text("\(allMoney())")
                                        .font(.title2)
                                        .padding([.bottom])
                                    
                                }
                            }
                        }
                        .padding(.top, -10.0)
                    }
                    .font(.title)
                    .padding(.horizontal)
                    .accentColor(.orange)
                    /*HStack{
                     Spacer()
                     Text("If you want support me: ")
                     .fontWeight(.light)
                     .foregroundColor(Color.orange)
                     Spacer()
                     Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                     Text("Paypal")
                     })
                     .padding(.vertical, 5.0)
                     .padding(.horizontal, 10.0)
                     .foregroundColor(Color.white)
                     .background(Color.orange)
                     .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                     
                     
                     Spacer()
                     }*/
                    
                    Spacer()
                }
                .padding(.top, -10.0)
            }
            .statusBar(hidden: true)
            
        }
        .navigationBarTitle("Statistics")
        //.navigationBarTitleDisplayMode(.inline)
        
    }
    
}
