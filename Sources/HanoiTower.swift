
class HanoiTower {
    var numberOfDisc = 3
    var towerA = Stack<Int>()
    var towerB = Stack<Int>()
    var towerC = Stack<Int>()

    init() {
        for i in 1...numberOfDisc {
            self.towerA.push(i)
        }   
    }
    
    public func hanoi(){
        hanoi(from: self.towerA, to: self.towerC, temp: self.towerB, n: self.numberOfDisc)
    }

    private func hanoi(from: Stack<Int>, to: Stack<Int>, temp: Stack<Int>, n: Int){
        if n == 1 {
            to.push(from.pop()) // move 1 disk
        }else{
            hanoi(from: from, to: temp, temp: to, n: n-1)
            hanoi(from: from, to: to, temp: temp, n: n)
            hanoi(from: temp, to: to, temp: from, n: n-1)
        }
    }
}


