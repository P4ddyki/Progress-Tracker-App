//
//  SettingsUI.swift
//  Progress Tracker
//
//  Created by Patrick Knab on 15.01.21.
//

import SwiftUI

struct SettingsUI: View {
    
    @AppStorage ("day1") var day1 = 0
    @AppStorage ("day2") var day2 = 0
    @AppStorage ("run") var run = 0
    @AppStorage ("highRun") var highRun = 0
    @AppStorage ("dayRes") var dayRes = 0
    @AppStorage ("allPoints") var allPoints = 0
    @AppStorage ("longRun") var longRun = 0
    
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
    
    @AppStorage ("minGoal") var minGoal = 0
    
    @AppStorage ("SteppervalueWork") var SteppervalueWork = 0
    @AppStorage ("SteppervalueLearn") var SteppervalueLearn = 0
    @AppStorage ("SteppervalueRead") var SteppervalueRead = 0
    @AppStorage ("SteppervalueHousWork") var SteppervalueHousWork = 0
    @AppStorage ("SteppervalueMoney") var SteppervalueMoney = 0
    @AppStorage ("SteppervalueSport") var SteppervalueSport = 0
    @AppStorage ("SteppervalueCreative") var SteppervalueCreative = 0
    @AppStorage ("SteppervalueGoal") var SteppervalueGoal = 15
    @AppStorage ("SteppervalueInstrument") var SteppervalueInstrument = 0
    @AppStorage ("SteppervalueNine") var SteppervalueNine = 0
    @AppStorage ("SteppervalueTen") var SteppervalueTen = 0
    
    @AppStorage ("WorkArray") var WorkArray = "0"
    @AppStorage ("WorkRead") var WorkRead = "0"
    @AppStorage ("WorkGoal") var WorkGoal = "0"
    @AppStorage ("WorkLearn") var WorkLearn = "0"
    @AppStorage ("WorkMoney") var WorkMoney = "0"
    @AppStorage ("WorkSport") var WorkSport = "0"
    @AppStorage ("WorkCreative") var WorkCreative = "0"
    @AppStorage ("WorkInstrument") var WorkInstrument = "0"
    @AppStorage ("WorkHouse") var WorkHouse = "0"
    @AppStorage ("ArrayNine") var ArrayNine = "0"
    @AppStorage ("ArrayTen") var ArrayTen = "0"
    
    @AppStorage ("AmountDays") var AmountDays: Double = 31
    @AppStorage ("defaultMonthValue") var defaultMonthValue = 0
    @AppStorage ("money") var money: Bool = false
    
    @State private var topExpandedHere: Bool = false
    @State private var topExpanded2: Bool = true
    
    init(){
        UINavigationBar.appearance().tintColor = .orange
        UINavigationBar.appearance().isTranslucent = false
        UITextField.appearance().tintColor = .orange
    }
    
