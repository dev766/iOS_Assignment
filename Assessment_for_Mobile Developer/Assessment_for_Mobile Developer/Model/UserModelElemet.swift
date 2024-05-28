
import RealmSwift

class UniversityModel: Object, Decodable {
    @objc dynamic var name: String = ""
    @objc dynamic var stateProvince: String? = nil
    @objc dynamic var country: String = ""
    @objc dynamic var alphaTwoCode: String = ""
    let domains = List<String>()

    enum CodingKeys: String, CodingKey {
        case domains
        case name
        case stateProvince = "state-province"
        case country
        case alphaTwoCode = "alpha_two_code"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.stateProvince = try container.decodeIfPresent(String.self, forKey: .stateProvince)
        self.country = try container.decode(String.self, forKey: .country)
        self.alphaTwoCode = try container.decode(String.self, forKey: .alphaTwoCode)
        let domainsArray = try container.decode([String].self, forKey: .domains)
        self.domains.append(objectsIn: domainsArray)
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
