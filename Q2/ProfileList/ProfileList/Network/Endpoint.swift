//
//  Endpoint.swift
//  ProfileList
//
//  Created by Sayyid Maulana Khakul Yakin on 24/03/21.
//

import Moya

enum ProfileBase {
    case profile
}

extension ProfileBase: TargetType {
    var baseURL: URL {
        return URL(string: "https://gist.github.com")!
    }
    
    var path: String {
        switch self {
        case .profile:
            return "/dhamanutd/6993984928506eea49908c2e3fcbc628"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .profile:
            return "".utf8Encoded
        default:
            Data()
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
            return [
                "Content-Type" : "application/json"
            ]
        }
    
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
