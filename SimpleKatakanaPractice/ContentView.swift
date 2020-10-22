//
//  ContentView.swift
//  SimpleKatakanaPractice
//
//  Created by Joshua Zierman on 10/22/20.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var appData: AppData
    @State var inputText: String = ""
    
    let katakanaFont = Font.custom("KatakanaFont", size: 80)
    let inputFont = Font.custom("KatakanaFont", size: 30)
    
    var body: some View {
        VStack(alignment: .center) {
            Text(appData.currentKatakana.katakana)
                .font(katakanaFont)
                .padding()
            
            AutoFocusTextField(text: $inputText, isFirstResponder: true)
                .frame(width: 100, height: 30, alignment: .center)
                .border(Color.black, width: 1)
                .font(inputFont)
                .onChange(of: inputText, perform: { value in
                    if appData.currentKatakana.phonetic.contains(value.lowercased()) {
                        inputText.removeAll()
                        appData.nextKatakana()
                    }
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppData())
    }
}
