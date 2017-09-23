public class Fibonacci {
    var countFib2: UInt = 0
    var fib3Count: UInt = 0
    private var fibMemo: [UInt: UInt] = [0: 0, 1: 1]

    
    init() {
        initialize()
    }

    
    func initialize() {
        self.countFib2 = 0
        self.fib3Count = 0
        self.fibMemo = [0: 0, 1: 1]
    }
             

    func fib2(n:UInt) -> UInt {
        self.countFib2 += 1
        print("call fib2(\(String(n)))")
        if(n < 2){
            return n
        }

        print("call fib2(\(String(n - 1))) + fib2(\(String(n - 2)))")
        return fib2(n: n - 1) + fib2(n: n - 2)
    }

    func fib3(n: UInt) -> UInt{
        self.fib3Count += 1
        print("call fib3(\(String(n)))")
        if let result = self.fibMemo[n]{
            return result
        }
        else {
                print("call fib3(\(String(n - 1))) + fib3(\(String(n - 2)))")
            self.fibMemo[n]=fib3(n: n - 1) + fib3(n: n - 2)
        }
        
        return fibMemo[n]!
    }

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
}