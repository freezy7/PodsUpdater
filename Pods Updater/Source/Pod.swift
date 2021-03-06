//
//  Pod.swift
//  Pods Updater
//
//  Created by Kizito Nwose on 30/01/2018.
//  Copyright © 2018 Kizito Nwose. All rights reserved.
//

import Foundation

struct ProgressResult<T> {
    var progress: Double = 0
    var result: T?
}

struct PodfileVersionCheckResult {
    var pods: [Pod]
    var hasPodWithUnsupportedFormat: Bool
}

struct PodFileCleanResult {
    var url: URL
    var oldContent: String
    var newContent: String
}

public struct Pod: Equatable {
    // Name of this Pod
    var name = ""
    // The line where this pod is declared
    var lineIndex = -1
    // Holds the line numbers for other declarations of this same pod on the Podfile
    var otherLineIndices = [Int]()
    // Current version of this pod
    var currentVersion = ""
    // Available versions of this pod to choose from
    var availableVersions = [String]()
    // If this is a subspec (e.g pod 'EVReflection/Alamofire')
    var isSubSpec: Bool {
        return name.contains("/")
    }
    // The name of the main Pod if this is a subspec (e.g pod 'EVReflection/Alamofire', specName = EVReflection)
    var specName: String {
        return isSubSpec ? name.components(separatedBy: "/").first! : name
    }
    
    var homepageUrl: URL?

    init(name: String, lineNumber: Int, currentVersion: String) {
        self.name = name
        self.lineIndex = lineNumber
        self.currentVersion = currentVersion
    }
    
    init() { }
}

public func ==(lhs: Pod, rhs: Pod) -> Bool {
    return lhs.name == rhs.name
}
