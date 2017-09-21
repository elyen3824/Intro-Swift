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

print("Result from fib2 is \(fib2(n: 20)) in \(countFib2) calls")

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
