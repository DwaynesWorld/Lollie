//
//  ContentView.swift
//  Lollie
//
//  Created by Kyle Thompson on 8/21/20.
//  
//

import SwiftUI
import PartialSheet

struct ContentView: View {
  @State private var date: Date = Date()
  @EnvironmentObject var partialSheet : PartialSheetManager
  
  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        Spacer()
        Button(action: {
          self.partialSheet.showPartialSheet({
            print("dismissed")
          }) {
            VStack {
              Text("Settings Panel").font(.headline)
              DatePicker("Date", selection: $date)
                .frame(height: 50)
            }
            .padding()
            .frame(height: 270)
          }
        }, label: {
          Text("Show Partial Sheet")
        })
        Spacer()
      }
      .navigationBarTitle("Partial Sheet")
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .addPartialSheet()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
