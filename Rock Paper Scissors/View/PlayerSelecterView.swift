//
//  PlayerSelecterView.swift
//  Rock Paper Scissors
//
//  Created by Thanh Tra Le on 04/12/2022.
//

import SwiftUI


struct PlayerSelecterView: View {
    @EnvironmentObject var vm:GameViewModel
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
//            Text("Please chosse")
//                .font(.headline)
//                .foregroundColor(.white)
            HStack(alignment: .center, spacing: 20.0) {
                
                Button {
                    vm.playerSelected = 0
                    vm.computerSelected = Int.random(in: 0...2)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        vm.playerChossed()
                    }
                    
                } label: {
                    VStack {
                        Image("rock")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 3)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        Text("Rock")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                
                Button {
                    vm.playerSelected = 1
                    vm.computerSelected = Int.random(in: 0...2)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        vm.playerChossed()
                    }
                } label: {
                    VStack {
                        Image("paper")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 3)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        Text("Paper")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                
                Button {
                    vm.playerSelected = 2
                    vm.computerSelected = Int.random(in: 0...2)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        vm.playerChossed()
                    }
                } label: {
                    VStack {
                        Image("scissors")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 3)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        Text("Scissors")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    
                }
                
            }
            .padding(.horizontal)
        }
    }
}


struct PlayerSelecterView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelecterView()
            .background(.orange)
    }
}
