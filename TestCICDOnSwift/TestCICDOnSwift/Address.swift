//
//  Address.swift
//  TestCICDOnSwift
//
//  Created by 张永杰 on 2021/2/20.
//

import Foundation

public class Address: Codable {
    public var street: String?
    public var city: String?
    public var state: String?
    public var country: String?
    public var zip: String?
    
    public init(){
    }
    
    public init(street: String?, city: String?, state: String?, country: String?, zip: String?) {
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.zip = zip
    }
    
    enum CodingKeys: String, CodingKey {
        case Address
        case City
        case State
        case Country
        case ZipCode
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(street, forKey: .Address)
        try container.encode(city, forKey: .City)
        try container.encode(state, forKey: .State)
        try container.encode(country, forKey: .Country)
        try container.encode(zip, forKey: .ZipCode)

    }
    
    required public convenience init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let street = try? values.decode(String.self, forKey: .Address)
        let city = try? values.decode(String.self, forKey: .City)
        let state = try? values.decode(String.self, forKey: .State)
        let country = try? values.decode(String.self, forKey: .Country)
        let zip = try? values.decode(String.self, forKey: .ZipCode)
        
        self.init(street: street, city: city, state: state, country: country, zip: zip)
    }
    
}
