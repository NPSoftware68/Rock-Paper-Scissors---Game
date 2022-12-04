//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Thanh Tra Le on 04/12/2022.
//

import SwiftUI

struct GameHomeView: View {
    @EnvironmentObject var vm: GameViewModel
    var body: some View {
        ZStack {
            //MARK: Background
            Color.orange
                .ignoresSafeArea()
            VStack {
                //MARK: Game Title
                TitleTopView()
                    .padding()
                //MARK: Game result
                Spacer()
                Spacer()
                ResultView()
                    .shadow(radius: 8)
                Spacer()
                Spacer()
                VStack {
                    Text("Status")
                        .font(.body)
                        .foregroundColor(.white.opacity(0.95))
                        .shadow(radius: 5)
                    StepBarView()
                        .frame(height: 7)
                        .padding(.horizontal)
                    .padding(.bottom)
                }
                //MARK: Player Selecter
                PlayerSelecterView()
                    .shadow(radius: 5)
                Spacer()
            }
        }
        .alert(vm.alertTitle, isPresented: $vm.showAlert) {
            Button("Continue") {
                vm.showAlert = false
                vm.winChecker()
                vm.resetResuil()
                if vm.playTime == 10 {
                    vm.resetResuil()
                }
            }
        } message: {
            Text(vm.alertMessage)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameHomeView()
            .environmentObject(GameViewModel())
    }
}

