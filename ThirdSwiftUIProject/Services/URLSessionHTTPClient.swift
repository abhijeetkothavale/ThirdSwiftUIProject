

import Foundation

final class URLSessionHTTPClient: HTTPClient{
    
    func data(from url: URL) async throws -> Data{
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
}
