import Foundation
import CoreFoundation

print("Hello World!")

var myVariable = 42

myVariable = 56

let myConstant = 42

let implicitInteger = 70

let implicitDouble = 70.0

let explicitDouble: Double = 70 

let explicitFloat : Float = 4

let label = "The width is "

let width = 94

let widthLabel = label + String(width)

print(widthLabel)

var countFib2 = 0
func fib2(n:UInt) -> UInt {
    countFib2 += 1
    print("call fib2(\(String(n)))")
    if(n < 2){
        return n
    }

    print("call fib2(\(String(n - 1))) + fib2(\(String(n - 2)))")
    return fib2(n: n - 1) + fib2(n: n - 2)
}

print("Result from fib2 is \(fib2(n: 10)) in \(countFib2) calls")

var fib3Count = 0
var fibMemo: [UInt: UInt] = [0: 0, 1: 1]
func fib3(n: UInt) -> UInt{
    fib3Count += 1
    print("call fib3(\(String(n)))")
    if let result = fibMemo[n]{
        return result
    }
    else {
            print("call fib3(\(String(n - 1))) + fib3(\(String(n - 2)))")
        fibMemo[n]=fib3(n: n - 1) + fib3(n: n - 2)
    }
    
    return fibMemo[n]!
}

print("Result from fib3 \(fib3(n: 10)) in \(fib3Count) calls")
print("Result from fib3 \(fib3(n: 20)) in \(fib3Count) calls")


func fib4(n: UInt) -> UInt {
    if(n == 0){
        return n
    }

    var last: UInt = 0, next: UInt = 1 // base case fib(0) and fib(1)

    for _ in 1..<n {
        (last , next) = (next , last + next)
    }

    return next
}

print("Result from fib4 \(fib4(n: 20))")


struct CompressedGene {
    let length: Int
    private let bitVector: CFMutableBitVector

    
    init(original: String) {
        length = original.characters.count
        // default allocator, need 2 * length number of bits
        bitVector = CFBitVectorCreateMutable(kCFAllocatorDefault, length * 2)
        CFBitVectorSetAllBits(bitVector, 0) // fills the bit vector with 0s

        compress(gene: original)
    }

    private func compress(gene: String){
        for (index, nucleotide) in gene.uppercased().characters.enumerated() {
            let nStart = index * 2 // start of each new nucleotide
            switch nucleotide {
            case "A": // 00
                CFBitVectorSetBitAtIndex(bitVector, nStart, 0)
                CFBitVectorSetBitAtIndex(bitVector, nStart + 1, 0)
            case "C": // 01
                CFBitVectorSetBitAtIndex(bitVector, nStart, 0)
                CFBitVectorSetBitAtIndex(bitVector, nStart + 1, 1)
            case "G": // 10
                CFBitVectorSetBitAtIndex(bitVector, nStart, 1)
                CFBitVectorSetBitAtIndex(bitVector, nStart + 1, 0)
            case "T": // 11
                CFBitVectorSetBitAtIndex(bitVector, nStart, 1)
                CFBitVectorSetBitAtIndex(bitVector, nStart + 1, 1)                
            default:
                print("Unexpected character \(nucleotide) at \(index)")
            }
        }
    }

    func showCompressed(){
        var compressedValue: String = ""
        for bitIndex in 0..<length {
            let nStart = bitIndex * 2 // start of eah nucleotide
            let firstBit = CFBitVectorGetBitAtIndex(bitVector, nStart)
            let secondBit = CFBitVectorGetBitAtIndex(bitVector, nStart + 1)
            compressedValue += String(firstBit)
            compressedValue += String(secondBit)
        }
        print("the compressed value is: \(compressedValue)")
    }
    
    func decompress() -> String {
        var gene: String = ""
        for index in 0..<length {
            let nStart = index * 2 // start of eah nucleotide
            let firstBit = CFBitVectorGetBitAtIndex(bitVector, nStart)
            let secondBit = CFBitVectorGetBitAtIndex(bitVector, nStart + 1)
            switch (firstBit, secondBit) {
            case (0, 0): // 00 A
                gene += "A"
            case (0, 1): // 01 C
                gene += "C"
            case (1, 0): // 10 G
                gene += "G"
            case (1, 1):
                gene += "T"
            default:
                break // should never it that case
            }
        }
        return gene        
    }    
}


var result = CompressedGene(original: "ATGAATGCC")
print(result.showCompressed())
print(result.decompress())

class OneTimePadEncryptor {
    typealias OTPKey = [UInt8]
    typealias OTPKeyPair = (key1: OTPKey, key2: OTPKey)
   
    private func randomOTPKeyGenerator(length: Int) -> OTPKey {
        var randomKey: OTPKey = OTPKey()
        srand(UInt32(UInt8.max))
        for _ in 0..<length {
            let randomKeyPoint = UInt8(random())
            randomKey.append(randomKeyPoint)
        }    
        return randomKey
    }

    
    func encrypt(original: String) -> OTPKeyPair {
        let dummy = randomOTPKeyGenerator(length: original.utf8.count) 
        let encrypted: OTPKey = dummy.enumerated().map{i, e in return e ^ original.utf8[original.utf8.index(original.utf8.startIndex, offsetBy: i)]}
        return(dummy, encrypted)
    }
    
}


var encrypted = OneTimePadEncryptor()
print(encrypted.encrypt(original: "hello"))