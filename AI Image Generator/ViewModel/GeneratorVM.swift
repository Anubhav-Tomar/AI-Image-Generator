//
//  GeneratorVM.swift
//  AI Image Generator
//
//  Created by Anubhav Tomar on 08/12/24.
//

import Foundation

extension GeneratorView {
    class ViewModel: ObservableObject {
        @Published var duration = 0
        @Published var image: URL?
        
        let prompt: String
        let selectedStyle: ImageStyle
        
        private let openAIService = OpenAIService()
        
        init(prompt: String, selectedStyle: ImageStyle) {
            self.prompt = prompt
            self.selectedStyle = selectedStyle
        }
        
        func generateImage() {
            let formattedPrompt = "\(selectedStyle.title) image of \(prompt)"
            
            Task {
                do {
                    let generatedImage = try await openAIService.generateImage(prompt: formattedPrompt)
                    guard let imageURLString = generatedImage.data.first?.url, let imageURL = URL(string: imageURLString) else {
                        print("ERROR: Couldn't generate image")
                        return
                    }
                    
                    await MainActor.run {
                         self.image = imageURL
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
