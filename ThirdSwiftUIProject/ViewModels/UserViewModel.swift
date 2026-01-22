

import Foundation

@MainActor
class UserViewModel:ObservableObject{
    
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiService:APIServiceProtocol
    
    init(apiService:APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func getUsers() async {
        isLoading = true
        errorMessage = nil
        
        do{
            users = try await apiService.fetchUsers()
        }catch{
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
}
