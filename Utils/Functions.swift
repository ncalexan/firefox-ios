/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

/**
 * Return members of `a` that aren't nil, changing the type of the sequence accordingly.
 */
public func optFilter<T>(a: [T?]) -> [T] {
    return a.filter { $0 != nil }.map { $0! }
}

/**
 * Take a JSON array, returning the String elements as an array.
 * It's usually convenient for this to accept an optional.
 */
public func jsonsToStrings(arr: [JSON]?) -> [String]? {
    if arr == nil {
        return nil
    }
    return optFilter(arr!.map {
        j in
        return j.asString
    })
}