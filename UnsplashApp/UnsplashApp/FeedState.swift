//
//  FeedState.swift
//  UnsplashApp
//
//  Created by Avinash CLAIN on 1/24/24.
//

import Foundation
class FeedState : ObservableObject{
    @Published var homeFeed: [UnsplashPhoto]?
    @Published var homeFeedTopic: [Topic]?
    func fetchHomeFeed() async {
        let url = UnsplashAPI.feedUrl()
        
        do {
            // Créez une requête avec cette URL
            let request = URLRequest(url: url!)
            
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)

            // Mettez à jour l'état de la vue
            homeFeed = deserializedData
    

        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchHomeFeedTopic() async {
        let url = UnsplashAPI.feedUrlTopic()
        
        do {
            // Créez une requête avec cette URL
            let request = URLRequest(url: url!)
            
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode([Topic].self, from: data)

            // Mettez à jour l'état de la vue
            homeFeedTopic = deserializedData
    

        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchHomeFeedTopicViews(slug:String) async {
        let url = UnsplashAPI.feedUrltopicViews(slug: slug )
        
        do {
            // Créez une requête avec cette URL
            let request = URLRequest(url: url!)
            
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)

            // Mettez à jour l'état de la vue
            homeFeed = deserializedData
    

        } catch {
            print("Error: \(error)")
        }
    }
}
