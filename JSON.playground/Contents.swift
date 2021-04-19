import UIKit

/*
 シリアライズ...インスタンスをバイト列に変換すること
 
 */

struct Customer {
    var firstName: String
    var lastName: String
    var age: Int
    
    /*extensionでinitを実装することで可能にする
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
     */
}

extension Customer {
    init?(dictionay: [String: Any]) {
        guard let firstName = dictionay["firstName"] as? String,
              let lastName = dictionay["lastName"] as? String,
              let age = dictionay["age"] as? Int else {
            return nil
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

/// """は複数のリテラルを示すのに適している
///jsonはデータ型
let json = """
[
    {
        "firstName" : "Fuchi" ,
        "lastName" : "Kazuma",
        "age" : 22
    },
    {
        "firstName" : "Hara" ,
        "lastName" : "Ayano",
        "age" : 24
    },
    {
        "firstName" : "simosimo" ,
        "lastName" : "kazu",
        "age" : 60
    }
]
""".data(using: .utf8)! //String型をData型にキャストしている

/*
 utf8 は文字コードの1つ
 文字コードとは
 */

if let dictionay = try! JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [[String: Any]] {
        
    print("💡", dictionay)
            
    //型 は [Customer] になる
    let customers = dictionay.compactMap {
        return Customer(dictionay: $0)
    }

    print("😆",customers)
}
