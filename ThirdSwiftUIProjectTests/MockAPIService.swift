//
//  MockAPIService.swift
//  ThirdSwiftUIProjectTests
//
//  Created by Abhijeet Kothavale on 17/01/26.
//

@testable import ThirdSwiftUIProject
import Foundation

class MockAPIService: APIServiceProtocol{
    
    var shouldReturnError = false
    
    func fetchUsers() async throws -> [User] {
        if shouldReturnError{
            throw URLError(.badServerResponse)
        }
        return[
            User(id:1, name: "Abhijeet",email: "abhi@test.com"),
            User(id:2, name: "Swift",email: "swift@test.com")
            
        ]
    }
}
