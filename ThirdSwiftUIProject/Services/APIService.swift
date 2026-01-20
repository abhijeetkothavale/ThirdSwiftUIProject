//
//  API Service.swift
//  ThirdSwiftUIProject
//
//  Created by Abhijeet Kothavale on 17/01/26.
//

import Foundation

protocol APIServiceProtocol{
    
    func fetchUsers() async throws -> [User]
}

class APIService :APIServiceProtocol{
    
    func fetchUsers() async throws -> [User] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([User].self,from: data)
    }
}
