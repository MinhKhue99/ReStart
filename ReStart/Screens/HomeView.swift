//
//  HomeView.swift
//  ReStart
//
//  Created by Phạm Minh Khuê on 04/08/2022.
//

import SwiftUI

struct HomeView: View {

    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {

            // MARK: - HEADER
            Spacer()
            ZStack {
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(Animation
                    .easeOut(duration: 4)
                    .repeatForever(),
                    value: isAnimating)



                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
            }

            // MARK: - CENTER
            Text("This time that leads to mastery s dependent on the intentity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            // MARK: - FOOTER
            Spacer()
            Button(action: {
                withAnimation {
                    playAudio(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .fontWeight(.bold)
                    .font(.system(.title3, design: .rounded))
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
