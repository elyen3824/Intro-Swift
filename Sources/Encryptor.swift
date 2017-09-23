import Foundation
import CoreFoundation

public class OneTimePadEncryptor {
    typealias OTPKey = [UInt8]
    typealias OTPKeyPair = (dummyKey1: OTPKey, encryptedKey2: OTPKey) 

   private func randomOTPKeyGenerator(length: Int) -> OTPKey {
        var randomKey: OTPKey = OTPKey()
        srand(UInt32(UInt8.max))
        for _ in 0..<length {
            let randomKeyPoint = random()
            randomKey.append(UInt8(randomKeyPoint))
        }    
        return randomKey
    }
   
    func encrypt() -> OTPKey{
        return randomOTPKeyGenerator(length: 10)
    }
    
   /* func encrypt(original: String) -> OTPKeyPair {
        let dummy = randomOTPKeyGenerator(length: original.utf8.count) 
        let encrypted: OTPKey = dummy.enumerated().map{i, e in return e ^ original.utf8[original.utf8.index(original.utf8.startIndex, offsetBy: i)]}
        return(dummy, encrypted)
    }

    
    func decrypt(otpKeyPair: OTPKeyPair) -> String? {
        let decrypted: OTPKey = otpKeyPair.dummyKey1.enumerated().map{i, e in 
            e ^ otpKeyPair.encryptedKey2[i]
        }
        return String(bytes: decrypted, encoding: String.Encoding.utf8)
    }*/
}
