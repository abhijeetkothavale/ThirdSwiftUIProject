
import Foundation
@testable import ThirdSwiftUIProject

final class MockHTTPClient: HTTPClient{
    
    var data: Data?
    var error: Error?
    
    func data(from url: URL) async throws -> Data {
        if let error = error{
            throw error
        }
        return data ?? Data()
    }
}
