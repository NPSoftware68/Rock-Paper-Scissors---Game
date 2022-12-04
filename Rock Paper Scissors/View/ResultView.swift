//
//  ResultView.swift
//  Rock Paper Scissors
//
//  Created by Thanh Tra Le on 04/12/2022.
//

import SwiftUI


struct ResultView: View {
    @EnvironmentObject var vm:GameViewModel
    var body: some View {
        HStack {
            VStack {
                Image(vm.pleaseChosse ? "none" : vm.content[vm.computerSelected])
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 5)
                            .foregroundColor(.white.opacity(0.9))
                    }
                Text(vm.pleaseChosse ? "" : vm.content[vm.computerSelected])
                    .font(.headline)
                    .foregroundColor(.white)
            }
            Text("VS")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .italic()
                .fontWeight(.heavy)
            VStack {
                Image(vm.pleaseChosse ? "none" : vm.content[vm.playerSelected])
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 5)
                            .foregroundColor(.white.opacity(0.9))
                    }
                Text(vm.pleaseChosse ? "" : vm.content[vm.playerSelected])
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
        }
        .padding()
    }
}


struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(GameViewModel())
            .background(.orange)
    }
}
