import UIKit

class delete: UIViewController {
    
    var db:SQLiteDB!
    

    @IBOutlet weak var htext1: UITextField!
    
    @IBOutlet weak var htext2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),dizhi varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    
    //点击保存
    
    @IBAction func deletemobile(sender: AnyObject) {
        let value=htext1.text!
        let sql = "delete from user where mobile='\(value)'"
        let result = db.execute(sql)
        print(result)
    }
    
    @IBAction func deletename(sender: AnyObject) {
        let value=htext1.text!
        let sql = "delete from user where uname='\(value)'"
        let result = db.execute(sql)
        print(result)
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}