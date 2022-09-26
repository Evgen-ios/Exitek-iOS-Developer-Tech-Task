import UIKit

// Implement mobile phone storage protocol
// Requirements:
// - Mobiles must be unique (IMEI is an unique number)
// - Mobiles must be stored in memory

protocol MobileStorage {
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

struct Mobile: Hashable {
    let imei: String
    let model: String
}

final class MobileStoragePhones: MobileStorage {
    
    // MARK: - Properties
    private var mobilePhones: [String: Mobile] = [:]
    
    // MARK: - Methods
    func getAll() -> Set<Mobile> {
        Set(mobilePhones.map { $0.value })
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        mobilePhones[imei]
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        if exists(mobile) {
            print("This imei:\(mobile.imei) already contained in base.")
            return mobile
        } else {
            mobilePhones[mobile.imei] = mobile
            return mobile
        }
    }
    
    func delete(_ product: Mobile) throws {
        if exists(product) {
            mobilePhones.removeValue(forKey: product.imei)
        } else {
            print("The product with imei:\(product.imei) is not contain in base.")
        }
    }
    
    func exists(_ product: Mobile) -> Bool {
        mobilePhones[product.imei] != nil
    }
    
    
}
