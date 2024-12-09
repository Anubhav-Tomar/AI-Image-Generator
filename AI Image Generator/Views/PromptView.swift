//
//  ContentView.swift
//  AI Image Generator
//
//  Created by Anubhav Tomar on 08/12/24.
//

import SwiftUI

struct PromptView: View {
    
    @State var selectedStyle = ImageStyle.allCases[0]
    @State var promptText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Generate")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                Text("Choose a style")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                GeometryReader { reader in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(ImageStyle.allCases, id: \.self) { imageStyle in
                                Button {
                                    selectedStyle = imageStyle
                                } label: {
                                    Image(imageStyle.rawValue)
                                        .resizable()
                                    //                                    .background(Color.blue)
                                        .scaledToFill()
                                        .frame(width: reader.size.width * 0.4,
                                               height: reader.size.width * 0.4 * 1.4)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 20).stroke(Color.green, lineWidth: imageStyle == selectedStyle ? 4 : 0)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                
                Text("Enter a prompt...")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                TextEditor(text: $promptText)
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .foregroundStyle(.white)
                    .tint(Color.green)
                
                VStack(alignment: .center) {
                    NavigationLink {
                        GeneratorView(viewModel: .init(prompt: promptText,
                                                       selectedStyle: selectedStyle))
                    } label: {
                        Text("Generate")
                            .foregroundStyle(.black)
                            .padding()
                            .background(Color.green)
                            .clipShape(Capsule())
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .background(Color.black.ignoresSafeArea())
        }
    }
}

#Preview {
    PromptView()
}
