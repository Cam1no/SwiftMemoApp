//
//  StockMemos.swift
//  IosMemoApp
//
//  Created by 金城裕治 on 2017/06/17.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit
import Alamofire

class StockMemos: NSObject {
    
    // 保存ボタンが押されたときに呼ばれるメソッドを定義
    class func postMemo(memo: Memo) {
        
        // HTTP通信
        // これが参考になった http://komukomu.hatenablog.com/entry/2016/09/24/214445
        let url = URL(string: "http://localhost:3000/api/memos")
        let params: Parameters = [
            "text": memo.text as AnyObject
        ]
        
        Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if let jsonResult = response.result.value as? [String: Any] {
                    _ = jsonResult["results"] as! NSArray
                }
                break
            case .failure(_):
                print(response.result.error!)
                break
            }
        }
        
    }
}
