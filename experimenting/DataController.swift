import UIKit

class DataController: NSObject {
    class var sharedInstance: DataController{
        struct Static {
            static var instance: DataController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = DataController()
        }
        
        return Static.instance!
    }
    var subjectNumber: String = ""
}