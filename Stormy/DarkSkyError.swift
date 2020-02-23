//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Josh Gude on 2/20/20.
//  Copyright © 2020 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidUrl
}
