//
//  ASLEncryptorTests.swift
//  AppleSealTests
//
//  Created by Mark Mroz on 2020-03-22.
//  Copyright © 2020 Mark Mroz. All rights reserved.
//

import AppleSeal
import XCTest

class ASLEncryptorTests: XCTestCase {
    
    var encryptor: ASLEncryptor!
    
    override func setUp() {
        super.setUp()
        encryptor = createEncryptor()
    }
    
    override func tearDown() {
        encryptor = nil
    }
    
    func testEncryptWithPlainText() throws {
        let plainText = try ASLPlainText(coefficientCount: 2)
        XCTAssertNoThrow(try encryptor.encrypt(with: plainText, destination: ASLCipherText()))
    }
    
    func testEncryptWithPlainTextAndPool() throws {
        let plainText = try ASLPlainText(coefficientCount: 2)
        XCTAssertNoThrow(try encryptor.encrypt(with: plainText, destination: ASLCipherText(), pool: ASLMemoryPoolHandle.global()))
    }
    
    func testEncryptZeroWithCipherText() throws {
        let encryptedText = try ASLCipherText(context: ASLSealContext.bfvDefault())
        XCTAssertNoThrow(try encryptor.encryptZero(with: encryptedText))
    }
    
    func testEncryptZeroWithCipherTextAndPool() throws {
        let encryptedText = try ASLCipherText(context: ASLSealContext.bfvDefault())
        XCTAssertNoThrow(try encryptor.encryptZero(with: encryptedText, pool: ASLMemoryPoolHandle.global()))
    }
    
    func testEncryptZeroWithParametersId() throws {
        let encryptedText = try ASLCipherText(context: .bfvDefault())
        XCTAssertNoThrow(try encryptor.encryptZero(with: ASLParametersIdType(block: (40, 40, 40, 40)), cipherText: encryptedText))
    }
    
    func testEncryptZeroWithParametersIdWithPool() throws {
        let encryptedText = try ASLCipherText(context: ASLSealContext.bfvDefault())
        XCTAssertNoThrow(try encryptor.encryptZeroSymmetric(with: encryptedText, pool: .global()))
    }
    
    func testEncryptZeroSymmetricWithParametersId() throws {
        XCTAssertNoThrow(try encryptor.encryptZeroSymmetric(withPool: ASLParametersIdType(block: (4, 4, 4, 4)), destination: ASLCipherText(), pool: .global()))
    }
    
    func testSetPublicKey() {
        XCTAssertNoThrow(try encryptor.setPublicKey(ASLPublicKey()))
    }
    
    func testSetSecretKey() {
        XCTAssertNoThrow(try encryptor.setSecretKey(ASLSecretKey()))
    }
    
    private func createEncryptor() -> ASLEncryptor {
        let context = ASLSealContext.bfvDefault()
        let keygen = try! ASLKeyGenerator(context: context)
        let publicKey = keygen.publicKey
        return try! ASLEncryptor(context: context, publicKey: publicKey)
    }
}
