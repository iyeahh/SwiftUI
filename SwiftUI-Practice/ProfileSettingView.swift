//
//  ProfileSettingView.swift
//  SwiftUI-Practice
//
//  Created by Bora Yang on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {

    @State private var text = ""
    @State private var isPresented = false

    var body: some View {
        VStack {
            topBar()
            iconImageView()
            textField()
            textFieldBarView()
            mbtiText()
            infp()
            Spacer()
            completeButton()
                .fullScreenCover(isPresented: $isPresented, content: {
                    LoginView()
                })
                .navigationTitle("PROFILE SETTING")
                .navigationBarTitleDisplayMode(.inline)
        }
    }


    func completeButton() -> some View {
        Button {
            // Action
            isPresented.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 25.0)
                .padding()
                .frame(height: 80)
                .foregroundColor(.gray)
                .overlay {
                    Text("완료")
                        .bold()
                        .foregroundStyle(.white)
                }
        }
    }

    func infp() -> some View {
        HStack(spacing: 10) {
            mbtiButton("I")
            mbtiButton("N")
            mbtiButton("F")
            mbtiButton("P")
        } //:HSTACK
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 30)
        .padding(.top, 20)
    }

    func estj() -> some View {
        HStack(spacing: 10) {
            mbtiButton("E")
            mbtiButton("S")
            mbtiButton("T")
            mbtiButton("J")
        } //:HSTACK
        .padding(.trailing, 30)
        .padding(.top, 20)
    }

    func mbtiText() -> some View {
        Text("MBTI")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            .overlay(alignment: .trailing, content: {
                estj()
            })
    }

    func textFieldBarView() -> some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color(uiColor: .lightGray))
            .padding(.horizontal, 30)
            .padding(.bottom, 50)

    }

    func textField() -> some View {
        TextField
            .init("닉네임을 입력해주세요:)", text: $text)
            .padding(.horizontal, 30)

    }

    func iconImageView() -> some View {
        NavigationLink {
            ChooseIconView()
        } label: {
            Image("profile_11", bundle: nil)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color(.blue), lineWidth: 3))
                .padding(.vertical, 30)
        }
    }

    func topBar() -> some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color(uiColor: .lightGray))
    }

    func mbtiButton(_ type: String) -> some View {
        Button {
            // Action

        } label: {
            Text(type)
                .foregroundStyle(.gray)
                .padding()
                .overlay(
                    Circle()
                        .stroke(Color(.gray), lineWidth: 1))
        }
    }
}

#Preview {
    ProfileSettingView()
}
