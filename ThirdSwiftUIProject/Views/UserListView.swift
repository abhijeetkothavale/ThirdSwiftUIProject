

import SwiftUI

struct UserListView: View {
    @ StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.users) { user in
                NavigationLink {
                    UserDetailView(
                        name: user.name,
                        email: user.email
                    )
                } label: {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)

                        Text(user.email)
                            .font(.subheadline)
                    }
                }
            }
                .navigationTitle("Users")
            }
            .task {
                await viewModel.getUsers()
            }
        }
    }

