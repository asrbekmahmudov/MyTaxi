//
//  DataTableViewCell.swift
//  MyTaxi
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 27/12/21.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    var overAll = UIView(frame: CGRect(x: 10, y: 20, width: UIScreen.width - 20, height: 150))
    var from = UILabel()
    var goto = UILabel()
    var time = UILabel()
    var image = UIImageView()
    var fromImg = UIImageView()
    var gotoImg = UIImageView()
    var bottomView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setup() {
        setBottomView()
        setFrom()
        setGoto()
        setTime()
        setCarImg()
        setFromImg()
        setGotoImg()
        setOverAll()
    }
    
    func setFrom() {
        from.frame.origin.x = 50
        from.frame.origin.y = 20
        from.frame.size.width = overAll.frame.size.width - 50
        from.frame.size.height = 17.5
        from.textColor = .black
    }
    
    func setGoto() {
        goto.frame.origin.x = 50
        goto.frame.origin.y = 50
        goto.frame.size.width = overAll.frame.size.width - 50
        goto.frame.size.height = 17.5
        goto.textColor = .black
    }
    
    func setTime() {
        time.frame.origin.x = 17.5
        time.frame.origin.y = 15
        time.frame.size.width = 150
        time.frame.size.height = 15
        time.textColor = .black
    }
    
    func setCarImg() {
        image.frame.origin.x = overAll.frame.size.width - 115
        image.frame.origin.y = overAll.frame.size.height - 70
        image.frame.size.width = 108
        image.frame.size.height = 39
    }
    
    func setFromImg() {
        gotoImg.frame.origin.x = 17.5
        gotoImg.frame.origin.y = 17.5
        gotoImg.frame.size.width = 25
        gotoImg.frame.size.height = 25
        gotoImg.image = UIImage(named: "gotoImg")
    }
    
    func setGotoImg() {
        fromImg.frame.origin.x = 17.5
        fromImg.frame.origin.y = 47.5
        fromImg.frame.size.width = 25
        fromImg.frame.size.height = 25
        fromImg.image = UIImage(named: "fromImg")
    }
    
    func setBottomView() {
        bottomView.frame.origin.x = 0
        bottomView.frame.origin.y = overAll.frame.size.height - 50
        bottomView.frame.size.width = overAll.frame.size.width
        bottomView.frame.size.height = 50
        bottomView.layer.cornerRadius = 20
        bottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        bottomView.backgroundColor = UIColor.systemGray6
    }
    
    func setOverAll() {
        overAll.layer.cornerRadius = 20
        overAll.layer.borderColor = UIColor.gray.cgColor
        overAll.layer.borderWidth = 0.2
        bottomView.addSubview(time)
        overAll.addSubview(from)
        overAll.addSubview(goto)
        overAll.addSubview(fromImg)
        overAll.addSubview(gotoImg)
        overAll.addSubview(bottomView)
        overAll.addSubview(image)
        addSubview(overAll)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
