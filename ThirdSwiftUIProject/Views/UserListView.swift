//
//  UserListView.swift
//  ThirdSwiftUIProject
//
//  Created by Abhijeet Kothavale on 17/01/26.
//

import SwiftUI

struct UserListView: View {
    @ StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.users){ User in
                VStack(alignment: .leading){
                    Text(User.name)
                        .font(.headline)
                    Text(User.email)
                        .font(.subheadline)
                }
            }
                .navigationTitle("Users")
            }
            .task {
                await viewModel.getUsers()
            }
        }
    }

