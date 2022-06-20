//
//  Constants.swift
//  VIPER
//
//  Created by Pratik on 19/06/22.
//

import Foundation

let WSManager = WebServiceManager.shared

struct API
{
    static let getHeadlines = "https://newsapi.org/v1/articles?source=techcrunch&apiKey=17cf1b333e964cea91e89e1e824bd366"
}

struct Message
{
    static let activity = "Please wait..."
    static let noNewsDetail = "No News Details Found."
}
