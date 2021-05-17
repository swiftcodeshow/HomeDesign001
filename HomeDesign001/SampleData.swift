//
//  SampleData.swift
//  HomeDesign001
//
//  Created by 米国梁 on 2021/5/17.
//

import SwiftUI

struct Item: Hashable {
    var image: String
    var title: String
    var duration: String
}

var array = [
    Item(image: "image-1", title: "Raining Sidewalk", duration: "5 mins"),
    Item(image: "image-2", title: "Spring Morning", duration: "7 mins"),
    Item(image: "image-3", title: "First Girl", duration: "30 mins")
]
