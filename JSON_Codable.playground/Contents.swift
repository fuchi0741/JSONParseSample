import UIKit

//Decode(JSONをデータにマッピングする)
struct Customer: Codable {
    var firstName: String
    var lastName: String
    var age: Int
}

let json = """
{
    "firstName" : "Fuchi" ,
    "lastName" : "Kazuma",
    "age" : 22
}

""".data(using: .utf8)!

let customer = try! JSONDecoder().decode(Customer.self, from: json)
print(customer)
print(Customer.self)

//Encode(データをJSON化する)
let custom = Customer(firstName: "Hara", lastName: "Ayano", age: 24)

let encode = try! JSONEncoder().encode(custom)
print(encode) //データ型をプリントで出してもバイト数が出力されるだけ
print(String(data: encode, encoding: .utf8))//データ型の中身が知りたかったら、String型にキャストをする
