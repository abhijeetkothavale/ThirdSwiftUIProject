

import SwiftUI

struct UserDetailView: View {

    let name: String
    let email: String

    var body: some View {
        VStack(spacing: 20) {

            Text(name)
                .font(.title)
                .fontWeight(.bold)

            Text(email)
                .font(.subheadline)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
    }
}
