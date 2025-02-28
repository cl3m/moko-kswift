/*
 * Copyright 2021 IceRock MAG Inc. Use of this source code is governed by the Apache 2.0 license.
 */

import XCTest
@testable import MultiPlatformLibrary
@testable import MultiPlatformLibrarySwift

// ===> NEED TO GENERATE
extension TestStateSource {
    var loadingKs: UIStateKs<NSString> {
        get {
            return UIStateKs<NSString>(self.loading)
        }
    }
    var emptyKs: UIStateKs<NSString> {
        get {
            return UIStateKs<NSString>(self.empty)
        }
    }
    var errorKs: UIStateKs<NSString> {
        get {
            return UIStateKs<NSString>(self.error)
        }
    }
    var dataKs: UIStateKs<NSString> {
        get {
            return UIStateKs<NSString>(self.data)
        }
    }
}
// <=== NEED TO GENERATE

class SealedToSwiftEnumTests: XCTestCase {
    private let testSource = TestStateSource()
    
    func testLoadingState() throws {
        if case .loading = testSource.loadingKs { } else { XCTFail() }
    }
    
    func testEmptyState() throws {
        if case .empty = testSource.emptyKs { } else { XCTFail() }
    }
    
    func testDataState() throws {
        if case .data(let data) = testSource.dataKs {
            XCTAssertEqual(data.value, "test")
        } else { XCTFail() }
    }
    
    func testErrorState() throws {
        if case .error(let error) = testSource.errorKs {
            XCTAssertTrue(error.throwable is KotlinIllegalStateException)
        } else { XCTFail() }
    }
}
