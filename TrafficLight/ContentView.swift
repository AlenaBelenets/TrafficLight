//
//  ContentView.swift
//  TrafficLight
//
//  Created by Alena Belenets on 09.09.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {

    @State private var buttonTitle = "START"

    @State private var redLightState = 0.3
    @State private var yellowLightState = 0.3
    @State private var greenLightState = 0.3

    @State private var currentLight = CurrentLight.red

    private func nextColor() {
        let lightIsOn = 1.0
        let lightIsOff = 0.3

        switch currentLight {
        case .red:
            currentLight = .yellow
            greenLightState = lightIsOff
             redLightState = lightIsOn
        case .yellow:
            currentLight = .green
            redLightState = lightIsOff
            yellowLightState = lightIsOn
        case .green:
            currentLight = .red
            yellowLightState = lightIsOff
            greenLightState = lightIsOn
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()

            VStack(spacing: 20) {
                ColorCircleView(opacity: redLightState, color: .red)
                ColorCircleView(opacity: yellowLightState, color: .yellow)
                ColorCircleView(opacity: greenLightState, color: .green)

                Spacer()

                StartButtonView(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    nextColor()
                }
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
