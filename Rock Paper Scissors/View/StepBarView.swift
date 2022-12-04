//
//  CustomView.swift
//  Rock Paper Scissors
//
//  Created by Thanh Tra Le on 04/12/2022.
//

import SwiftUI

struct StepBarView: View {
    @EnvironmentObject var vm:GameViewModel
    var body: some View {
        GeometryReader { geometry in
            // TODO: - there might be a need for horizontal and vertical alignments
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.white.opacity(0.4))
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width * CGFloat(self.vm.playTime / 10))
            }
            .cornerRadius(5)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    withAnimation(.spring()) {
                        // TODO: - maybe use other logic here
                        self.vm.playTime = min(max(0, Float(value.location.x / geometry.size.width * 10)), 10)
                    }
                }))
        }
    }
}

struct StepBarView_Previews: PreviewProvider {
    static var previews: some View {
        StepBarView()
            .environmentObject(GameViewModel())
            .frame(height: 8)
            .padding()
            .background(.orange)
    }
}
