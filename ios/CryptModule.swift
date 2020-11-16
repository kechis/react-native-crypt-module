import CryptoSwift

@objc(CryptModule)
class CryptModule: NSObject {
    let key = "bbC2H19lkVbQDfakxcrtNMQdd0FloLyw" // length == 32
    let iv = "gqLOHUioQ0QjhuvI" // length == 16
    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }
    @objc(encrypt:withIV:withResolver:withRejecter:)
    func encrypt(a: String, iv: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        //let str = try! a.aesDecrypt(KEY: key, IV: iv)
        let str = aesEncrypt(value: a, key: key)
        resolve(str)
    }
    
    func aesEncrypt(value: String, key: String) -> String {
        let ivSlice = key.bytes[0..<16]
        let ivArray = Array(ivSlice)
        let data = Array(value.utf8)

        do {
            let encrypted = try AES(key: ivArray, blockMode: CBC(iv: ivArray), padding: .pkcs5).encrypt(data)
            let encryptedData = Data(encrypted)
            return encryptedData.base64EncodedString()
        } catch {
            return "error"
        }
    }
}


extension String {
    
    func aesEncrypt(KEY: String, IV: String) throws -> String {
        let encrypted = try AES(key: KEY, iv: IV, padding: .pkcs5).encrypt([UInt8](self.data(using: .utf8)!))
        return Data(encrypted).base64EncodedString()
    }

    func aesDecrypt(KEY: String, IV: String) throws -> String {
        guard let data = Data(base64Encoded: self) else { return "" }
        let decrypted = try AES(key: KEY, iv: IV, padding: .pkcs5).decrypt([UInt8](data))
        return String(bytes: decrypted, encoding: .utf8) ?? self
    }
}
