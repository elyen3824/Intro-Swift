import Foundation
import CoreFoundation

public struct CompressedGene {
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