//
//  ViewController.swift
//  IosMemoApp
//
//  Created by 金城裕治 on 2017/06/17.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        // memoモデルinit
        let memo = Memo()
        
        // memoインスタンスにテキストを入れる
        memo.text = textField.text
        
        // APIを叩いてDBに保存
        StockMemos.postMemo(memo: memo)
        
        // textfieldから削除
        textField.text = ""
        
    }
    

}

