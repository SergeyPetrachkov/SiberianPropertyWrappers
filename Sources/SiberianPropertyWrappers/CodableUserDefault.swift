//
//  CodableUserDefault.swift
//  
//
//  Created by sergey on 04.12.2020.
//

import Foundation

@propertyWrapper
public struct CodableUserDefault<T: Codable> {
  private let key: String
  private let defaultValue: T

  private let storage: UserDefaults

  private let encoder: JSONEncoder
  private let decoder: JSONDecoder

  public init(_ key: String,
       defaultValue: T,
       storage: UserDefaults = UserDefaults.standard,
       encoder: JSONEncoder = JSONEncoder(),
       decoder: JSONDecoder = JSONDecoder()) {
    self.key = key
    self.defaultValue = defaultValue
    self.storage = storage
    self.encoder = encoder
    self.decoder = decoder
  }

  public var wrappedValue: T {
    get {
      if let stored = self.storage.data(forKey: key) {
        let decoded = try? self.decoder.decode(T.self, from: stored)
        return decoded ?? defaultValue
      } else {
        return defaultValue
      }
    }
    set {
      let encodedData = try? self.encoder.encode(newValue)
      self.storage.set(encodedData, forKey: key)
    }
  }
}
