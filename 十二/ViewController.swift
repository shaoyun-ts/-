//
//  ViewController.swift
//  十二
//
//  Created by 邵云 on 16/3/24.
//  Copyright © 2016年 邵云. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nameinput: UITextField!
    @IBOutlet weak var idinput: UITextField!
    @IBOutlet weak var messgeout: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        idinput.delegate = self
        nameinput.delegate = self
    }
    @IBAction func chaxuntapd(sender: AnyObject) {
        var years = idinput.text!
        if years.characters.count == 18 {
        //提取身份证信息
        func nyr(身份证信息:String) ->(String,String,String,String,String,String) {
//            身份证信息.characters.count    //计算字符串长度
            let 性别范围 = Range(身份证信息.startIndex.advancedBy(16)..<身份证信息.endIndex.advancedBy(-1))
            let 性别 = 身份证信息.substringWithRange(性别范围)
            //    Int(性别)
            let 地区 = 身份证信息.substringToIndex(身份证信息.endIndex.advancedBy(-12))
            //    Int(地区)
            let 出生日期范围 = Range(身份证信息.endIndex.advancedBy(-12)..<身份证信息.startIndex.advancedBy(14))
            let 出生日期 = 身份证信息.substringWithRange(出生日期范围)
            //    let 年范围 = Range(start:出生日期.startIndex.advancedBy(0),end: 出生日期.endIndex.advancedBy(-4))
            let 年 = 出生日期.substringWithRange(Range(出生日期.startIndex.advancedBy(0)..<出生日期.endIndex.advancedBy(-4)))
            let 月 = 出生日期.substringWithRange(Range(出生日期.startIndex.advancedBy(4)..<出生日期.endIndex.advancedBy(-2)))
            let 日 = 出生日期.substringWithRange(Range(出生日期.startIndex.advancedBy(6)..<出生日期.endIndex.advancedBy(0)))
//            Int(年)
//            Int(月)
//            Int(日)
//            let rq = "出生日期:" + (年) + "年" + (月) + "月" + (日) + "日"
//            print(rq)
            let datefor = NSDateFormatter()
            datefor.dateFormat = "yyyy"                //设置日期格式
            //    let 出生年 = datefor.dateFromString(年)!  //身份证中的年份字符型转换为NSData类型
            let now = NSDate()                        //获取当前日期
            let nowStr = datefor.stringFromDate(now)  //转换当前日期为字符型
            let nowStrInt = Int(nowStr)               //将字符型年转换为整数型
            let 年龄 = String((nowStrInt! - (Int(年))!) + 1)   //计算年龄
//            print(年龄)
            return (地区,年,月,日,性别,年龄)
        }
        var sex = ""
//        nyr(years).0
//        nyr(years).1
//        nyr(years).2
//        nyr(years).3
//        nyr(years).5
            if ((Int(nyr(years).4)! % 2) == 1) {
                 sex = "男"
            }
            else{
                 sex = "女"
            }
        //提取结束
        
        //生肖计算开始
        func shengxiao(year:Int) ->Int{
            let offset = 4 % 12
            return (year - offset) % 12
        }
        let 生肖 = shengxiao(Int(nyr(years).1)!)
        var zodiac = ""
        switch 生肖{
        case 0 :
            zodiac = "鼠"
        case 1 :
            zodiac = "牛"
        case 2 :
            zodiac = "虎"
        case 3 :
            zodiac = "兔"
        case 4 :
            zodiac = "龙"
        case 5 :
            zodiac = "蛇"
        case 6 :
            zodiac = "马"
        case 7 :
            zodiac = "羊"
        case 8 :
            zodiac = "猴"
        case 9 :
            zodiac = "鸡"
        case 10 :
            zodiac = "狗"
        case 11 :
            zodiac = "猪"
        default:
            zodiac = "未输入信息"
        }
        //生肖计算完毕
            messgeout.text = ("姓名：\(nameinput.text!)" + "\n" + "地区：\(nyr(years).0)" + "\n" + "出生日期：\(nyr(years).1)" + "年\(nyr(years).2)" + "月\(nyr(years).3)" + "日" + "\n" + "性别：\(sex)" + "\n" + "年龄：\(nyr(years).5)" + "\n" + "生肖：\(zodiac)" + "\n")
        }
        else{
            messgeout.text = "输入的信息有误，无法进行查询！"
        }
        nameinput.resignFirstResponder()
        idinput.resignFirstResponder()
    }
       override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        nameinput.resignFirstResponder()
        idinput.resignFirstResponder()
    }
    @IBAction func resettapd(sender: AnyObject) {
        nameinput.resignFirstResponder()
        idinput.resignFirstResponder()
        nameinput.text = ""
        idinput.text = ""
        messgeout.text = "请在输入姓名和身份证号码后查询！"
    }
}

