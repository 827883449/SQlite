import UIKit

class chakan: UIViewController {
    
    var db:SQLiteDB!
    
    
    @IBOutlet weak var text3: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),dizhi varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    
    @IBAction func qingchu(sender: AnyObject) {text3.text=""
    }
    @IBAction func qingkongshujuku(sender: AnyObject) {
        let sql = "delete from tuser"
        let result = db.execute(sql)
        print(result)
        
    }
    //点击保存
    @IBAction func chakan(sender: AnyObject) {
        selete()
    }
    func selete(){
    let data = db.query("select * from user")
        for var x=0;x<data.count;x++
        {
        let user = data[x]
    
        text3.text! += "姓名"+String(user["uname"]!)+"电话"+String(user["mobile"]!)+"邮件"+String(user["email"]!)+"地址"+String(user["dizhi"]!)+"\n"
         }
    }
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}