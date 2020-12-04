//
//  UserDefault.swift
//  
//
//  Created by sergey on 04.12.2020.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
  private let key: String
  private let defaultValue: T

  private let storage: UserDefaults

  public init(_ key: String,
       defaultValue: T,
       storage: UserDefaults = UserDefaults.standard) {
    self.key = key
    self.defaultValue = defaultValue
    self.storage = storage
  }

  public var wrappedValue: T {
    get {
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}