    var body: some View {
        
        NavigationView(){
            VStack{
                HStack{
                    Text("Task Assignment:")
                        .font(.title)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading, .trailing])
                    Spacer()
                }
                ScrollView{
                    VStack{
                        VStack{
                            HStack{
                                Text("1.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 30)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameOne)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    WorkArray = "0"
                                    SteppervalueWork = 0
                                    nameOne = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            HStack{
                                Text("2.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 30)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameTwo)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    WorkLearn = "0"
                                    SteppervalueLearn = 0
                                    nameTwo = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            HStack{
                                Text("3.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 30)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameThree)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    WorkHouse = "0"
                                    SteppervalueHousWork = 0
                                    nameThree = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            HStack{
                                Text("4.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 30)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameFour)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    WorkCreative = "0"
                                    SteppervalueCreative = 0
                                    nameFour = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            HStack{
                                Text("5.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 30)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameFive)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    WorkRead = "0"
                                    SteppervalueRead = 0
                                    nameFive = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            HStack{
                                Text("6.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 30)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameSix)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    WorkInstrument = "0"
                                    SteppervalueInstrument = 0
                                    nameSix = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            HStack{
                                Text("7.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 30)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameSeven)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    WorkSport = "0"
                                    SteppervalueSport = 0
                                    nameSeven = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            HStack{
                                Text("8.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 30)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameEight)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    WorkMoney = "0"
                                    SteppervalueMoney = 0
                                    nameEight = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            HStack{
                                Text("9.")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 30)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading)
                                Text("Task:")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .frame(width: 50)
                                TextField("Type in your Task", text: $nameNine)
                                    .padding(.leading)
                                    .font(.title2)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button(action: {
                                    ArrayNine = "0"
                                    SteppervalueNine = 0
                                    nameNine = ""
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .padding(.vertical, 5.0)
                                .padding(.horizontal, 10.0)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            }
                            VStack{
                                HStack{
                                    Text("10.")
                                        .font(.title2)
                                        .fontWeight(.light)
                                        .multilineTextAlignment(.trailing)
                                        .frame(width: 30)
                                        .padding(.leading)
                                    Text("Task:")
                                        .font(.title2)
                                        .fontWeight(.light)
                                        .frame(width: 50)
                                    
                                    TextField("Type in your Task", text: $nameTen)
                                        .padding(.leading)
                                        .font(.title2)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                    Button(action: {
                                        ArrayTen = "0"
                                        SteppervalueTen = 0
                                        nameTen = ""
                                    }, label: {
                                        Image(systemName: "trash")
                                    })
                                    .padding(.vertical, 5.0)
                                    .padding(.horizontal, 10.0)
                                    .foregroundColor(Color.white)
                                    .background(Color.red)
                                    .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                    .padding(.trailing)
                                }
                            }
                        }
                        VStack(){
                            HStack{
                                Text("Further Settings:")
                                    .font(.title)
                                    .fontWeight(.light)
                                    .multilineTextAlignment(.leading)
                                    .padding([.top, .leading, .trailing])
                                Spacer()
                            }
                            HStack(){
                                Spacer()
                                Stepper(value: $minGoal, in: 0...100) {
                                    HStack(){
                                        Text("Minimum Goal: ")
                                            .fontWeight(.light)
                                            .font(.title2)
                                            .padding(.leading)
                                        Spacer()
                                        Text("\(minGoal)")
                                            .fontWeight(.light)
                                            .font(.title2)
                                            .padding(.trailing)
                                        
                                    }
                                }
                                Spacer()
                            }
                            
                            HStack(){
                                Spacer()
                                Stepper(value: $defaultMonthValue, in: 0...10000000000, step: 10) {
                                    HStack(){
                                        Text("Standard Savings: ")
                                            .fontWeight(.light)
                                            .font(.title2)
                                            .padding(.leading)
                                        Spacer()
                                        Text("\(defaultMonthValue)")
                                            .fontWeight(.light)
                                            .font(.title2)
                                            .padding(.trailing)
                                        
                                    }
                                }
                                Spacer()
                            }
                            HStack(){
                                Spacer()
                                Toggle(isOn: $money) {
                                    Text("Enable Money Tracker:")
                                        .fontWeight(.light)
                                        .font(.title2)
                                        .padding(.leading)
                                }
                                .padding(.trailing, 3.0)
                                .toggleStyle(SwitchToggleStyle(tint: Color.orange))
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                NavigationLink(
                                    destination: ChangeEntries(),
                                    label: {
                                        HStack {
                                            Text("Change Entries")
                                                .fontWeight(.medium)
                                            
                                        }
                                    }
                                )
                                .foregroundColor(Color.white)
                                .padding(.all, 8.0)
                                .frame(width: 130)
                                .background(Color.gray)
                                .shadow(color: .white, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                                //.navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true)
                                //.statusBar(hidden: true)
                                Spacer()
                                
                            }
                            HStack{
                                Spacer()
                                Text("Created by Patrick Knab")
                                    .font(.caption)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.orange)
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Settings")
            
        }
        //.navigationBarTitleDisplayMode(.inline)
    }
    
}

