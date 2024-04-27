//
//  OnBoardingViw.swift
//  SwiftUI-Practice
//
//  Created by Bora Yang on 9/2/24.
//

import SwiftUI

struct OnBoardingViw: View {

    var body: some View {
        NavigationView {
            VStack {
                launchString()
                launchImage()
                Spacer()
                startButton()
            }
        }
    }

    func launchString() -> some View {
        Image("launch", bundle: nil)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 60)
    }

    func launchImage() -> some View {
        Image("launchImage", bundle: nil)
    }

    func startButton() -> some View {
        NavigationLink {
            // Action
            ProfileSettingView()
        } label: {
            RoundedRectangle(cornerRadius: 25.0)
                .padding()
                .frame(height: 80)
                .foregroundColor(.blue)
                .overlay {
                    Text("시작하기")
                        .bold()
                        .foregroundStyle(.white)
                }
        }
    }

}

#Preview {
    OnBoardingViw()
}
