
import XCTest
@testable import ThirdSwiftUIProject

final class APIServiceTests: XCTestCase {

    func test_fetchUsers_success() async throws {

        let mockClient = MockHTTPClient()
        mockClient.data = """
        [
          {
            "id": 1,
            "name": "Abhijeet",
            "email": "abhi@test.com"
          }
        ]
        """.data(using: .utf8)

        let service = APIService(client: mockClient)
        let users = try await service.fetchUsers()

        XCTAssertEqual(users.count, 1)
        XCTAssertEqual(users.first?.name, "Abhijeet")
    }
    
    

    func test_fetchUsers_failure() async {

        let mockClient = MockHTTPClient()
        mockClient.error = URLError(.badServerResponse)

        let service = APIService(client: mockClient)

        do {
            _ = try await service.fetchUsers()
            XCTFail("Expected error")
        } catch {
            XCTAssertTrue(true)
        }
    }
}
