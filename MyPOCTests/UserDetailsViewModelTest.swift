//
//  UserDetailsViewModelTest.swift
//  WelcomePOCTests
//
//  Created by B, Aswathi on 21/09/22.
//

import XCTest
@testable import WelcomePOC

final class UserDetailsViewModelTest: XCTestCase {
    var viewModel = UserDetailsViewModel(userDetailsProvider: MockUserDetailsDataProvider())
    
    func testGetUserDetails_success() {
        (viewModel.userDetailsProvider as? MockUserDetailsDataProvider)?.result = .success
        viewModel.getUserDetails { isSuccess in
            XCTAssertTrue(isSuccess)
            XCTAssertNotNil(self.viewModel.userDetails)
        }
    }
    
    func testGetUserDetails_failure() {
        (viewModel.userDetailsProvider as? MockUserDetailsDataProvider)?.result = .failure
        viewModel.getUserDetails { isSuccess in
            XCTAssertFalse(isSuccess)
            XCTAssertNotNil(self.viewModel.userDetails)
        }
    }
    
}
