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

var fib = Fibonacci()
print("Result from fib2 is \(fib.fib2(n: 10)) in \(fib.countFib2) calls")
fib.initialize()
print("Result from fib3 \(fib.fib3(n: 10)) in \(fib.fib3Count) calls")
fib.initialize()
print("Result from fib3 \(fib.fib3(n: 20)) in \(fib.fib3Count) calls")
fib.initialize()
print("Result from fib4 \(fib.fib4(n: 20))")

var result = CompressedGene(original: "ATGAATGCC")
print(result.showCompressed())
print(result.decompress())

/*var encryptor = OneTimePadEncryptor()
var key = encryptor.encrypt()
print(key)
var encrypted = encryptor.encrypt(original: "hello")
print(encrypted)
var decrypted: String? = encryptor.decrypt(otpKeyPair: encrypted)
print(decrypted ?? "")*/

var pi = Pi()
print(pi.calculatePi(nTerms: 1000))

var hanoi = HanoiTower()
hanoi.hanoi()
print(hanoi.towerA)
print(hanoi.towerB)
print(hanoi.towerC)