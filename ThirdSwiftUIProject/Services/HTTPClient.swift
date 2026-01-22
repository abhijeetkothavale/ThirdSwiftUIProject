

import Foundation

protocol HTTPClient {
    func data(from url: URL) async throws ->Data
}
