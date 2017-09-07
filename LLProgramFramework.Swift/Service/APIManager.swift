//
//  APIManager.swift
//  LLProgramFramework.Swift
//
//  Created by 奥卡姆 on 2017/9/7.
//  Copyright © 2017年 aokamu. All rights reserved.
//

import Foundation
import Moya

enum APIManager{
    
    case GetHomeList // 获取首页列表
    case GetHomeDetail // 获取详情页

}

extension APIManager: TargetType {
    /// The target's base `URL`.
    var baseURL: URL {
        return URL.init(string: "http://news-at.zhihu.com/api/")!
    }
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .GetHomeList:
            return "4/news/latest"
        case .GetHomeDetail://start-image 后为图像分辨率，接受任意的 number*number 格式， number 为任意非负整数，返回值均相同。
            return "4/start-image/1080*1776"
        }
    }
        
    /// The HTTP method used in the request.
    var method: Moya.Method {
        return .get
    }
    /// The parameters to be incoded in the request.
    var parameters: [String: Any]? {
        return nil
    }
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    /// Provides stub data for use in testing.
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    /// The type of HTTP task to be performed.
    var task: Task {
        return .request
    }
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }


}
