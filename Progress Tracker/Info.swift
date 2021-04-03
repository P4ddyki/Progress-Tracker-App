//
//  Info.swift
//  Progress Tracker
//
//  Created by Patrick Knab on 14.03.21.
//

import Foundation
import SwiftUI
//import CorePlot


struct Info: View {
    
    @State private var topExpanded: Bool = true
    @State private var topExpanded2: Bool = false
    @State private var topExpanded3: Bool = false
    @State private var topExpanded4: Bool = false
    @State private var topExpanded5: Bool = false
    @State private var topExpanded6: Bool = false
    @State private var topExpanded7: Bool = false

    
    init(){
        UINavigationBar.appearance().tintColor = .orange
        UISlider.appearance().minimumTrackTintColor = .orange
        UISlider.appearance().maximumTrackTintColor = UIColor.darkGray
        UINavigationBar.appearance().isTranslucent = false
        
    }
    
    var body: some View {
        
        
        NavigationView(){
            VStack{
                DisclosureGroup("Explanation:", isExpanded: $topExpanded) {
                    HStack(){
                        Text("This app intends to track your daily routine. Assign the tasks you encounter during the day. That will help you to increase your productivity.")
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                    }
                }
                .font(.title)
                .padding([.leading, .trailing])
                .padding(.top, 10.0)
                .accentColor(.orange)
                Divider()
                    .background(Color.orange)
                ScrollView(){
                    VStack{
                        DisclosureGroup("Task Assignment", isExpanded: $topExpanded2) {
                            HStack(){
                                Text("Each of us has individual tasks. To assign them, click on the Settings \(Image(systemName: "gear")) button. \nHere you can assign up to 10 tasks. Furthermore, if you want to track your monthly savings, activate it. Standard savings is meant for insurance or saving plans. With the setting minimum goal, set the number of minimum points you must accomplish each day.")
                                    .font(.body)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.light)
                                
                                
                                Spacer()
                            }
                        }
                        
                        .font(.title)
                        .padding([.leading, .trailing])
                        .padding(.top, 5.0)
                        .accentColor(.orange)
                        
                        Divider()
                            .background(Color.orange)
                        
                        DisclosureGroup("Statistics", isExpanded: $topExpanded3) {
                            HStack(){
                                Text("On the home screen, you can find the button \(Image(systemName: "list.bullet")) statistics. If you click on it, you will find different statistics about your predefined tasks.")
                                    .font(.body)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.light)
                                
                                
                                Spacer()
                            }
                        }
                        
                        .font(.title)
                        .padding(.horizontal)
                        .accentColor(.orange)
                        
                        Divider()
                            .background(Color.orange)
                        
                        DisclosureGroup("Change Entry", isExpanded: $topExpanded7) {
                            HStack(){
                                Text("To change an entry in the past, go to setting, scroll down and click on the \"Change Entries\" button.\nBy using the slider, you can pick your date where you want to change something. Click on the show-button to get the data of your given date. Now change the number of points and save it by pressing the save button.")
                                    .font(.body)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.light)
                                
                                
                                Spacer()
                            }
                        }
                        
                        .font(.title)
                        .padding(.horizontal)
                        .accentColor(.orange)
                        
                        Divider()
                            .background(Color.orange)
                    }
                    DisclosureGroup("Graphs", isExpanded: $topExpanded4) {
                        HStack(){
                            Text("Seeing your progress in a chart motivates and helps to analyze its progress. Click on the button \(Image(systemName: "chart.bar.xaxis")) to see the graphs. Here you can choose between different line charts. You can also change the amount of the shown days interactively. If there is nothing to see, your task hasn't any entries yet. Wait a day and you will see it. ")
                                .font(.body)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                                .fontWeight(.light)
                            
                            
                            Spacer()
                        }
                    }
                    
                    .font(.title)
                    .padding(.horizontal)
                    .accentColor(.orange)
                    
                    Divider()
                        .background(Color.orange)
                    
                    DisclosureGroup("Delete/Change Tasks", isExpanded: $topExpanded5) {
                        HStack(){
                            Text("In the settings view, you can see your defined tasks. If you want to change the name of a specific one, click on it and change it. Nothing will be deleted! \nBut if you want to delete a complete task with all its entries, click on the trash symbol on the right side of the assigned task you would like to delete. ")
                                .font(.body)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                                .fontWeight(.light)
                            
                            
                            Spacer()
                        }
                    }
                    
                    .font(.title)
                    .padding(.horizontal)
                    .accentColor(.orange)
                    
                    Divider()
                        .background(Color.orange)
                    
                    DisclosureGroup("Contact", isExpanded: $topExpanded6) {
                        HStack(){
                            Text("In any case, you would like to contact me for feedback or questions:\nTel: +49 1734814826\nE-Mail: knabp25@gmail.com")
                                .font(.body)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                                .fontWeight(.light)
                            
                            
                            Spacer()
                        }
                    }
                    
                    .font(.title)
                    .padding(.horizontal)
                    .accentColor(.orange)
                    
                    Divider()
                        .background(Color.orange)
                    Spacer()
                }
                .padding(.top, -5.0)
            }
            .statusBar(hidden: true)
            
        }
        .navigationBarTitle("FAQs")
        //.navigationBarTitleDisplayMode(.inline)
        
    }
    
}
