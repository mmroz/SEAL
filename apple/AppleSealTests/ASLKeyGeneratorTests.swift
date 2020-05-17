//
//  ASLKeyGeneratorTests.swift
//  AppleSealTests
//
//  Created by Mark Mroz on 2020-03-28.
//  Copyright © 2020 Mark Mroz. All rights reserved.
//

import AppleSeal
import XCTest

class ASLKeyGeneratorTests: XCTestCase {
    
    var keyGenerator: ASLKeyGenerator! = nil
    
    override func setUp() {
        super.setUp()
        let context = ASLSealContext.bfvDefault()
        self.keyGenerator = try! ASLKeyGenerator(context: context)
    }
    
    override func tearDown() {
        super.tearDown()
        keyGenerator = nil
    }
    
    func testCreateWithSecretKey() throws {
        let context = ASLSealContext.bfvDefault()
        let keyGenerator = try! ASLKeyGenerator(context: context)
        let secretKey = keyGenerator.secretKey
        
        XCTAssertNoThrow(try ASLKeyGenerator(context: context, secretKey: secretKey))
    }
    
    func testPublicKey() throws {
        XCTAssertEqual(keyGenerator.publicKey, ASLPublicKey())
    }
    
    func testSecretKey() throws {
        XCTAssertEqual(keyGenerator.secretKey, ASLSecretKey())
    }
    
    func testRelinearizationKeysLocal() throws {
        XCTAssertEqual(try keyGenerator.relinearizationKeysLocal(), ASLRelinearizationKeys())
    }
    
    func testRelinearizationKeys() throws {
        // TODO - add
    }
    
    func testGaloisKeysLocalWithGaloisElements() throws {
        let result = try keyGenerator.galoisKeysLocal(withGaloisElements: [1,2])
        
        XCTAssertEqual(result, ASLGaloisKeys())
    }
    
    func testGaloisKeysWithGaloisElements() throws {
        // TODO - add
    }
    
    func testGaloisKeysLocalWithSteps() throws {
        let result = try keyGenerator.galoisKeysLocal(withSteps: [1,2])
        
        XCTAssertEqual(result, ASLGaloisKeys())
    }
    
    func testGaloisKeysWithSteps() throws {
        // TODO - add
    }
    
    func testGaloisKeys() throws {
        // TODO - add
    }
    
    func testGaloisKeysWithLocal() throws {
        let result = try keyGenerator.galoisKeysLocal()
        XCTAssertEqual(result, ASLGaloisKeys())
    }
}
