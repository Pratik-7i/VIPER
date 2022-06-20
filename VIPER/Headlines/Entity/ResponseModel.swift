//
//  ResponseModel.swift
//  VIPER
//
//  Created by Pratik on 19/06/22.
//

import Foundation

struct ResponseModel: Codable
{
    let status   : String?
    let source   : String?
    let sortBy   : String?
    let articles : [HeadlinesModel]?
}
