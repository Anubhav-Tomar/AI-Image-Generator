//
//  OpenAIService.swift
//  AI Image Generator
//
//  Created by Anubhav Tomar on 08/12/24.
//

import Foundation
import Alamofire

class OpenAIService {
    private let endPointURL = "https://api.openai.com/v1/images/generations"
    
    func generateImage(prompt: String) async throws -> OpenAIImageResponse {
        let body = openaiImageRequestBody(prompt: prompt, size: "512x512")
        let headers: HTTPHeaders = ["Authorization": "Bearer \(Constants.openAPIKey)"]
        
        return try await AF.request(endPointURL,
                                    method: .post,
                                    parameters: body,
                                    encoder: .json,
                                    headers: headers).serializingDecodable(OpenAIImageResponse.self).value
    }
}

struct OpenAIImageResponse: Decodable {
    let data: [OpenAIImageURL]
}

struct OpenAIImageURL: Decodable {
    let url: String
}

struct openaiImageRequestBody: Encodable {
    let prompt: String
    let size: String
}
