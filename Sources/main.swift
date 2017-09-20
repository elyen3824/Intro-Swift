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


func fib2(n:UInt) -> UInt {
    println("call fib2(\(String(n))")
    if(n < 2){
        return n
    }

    println("call fib2(\(String(n - 1)) + fib2(\(String(n - 2)))")
    return fib2(n: n - 1) + (n: n - 2)
}

println(fib2(10))
