//
//  CommentViewController.swift
//  Instagram
//
//  Created by 宮崎　幹太郎 on 2021/10/22.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
   
    var postData: PostData!
    @IBOutlet weak var commentTextField: UITextField!
    
    
    @IBAction func hadleSaveButton(_ sender: Any) {
        
        SVProgressHUD.show()
        
        let name = Auth.auth().currentUser?.displayName
        
        let addComment = name! + ":" +  commentTextField.text!
        let updateValue: FieldValue
        updateValue = FieldValue.arrayUnion([addComment])
        // コメントの保存場所指定
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comments": updateValue])
            
        SVProgressHUD.showSuccess(withStatus: "コメントを追加しました")
        // comment処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        // ホーム画面に戻る
        self.dismiss(animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
