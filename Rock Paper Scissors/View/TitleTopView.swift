//
//  TitleTopView.swift
//  Rock Paper Scissors
//
//  Created by Thanh Tra Le on 04/12/2022.
//

import SwiftUI

struct TitleTopView: View {
    @EnvironmentObject var vm:GameViewModel
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .center, spacing: 5) {
                Text("Computer")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("\(vm.computerScore)/10")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text("Player")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("\(vm.playerScore)/10")
                    .font(.title)
                    .fontWeight(.heavy)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.white)
    }
}


struct TitleTopView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTopView()
            .environmentObject(GameViewModel())
            .background(.orange)
    }
}
