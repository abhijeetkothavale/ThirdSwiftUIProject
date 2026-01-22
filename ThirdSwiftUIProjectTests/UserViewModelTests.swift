

@testable import ThirdSwiftUIProject
import XCTest

@MainActor
final class UserViewModelTests:XCTestCase{
    
    var viewModel: UserViewModel!
    var mockAPIService: MockAPIService!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        viewModel = UserViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    
    func test_fetchUsers_success() async{
        
        await viewModel.getUsers()
        
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users.first?.name, "Abhijeet")
        XCTAssertNil(viewModel.errorMessage)
        
    }
    
    func test_fetchUsers_failer() async{
        
        mockAPIService.shouldReturnError = true
        
        await viewModel.getUsers()
        
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertNotNil(viewModel.errorMessage)
    }
    
    
}
