//
//  ContentView.swift
//  UnsplashApp
//
//  Created by Avinash CLAIN on 1/23/24.
//

import SwiftUI

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
        }
    }
}

struct UnsplashPhoto: Codable, Identifiable {
    let id: String
    let slug: String
    let author: User
    let url: UnsplashPhotoUrls
}

struct User: Codable {
    let name: String
}

struct UnsplashPhotoUrls: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

enum CodingKeys: String, CodingKey {
        case id
        case slug
        case author
        case imageURLs = "imageURLs"
    }


struct ContentView: View {
    
    
//    var body: some View {
//        
//        
//        let imageURLs: [String] = [
//            "https://images.unsplash.com/photo-1683009427666-340595e57e43?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MXwxfGFsbHwxfHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1563473213013-de2a0133c100?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHwyfHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1490349368154-73de9c9bc37c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHwzfHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1495379572396-5f27a279ee91?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw0fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1560850038-f95de6e715b3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw1fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1695653422715-991ec3a0db7a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MXwxfGFsbHw2fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1547327132-5d20850c62b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw3fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1492724724894-7464c27d0ceb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw4fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1475694867812-f82b8696d610?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHw5fHx8fHx8MXx8MTcwMzc1OTU1MXw&ixlib=rb-4.0.3&q=80&w=1080",
//            "https://images.unsplash.com/photo-1558816280-dee9521ff364?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1MzYyNDN8MHwxfGFsbHwxMHx8fHx8fDF8fDE3MDM3NTk1NTF8&ixlib=rb-4.0.3&q=80&w=1080"
//        ]
//        
////        VStack {
////            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1704256824249-093354974c62?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1NTc1NjF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MDYwMTQxMzN8&ixlib=rb-4.0.3&q=80&w=400")!)
////            { image in image.resizable()
////                
////            }placeholder: {
////                ProgressView()
////            }
////        }
////        
////        
////        .frame(width: 300, height: 300)
//        
//        NavigationStack {
//        
            let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                    
            ]
//            ScrollView{
//                LazyVGrid(columns: columns, spacing: 8){
//                    ForEach(imageURLs, id: \.self) { image in
//                        AsyncImage(url: URL(string:image)!){
//                            image in image.image?.resizable()
//                                .centerCropped()
//                                .cornerRadius(12)
//                            
//                        }.frame(height: 150)
//                    }
//                }
//            }.padding(.horizontal)
//                .navigationTitle("Fedd")
//    }
//        
// 
//}
    
    // Déclaration d'une variable d'état, une fois remplie, elle va modifier la vue
      @State var imageList: [UnsplashPhoto] = []
      
      // Déclaration d'une fonction asynchrone
      func loadData() async {
          // Créez une URL avec la clé d'API
          let url = URL(string: "https://api.unsplash.com/photos?client_id=\(ConfigurationManager.instance.plistDictionnary.clientId)")!

          do {
              // Créez une requête avec cette URL
              let request = URLRequest(url: url)
              
              // Faites l'appel réseau
              let (data, response) = try await URLSession.shared.data(for: request)
              
              // Transformez les données en JSON
              let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)

              // Mettez à jour l'état de la vue
              imageList = deserializedData

          } catch {
              print("Error: \(error)")
          }
      }

      // Créez cette nouvelle structure visuelle
      var body: some View {
          VStack {
              // le bouton va lancer l'appel réseau
              Button(action: {
                  Task {
                      await loadData()
                  }
              }, label: {
                  Text("Load Data")
              })
              ScrollView {
                  // Votre grille d'image
                  LazyVGrid(columns: columns, spacing: 8){
                      ForEach(imageList) { image in
                          AsyncImage(url: URL(string:image.url.small)!){
                                              image in image.image?.resizable()
                                                  .centerCropped()
                                                  .cornerRadius(12)
                  
                                          }.frame(height: 150)
                                      }
                                  }
                  
              }
          }
      }

               }
           
#Preview {
    ContentView()
}
