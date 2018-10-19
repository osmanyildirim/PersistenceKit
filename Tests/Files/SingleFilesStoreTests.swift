//
//  PersistenceKit
//
//  Copyright (c) 2018-Present Teknasyon Teknoloji.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import XCTest
@testable import PersistenceKit

final class SingleFilesStoreTests: XCTestCase {

	func testSaveObject() {
		let store = createFreshUsersStore()

		XCTAssertNoThrow(try store.save(TestUser.john))
		XCTAssertNotNil(store.object)
		XCTAssertEqual(store.object!, TestUser.john)
	}

	func testSaveInvalidObject() {
		let store = createFreshUsersStore()

		let user = TestUser(userId: 5, firstName: "firstName", lastName: "lastName", age: .nan)
		XCTAssertThrowsError(try store.save(user))
	}

	func testObject() {
		let store = createFreshUsersStore()

		XCTAssertNoThrow(try store.save(TestUser.johnson))
		XCTAssertNotNil(store.object)
	}

}

// MARK: - Helpers
private extension SingleFilesStoreTests {

	func createFreshUsersStore() -> SingleFilesStore<TestUser> {
		let store = SingleFilesStore<TestUser>(uniqueIdentifier: "single-user")
		XCTAssertNoThrow(try store.delete())
		return store
	}

}