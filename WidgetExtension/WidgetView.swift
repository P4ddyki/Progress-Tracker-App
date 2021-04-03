//
//  WidgetView.swift
//  Progress Tracker
//
//  Created by Patrick Knab on 21.02.21.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {

    //@AppStorage ("dataView", store: UserDefaults(suiteName: "group.com.suiteName")) var dataView = "0"
    func getNumber ()-> String{
        let returnS = UserDefaults.standard.object(forKey:"Number") as? String ?? String()
        return returnS
    }
  var body: some View {
    ZStack {
        Color(UIColor.orange)
      VStack {
        HStack {
            Text("Progress Tracker")
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(.white)
                .padding([.top, .leading])
            
            Spacer()
        }
        HStack {
            Text("Click to open App")
                .font(.title2)
                .fontWeight(.thin)
                .foregroundColor(.white)
                .padding([.top, .leading])
            
            Spacer()
        }
        Spacer()
      }
    }
  }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView()
    }
}
