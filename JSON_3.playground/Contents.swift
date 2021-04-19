import UIKit


struct PlacesResponse : Decodable {
    var places :[Place]
}

struct Place : Decodable {
    
    var name :String
    var latitude :Double
    var longitude :Double
}

//JSONを辞書型で書くとこうなる

let json = """

{
     "places":[
            {
                "name" : "Costa Rica",
                "latitude" : 34.56,
                "longitude" : 65.67
            },
            {
                "name" : "Boston",
                "latitude" : 134.56,
                "longitude" : 265.67
            }
            ]
}


""".data(using: .utf8)!

let placesResponse = try! JSONDecoder().decode(PlacesResponse.self, from: json)
print(placesResponse.places)

//リファクタ前
//let placesDictionary = try! JSONDecoder().decode([String:[Place]].self, from: json)
//let places = placesDictionary["places"]
//print(places)


print("----------------")

struct customer2Response: Codable {
    var customers: [customer2]
}

struct customer2: Codable {
    var firstName: String
    var lastName: String
    var address: Address
    var dateCreated: Date
    
    //CodingKeys
//    private enum CodingKeys: String, CodingKey {
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case address
//        case dateCreated = "date_created"
//    }
}

struct Address: Codable {
    var street: String
    var city: String
    var state: String
    var geo: Geo
    var addressType: AddressType
}

enum AddressType : String, Codable {
    case apartment = "apartment"
    case house = "house"
    case condo = "condo"
    case townHouse = "townHouse"
}

struct Geo: Codable {
    var latitude: CGFloat
    var longitude: CGFloat
}

let json2 = """
{
    "customers":[
        {
            "first_name" : "John",
            "last_name" : "Doe",
            "date_created" : "1996-12-19T16:39:57-08:00",
            "address" : {
                "street" : "1200 Richmond Ave",
                "city" : "Houston",
                "state" : "TX",
                "geo" : {
                    "latitude" : 34.56,
                    "longitude" : 35.65
                },
                "addressType" : "condo"
            }
        }
    
    ]

}
""".data(using: .utf8)!

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601 //TIME系の設定で必要
decoder.keyDecodingStrategy = .convertFromSnakeCase //スネークケースに合わせる(超便利)
let customer2Responder = try! decoder.decode(customer2Response.self, from: json2)
print("😆", customer2Responder)

