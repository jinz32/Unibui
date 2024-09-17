//
//  Service.swift
//  Unibui
//
//  Created by Jonathan Zheng on 9/13/24.
//
import Foundation

struct Job: Equatable, Hashable {
    var jobTitle: String
    var companyName: String
    var location: String
    var jobDescription: String
    var requirements: String
}
