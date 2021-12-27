
import Foundation

struct Data: Decodable {
    var from: String?
    var goto: String?
    var time: String?
    var carImg: String?
    
    init(from: String, goto: String, time: String, carImg: String) {
        self.from = from
        self.goto = goto
        self.time = time
        self.carImg = carImg
    }
}
