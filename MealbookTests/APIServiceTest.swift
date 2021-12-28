//
//  APIServiceTest.swift
//  MealbookTests
//
//  Created by Chris Park on 12/7/21.
//

import XCTest
@testable import Mealbook

class APIServiceTest: XCTestCase {

    func testFetchDataSuccess() {
        let expectation = expectation(description: "Fetched data successfully")
        let apiService = APIService()
        Task {
            do {
                let _: Categories = try await apiService.fetchData(for: .category, with: "")
                expectation.fulfill()
            } catch {
                XCTFail("Failed to fetch data")
            }
        }
        
        self.waitForExpectations(timeout: 3)
    }
    
    func testFetchDataFailure() {
        let expectation = expectation(description: "Fetched data successfully")
        let apiService = APIService()
        Task {
            do {
                let _: Categories = try await apiService.fetchData(for: .category, with: "corrupted")
                XCTFail("Failed to fetch data")
            } catch {
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 3)
    }
}
