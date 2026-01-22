

import Foundation

protocol APIServiceProtocol{
    
    func fetchUsers() async throws -> [User]
}

final class APIService :APIServiceProtocol{
    
    private let client: HTTPClient
    
    init(client: HTTPClient = URLSessionHTTPClient()) {
        self.client = client
    }
    
    func fetchUsers() async throws -> [User] {
        let url = URL(string: APIConstants.users)!
        let data = try await client.data(from: url)
        return try JSONDecoder().decode([User].self,from: data)
    }
}
