//
//  ContentView.swift
//  Progress Tracker
//
//  Created by Patrick Knab on 20.12.20.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    
    //variables for daily steppers
    @AppStorage ("SteppervalueWork") var SteppervalueWork = 0
    @AppStorage ("SteppervalueLearn") var SteppervalueLearn = 0
    @AppStorage ("SteppervalueRead") var SteppervalueRead = 0
    @AppStorage ("SteppervalueHousWork") var SteppervalueHousWork = 0
    @AppStorage ("SteppervalueMoney") var SteppervalueMoney = 0
    @AppStorage ("SteppervalueSport") var SteppervalueSport = 0
    @AppStorage ("SteppervalueCreative") var SteppervalueCreative = 0
    @AppStorage ("SteppervalueGoal") var SteppervalueGoal = 5
    @AppStorage ("SteppervalueInstrument") var SteppervalueInstrument = 0
    @AppStorage ("SteppervalueNine") var SteppervalueNine = 0
    @AppStorage ("SteppervalueTen") var SteppervalueTen = 0
    @AppStorage ("SteppervalueMonth") var SteppervalueMonth = 0
    
    //Arrays for different Months
    @AppStorage ("JanArr") var JanArr = ""
    @AppStorage ("FebArr") var FebArr = ""
    @AppStorage ("MaArr") var MaArr = ""
    @AppStorage ("ApArr") var ApArr = ""
    @AppStorage ("MayArr") var MayArr = ""
    @AppStorage ("JunArr") var JunArr = ""
    @AppStorage ("JulArr") var JulArr = ""
    @AppStorage ("AugArr") var AugArr = ""
    @AppStorage ("SepArr") var SepArr = ""
    @AppStorage ("OctArr") var OctArr = ""
    @AppStorage ("NovArr") var NovArr = ""
    @AppStorage ("DecArr") var DecArr = ""
    
    
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
    
    @AppStorage ("dataView", store: UserDefaults(suiteName: "group.com.suiteName")) var dataView = "0"
    let defaults = UserDefaults.standard
    //variable if money tracker activated
    @AppStorage ("money") var money: Bool = false
    
    //variables for functionss
    @AppStorage ("dayRes") var dayRes = 0
    @AppStorage ("day1") var day1 = 0
    @AppStorage ("day2") var day2 = 0
    @AppStorage ("day1S") var day1S = ""
    @AppStorage ("day2S") var day2S = ""
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
    @AppStorage ("holder") var holder = 5

    
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
        let res = SteppervalueMoney+SteppervalueLearn+SteppervalueWork+SteppervalueRead+SteppervalueCreative+SteppervalueHousWork+SteppervalueSport+SteppervalueInstrument+SteppervalueNine+SteppervalueTen
        dataView = String(res)
        defaults.set(String(res), forKey: "Number")
        return res
    }
    
    //resets all variables
    func reset(){
        SteppervalueWork = 0
        SteppervalueLearn = 0
        SteppervalueRead = 0
        SteppervalueHousWork = 0
        SteppervalueMoney = 0
        SteppervalueCreative = 0
        SteppervalueSport = 0
        SteppervalueInstrument = 0
        SteppervalueTen = 0
        SteppervalueNine = 0        
        
    }
    
    //Splits the sequence of a string
    func splitString(string: String) -> String{
        let outputArray = string.split(separator: ";").map(String.init)
        
        return outputArray[1]
    }
    
    //Saves the data in a String
    func updatePoints() {
        WorkArray += ";\(SteppervalueWork)"
        WorkRead += ";\(SteppervalueRead)"
        WorkGoal += ";\(SteppervalueGoal)"
        WorkLearn += ";\(SteppervalueLearn)"
        WorkMoney += ";\(SteppervalueMoney)"
        WorkSport += ";\(SteppervalueSport)"
        WorkCreative += ";\(SteppervalueCreative)"
        WorkInstrument += ";\(SteppervalueInstrument)"
        WorkHouse += ";\(SteppervalueHousWork)"
        ArrayTen += ";\(SteppervalueTen)"
        ArrayNine += ";\(SteppervalueNine)"
        ArrayPoints += ";\(calculate())"
        
    }
    
    //Calculates values at the end of each day
    func endOfDay() {
        day2 = day1
        day2S = day1S
        dayRes = calculate()
        allPoints = allPoints + dayRes
        updatePoints()
        reset()
        writeMonth(month: month1)
    }
    
    //Detects array for saving values
    func writeMonth(month: Int){
        let date = Date()
        let calendar = Calendar.current
        let dayOne = calendar.component(.day, from: date)
        
        switch month{
        case 1:
            if (dayOne == 1){
                JanArr = ""
            }
            JanArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
            
        case 2:
            if (dayOne == 1){
                FebArr = ""
            }
            FebArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 3:
            if (dayOne == 1){
                MaArr = ""
            }
            MaArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 4:
            if (dayOne == 1){
                ApArr = ""
            }
            ApArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 5:
            if (dayOne == 1){
                MayArr = ""
            }
            MayArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 6:
            if (dayOne == 1){
                JunArr = ""
            }
            JunArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 7:
            if (dayOne == 1){
                JulArr = ""
            }
            JulArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 8:
            if (dayOne == 1){
                AugArr = ""
            }
            AugArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 10:
            if (dayOne == 1){
                OctArr = ""
            }
            OctArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 11:
            if (dayOne == 1){
                NovArr = ""
            }
            NovArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 9:
            if (dayOne == 1){
                SepArr = ""
            }
            SepArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        case 12:
            if (dayOne == 1){
                DecArr = ""
            }
            DecArr += "\(SteppervalueWork)" + ",\(SteppervalueRead)" + ",\(SteppervalueGoal)" + ",\(SteppervalueLearn)" + ",\(SteppervalueMoney)" + ",\(SteppervalueSport)" + ",\(SteppervalueCreative)" + ",\(SteppervalueInstrument)" + ",\(SteppervalueHousWork)" + ",\(SteppervalueTen)" + ",\(SteppervalueNine)" + ",\(calculate());"
        default:
            print()
        }
    }
    
    //checks dates to compare results for run
    func dating() -> Int {
        var date = Date()
        let calendar = Calendar.current
        var dateComponen = calendar.dateComponents([.year, .month, .day], from: date)
        date = calendar.date(from: dateComponen)! // 2018-10-10

        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        day1S = String(day)+";"+String(month) + ";" + String(year)
        
        day1 = calendar.component(.day, from: date)
        dayRes = calculate()
        month1 = calendar.component(.month, from: date)
        
        if (day1S != day2S){
            let outputArray = day1S.split(separator: ";").map(String.init)

            dateComponen = DateComponents(calendar: calendar,
                                          year: Int(outputArray[2]),
                                                month: Int(outputArray[1]),
                                                day: Int(outputArray[0]))
            let date1 = calendar.date(from: dateComponen)! // 2018-10-10
            let diffs = Calendar.current.dateComponents([.day], from: date, to: date1)
            holder = (Int(diffs.day!))
                        
            if (dayRes >= SteppervalueGoal){
                endOfDay()
                run = run + 1
                if run > longRun{
                    longRun = run
                }
                
            }
            else{
                endOfDay()
                run = 0
            }
            if (holder > 1){
                for _ in 2...holder{
                    endOfDay()
                }

            }
 
 
        }
        /*
        if (day1 != day2){
            /*let distance: Int
            if (day2 > day1 ){
                distance = day2-day1
            }
            else{
                let monarr = [1,3,5,7,8,10,12]
                let monarr30 = [2,4,6,9,11]
                if (monarr.contains(month1)){
                    distance = day2 + (31-day1)
                }
                else if (monarr30.contains(month1)){
                    distance = day2 + (30-day1)
                }
                else{
                    distance = day2 + (28-day1)
                }
            }*/
            if (dayRes >= SteppervalueGoal){
                endOfDay()
                run = run + 1
                if run > longRun{
                    longRun = run
                }
                
            }
            else{
                endOfDay()
                run = 0
            }/*
            if (distance > 1){
                for _ in 2...distance{
                    endOfDay()
                }
            }*/
        }
        */
        if (month1 != month2){
            ArrayMonth += ";\(SteppervalueMonth)"
            month2 = month1
            SteppervalueMonth = defaultMonthValue
        }
        return run
    }
    
    //feedback of progress
    func reporting()-> String{
        let x = Int(Float(SteppervalueGoal)*Float(0.25))
        if calculate() == 0{
            return "Keep your progress on track!"
        }
        
        else if calculate()*2 >= SteppervalueGoal && (calculate() < (Int(SteppervalueGoal-x))) {
            return "Half reached! Go on!"
        }
        else if calculate() >= (SteppervalueGoal-x) && calculate() < SteppervalueGoal{
            return "Nearly done! Keep it up!"
        }
        
        else if calculate() >= SteppervalueGoal {
            return "Congratulations, you achieved your daily goal!"
            
        }
        else {
            return "Earn all points doday!"
        }
    }
    
    //retyrns the naming for the tasks
    func naming (name: String) -> String{
        if (name == ""){
            return "Empty"
        }
        else{
            return (name + " Points:")
        }
    }
    //percentage for bar
    func percent()->Float{
        let x = 1-(Float(SteppervalueGoal)-Float(calculate()))/Float(SteppervalueGoal)
        return Float(x)
    }
    
    var body: some View{
        NavigationView(){
            VStack() {
                HStack(){
                    Spacer()
                    Text("Progress")
                        .font(.largeTitle)
                        .foregroundColor(Color.orange)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                    
                    Text("Tracker")
                        .font(.largeTitle )
                        .fontWeight(.thin)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                    NavigationLink(
                        destination: Info(),
                        label: {
                            HStack {
                                Image(systemName: "info.circle")
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.orange)
                                
                            }
                        }
                        
                    )
                    Spacer()
                }
                ScrollView(){
                    
                    VStack(){
                        Text("Your Score: ")
                            .font(.title)
                            .fontWeight(.light)
                        
                        Text("\(calculate())")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(.top)
                        
                        Text("Run: \(dating()) Days")
                            .font(.title2)
                            .fontWeight(.thin)
                            .padding(.top)
                        Text("\(reporting())")
                            .fontWeight(.heavy)
                            .padding(.top)
                        ProgressView(value: percent())
                            .frame(height: 20.0)
                            .colorInvert()
                            .padding(.horizontal)
                            .padding(.top, -5.0)
                        
                    }
                    //Spacer()
                    
                    VStack(){
                        HStack(){
                            Spacer()
                            Button(action: reset) {
                                HStack {
                                    Text(" ")
                                    Image(systemName: "trash")
                                    Text(" ")
                                }
                                
                            }
                            .padding(.all, 4.0)
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                            .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                            
                        }
                        .padding(.trailing, 9.0)
                        
                        ScrollView(){
                            VStack(){
                                if (nameOne != ""){
                                    HStack(){
                                        Spacer()
                                        Stepper(value: $SteppervalueWork, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameOne)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueWork)")
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
                                        Stepper(value: $SteppervalueLearn, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameTwo)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueLearn)")
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
                                        Stepper(value: $SteppervalueHousWork, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameThree)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueHousWork)")
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
                                        Stepper(value: $SteppervalueCreative, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameFour)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueCreative)")
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
                                        Stepper(value: $SteppervalueRead, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameFive)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueRead)")
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
                                        Stepper(value: $SteppervalueInstrument, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameSix)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueInstrument)")
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
                                        Stepper(value: $SteppervalueSport, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameSeven)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueSport)")
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
                                        Stepper(value: $SteppervalueMoney, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameEight)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueMoney)")
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
                                        Stepper(value: $SteppervalueNine, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameNine)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueNine)")
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
                                        Stepper(value: $SteppervalueTen, in: 0...100) {
                                            HStack(){
                                                Text("\(naming(name: nameTen)) ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueTen)")
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
                                    Stepper(value: $SteppervalueGoal, in: minGoal...100) {
                                        HStack(){
                                            Text("Today's goal: ")
                                                .fontWeight(.light)
                                                .font(.title3)
                                            Spacer()
                                            Text("\(SteppervalueGoal)")
                                                .fontWeight(.light)
                                                .font(.title3)
                                                .padding(.trailing)
                                            
                                        }
                                        
                                    }
                                    Spacer()
                                }
                                
                                if (money){
                                    HStack(){
                                        Spacer()
                                        Stepper(value: $SteppervalueMonth, in: defaultMonthValue...10000000000, step: 10) {
                                            HStack(){
                                                Text("Moneysavings: ")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                Spacer()
                                                Text("\(SteppervalueMonth)")
                                                    .fontWeight(.light)
                                                    .font(.title3)
                                                    .padding(.trailing)
                                                
                                            }
                                            
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
                Spacer()
                HStack(){
                    NavigationLink(
                        destination: GraphsViewController(),
                        label: {
                            HStack {
                                Image(systemName: "chart.bar.xaxis")
                                Text("Graphs")
                                    .fontWeight(.medium)
                                
                            }
                        }
                    )
                    .foregroundColor(Color.white)
                    .padding(.all, 8.0)
                    .frame(width: 115)
                    .background(Color.gray)
                    .shadow(color: .white, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .statusBar(hidden: true)
                    
                    Spacer()
                    NavigationLink(
                        destination: Statistics(),
                        label: {
                            HStack {
                                Image(systemName: "list.bullet")
                                Text("Statistics")
                                    .fontWeight(.medium)
                                
                            }
                        }
                        
                    )
                    .foregroundColor(Color.white)
                    .padding(.all, 8.0)
                    .frame(width: 120)
                    .shadow(color: .white, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .statusBar(hidden: true)
                    
                    Spacer()
                    NavigationLink(
                        destination: SettingsUI(),
                        label: {
                            HStack {
                                Image(systemName: "gear")
                                Text("Settings")
                                    .fontWeight(.medium)
                                
                            }
                        }
                        
                    )
                    .foregroundColor(Color.white)
                    .padding(.all, 8.0)
                    .frame(width: 115)
                    .background(Color.gray)
                    .shadow(color: .white, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .statusBar(hidden: true)
                    
                    
                }
                .padding([.leading, .bottom, .trailing])
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

