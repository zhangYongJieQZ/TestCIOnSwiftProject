//
//  JsonHelper.swift
//  TestCICDOnSwift
//
//  Created by 张永杰 on 2021/2/20.
//

import Foundation

public let encoder: JSONEncoder = {
    let tempEncoder = JSONEncoder()
    return tempEncoder
} ()

public let decoder: JSONDecoder = {
    let tempDecoder = JSONDecoder()
    return tempDecoder
} ()

public class JsonHelper {
    public static func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        return try decoder.decode(type, from: data)
    }
    
    public static func decode<T>(_ type: T.Type, from string: String) throws -> T where T: Decodable {
        let data = string.data(using: .utf8)!
        return try decoder.decode(type, from: data)
    }
}


extension Encodable {
    public func data(using encoder: JSONEncoder = encoder) throws -> Data {
        return try encoder.encode(self)
    }
    public func string(using encoder: JSONEncoder = encoder) throws -> String {
        return try String(data: encoder.encode(self), encoding: .utf8)!
    }
    public func encode(using encoder: JSONEncoder = encoder) throws -> [String: Any] {
        let data = try encoder.encode(self)
        return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
    }
    
    
}
