import CryptoSwift

@objc(CryptModule)
class CryptModule: NSObject {
    let key = "bbC2H19lkVbQDfakxcrtNMQdd0FloLyw" // length == 32
    let iv = "gqLOHUioQ0QjhuvI" // length == 16
    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }
    
    @objc(encrypt:withResolver:withRejecter:)
    func encrypt(a: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        //let str = try! aesEncrypt(key: key, iv: iv, message: a)
        let str = aesEncrypt_1(value: a, key: key)
        resolve(str)
    }
    
    func aesEncrypt_1(value: String, key: String) -> String {
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
    
    func aesEncrypt(key: String, iv: String, message: String) throws -> String{
        let data = message.data(using: .utf8)!
        // let enc = try AES(key: key, iv: iv, padding: .pkcs5).encrypt([UInt8](data))
        let enc = try AES(key: Array(key.utf8), blockMode: CBC(iv: Array(iv.utf8)), padding: .pkcs5).encrypt([UInt8](data))
        let encryptedData = Data(enc)
        return encryptedData.base64EncodedString()
    }

    func aesDecrypt(key: String, iv: String, message: String) throws -> String {
        let data = NSData(base64Encoded: message, options: NSData.Base64DecodingOptions(rawValue: 0))!
        let dec = try AES(key: key, iv: iv, padding: .pkcs5).decrypt([UInt8](data))
        let decryptedData = Data(dec)
        return String(bytes: decryptedData.bytes, encoding: .utf8) ?? "Could not decrypt"
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
