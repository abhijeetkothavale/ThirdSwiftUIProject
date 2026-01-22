
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
