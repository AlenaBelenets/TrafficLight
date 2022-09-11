//
//  ColorCircleView.swift
//  TrafficLight
//
//  Created by Alena Belenets on 11.09.2022.
//

import SwiftUI

struct ColorCircleView: View {
    let opacity: Double
    let color: Color

    var body: some View {
        Circle()
            .frame(width: 200, height: 150)
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }

}


struct ColorCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(opacity: 1, color: .red)
    }
}
