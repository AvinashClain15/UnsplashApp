//
//  UnsplashAPI.swift
//  UnsplashApp
//
//  Created by Avinash CLAIN on 1/24/24.
//

import Foundation
struct UnsplashAPI{
    private static var scheme = "https"
    private static var host = "api.unsplash.com"
    private static var client_id = ConfigurationManager.instance.plistDictionnary.clientId
    
    static func unsplashApiBaseUrl() -> URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.queryItems = [URLQueryItem(name: "client_id", value:client_id )]
        return components
    }
    
    
    static func feedUrl(orderBy: String = "popular", perPage: Int = 10) -> URL? {
        var components = unsplashApiBaseUrl()
        components.path = "/photos"
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "order_by", value: orderBy),
            URLQueryItem(name: "per_page", value: String(perPage))
        ])
        return components.url
    }
    
    static func feedUrlTopic(orderBy: String = "latest", perPage: Int = 3) -> URL? {
        var components = unsplashApiBaseUrl()
        components.path = "/topics"
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "order_by", value: orderBy),
            URLQueryItem(name: "per_page", value: String(perPage))
        ])
        return components.url
    }
    
    static func feedUrltopicViews(orderBy: String = "popular", perPage: Int = 10,slug: String) -> URL? {
        var components = unsplashApiBaseUrl()
   
        components.path = "/topics/\(slug)/photos"
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "order_by", value: orderBy),
            URLQueryItem(name: "per_page", value: String(perPage))
        ])
        return components.url
    }
}
