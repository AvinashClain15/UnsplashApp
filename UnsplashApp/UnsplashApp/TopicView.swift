//
//  TopicView.swift
//  UnsplashApp
//
//  Created by Avinash CLAIN on 1/24/24.
//

import SwiftUI



struct TopicView: View {
    @State var imageList: [UnsplashPhoto] = []
    @StateObject var feedState = FeedState()
    var slug:String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    var body: some View {
        
        Button(action: {
            Task {
                await feedState.fetchHomeFeedTopicViews(slug: slug)
           
            }
        }, label: {
            Text("Load Data")
        })
        NavigationView{
            
            
            
            if let home = feedState.homeFeed{
                
                ScrollView {
                    // Votre grille d'image
                    
                    LazyVGrid(columns: columns, spacing: 8){
                        ForEach(home) { photo in
                            AsyncImage(url: URL(string:photo.urls.regular)!){
                                image in image.image?.resizable()
                                    .centerCropped()
                                    .cornerRadius(12)
                                
                            }.frame(height: 150)
                            
                        }
                    }
                }
                .navigationTitle("Feed")
            }else{
                NavigationView{
                    
                    ScrollView {
                        // Votre grille d'image
                        
                        LazyVGrid(columns: columns, spacing: 8){
                            ForEach(0..<12) { _ in
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(height: 150)
                                    .foregroundColor(Color.gray)
                            }
                        }
                        .padding(.horizontal)
                        .redacted(reason: .placeholder)
                    }
                    .navigationTitle("Feed")
                    
                }
                
            }
        }
    }
}
#Preview {
    TopicView(slug: "test")
}
