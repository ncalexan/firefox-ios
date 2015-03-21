/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import Shared

public struct EngineMeta {
    let version: Int
    let syncID: String
    public static func mapFromJSON(map: [String: JSON]?) -> [String: EngineMeta]? {
        if map == nil {
            return nil
        }
        // TODO
        return [String: EngineMeta]()
    }
}

public struct Global {
    let syncID: String
    let storageVersion: Int
    let engines: [String: EngineMeta]?      // Is this really optional?
    let declined: [String]?

    // TODO: is it more useful to support partial globals?
    public static func fromJSON(json: JSON) -> Global? {
        if let syncID = json["syncID"].asString {
            if let storageVersion = json["storageVersion"].asInt {
                let engines = EngineMeta.mapFromJSON(json["engines"].asDictionary)
                let declined = json["declined"].asArray
                return Global(syncID: syncID,
                              storageVersion: storageVersion,
                              engines: engines,
                              declined: jsonsToStrings(declined))
            }
        }
        return nil
    }
}

/**
 * Encapsulates a meta/global, identity-derived keys, and keys.
 */
public class SyncMeta {
    let syncKey: KeyBundle

    var keys: Keys?
    var global: Global?

    public init(syncKey: KeyBundle) {
        self.syncKey = syncKey
    }
}
