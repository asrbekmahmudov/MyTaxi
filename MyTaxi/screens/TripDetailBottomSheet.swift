
import UIKit

class TripDetailBottomSheet: UIViewController {
    
    var aboutCarView = UIView()
    var locationView = UIView()
    var driverView = UIView()
    var allDatasView = UIView()
    var accountMoneyView = UIView()
    var moneyView = UIView()
    var originY = CGFloat()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        car()
        location()
        driver()
        allData()
        accountMoney()
        money()
    }
    
    func car() {
        let uiview = UIView(frame: CGRect(x: UIScreen.width/2-25, y: 10, width: 50, height: 8))
        uiview.backgroundColor = .systemGray5
        uiview.layer.cornerRadius = 4
        view.addSubview(uiview)
        
        aboutCarView.frame.origin.x = 0
        aboutCarView.frame.origin.y = 10
        aboutCarView.frame.size.width = UIScreen.width
        aboutCarView.frame.size.height = 60
        originY = aboutCarView.frame.origin.y + aboutCarView.frame.size.height
        
        let number = UILabel(frame: CGRect(x: 20, y: 20, width: aboutCarView.frame.size.width/3, height: 30))
        number.text = "25 | L 771 FA"
        number.layer.cornerRadius = 5
        number.layer.borderColor = UIColor.systemGray.cgColor
        number.layer.borderWidth = 0.1
        number.font = .systemFont(ofSize: 20, weight: .medium)
        number.textAlignment = .center
        
        let car = UIImageView(frame: CGRect(x: aboutCarView.frame.size.width - 115, y: 25, width: 104, height: 38))
        car.image = UIImage(named: "car3")
        
        let name = UILabel(frame: CGRect(x: 20, y: 60, width: aboutCarView.frame.size.width/2, height: 20))
        name.text = "Чёрный Chevrolet Malibu"
        name.font = .systemFont(ofSize: 15)
        name.textColor = .systemGray
        
        let line = UIView(frame: CGRect(x: 20, y: originY + 20, width: UIScreen.width-40, height: 1))
        line.backgroundColor = .systemGray5
        
        originY += 20
        aboutCarView.addSubview(name)
        aboutCarView.addSubview(car)
        aboutCarView.addSubview(number)
        aboutCarView.addSubview(line)
        view.addSubview(aboutCarView)
    }
    
    func location() {
        locationView.frame.origin.x = 0
        locationView.frame.origin.y = originY
        locationView.frame.size.width = UIScreen.width
        locationView.frame.size.height = 120
        originY += locationView.frame.size.height
        
        let fromImg = UIImageView(frame: CGRect(x: 25, y: 25, width: 25, height: 25))
        fromImg.image = UIImage(named: "fromImg")
        
        let gotoImg = UIImageView(frame: CGRect(x: 25, y: 50, width: 25, height: 25))
        gotoImg.image = UIImage(named: "gotoImg")
        
        let from = UILabel(frame: CGRect(x: 60, y: 25, width: UIScreen.width*4/5, height: 20))
        from.text = "улица Sharof Rashidov, Ташкент"
        from.font = .systemFont(ofSize: 15, weight: .medium)
        from.textColor = .black
        
        let goto = UILabel(frame: CGRect(x: 60, y: 50, width: UIScreen.width*4/5, height: 22.5))
        goto.text = "5a улица Асадуллы Ходжаева"
        goto.font = .systemFont(ofSize: 15, weight: .medium)
        goto.textColor = .black
        
        let uiview1 = UIView(frame: CGRect(x: 20, y: 100, width: UIScreen.width/3.5, height: 56))
        uiview1.backgroundColor = .systemYellow.withAlphaComponent(0.2)
        uiview1.layer.cornerRadius = 10
        
        let supportImg = UIImageView(frame: CGRect(x: UIScreen.width/7-10, y: 8, width: 25, height: 25))
        supportImg.image = UIImage(systemName: "questionmark.circle.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        
        let support = UILabel(frame: CGRect(x: 0, y: 35, width: UIScreen.width/3.5, height: 10))
        support.text = "Помощь"
        support.font = .systemFont(ofSize: 12)
        support.textColor = .systemYellow
        support.textAlignment = .center
        
        
        uiview1.addSubview(supportImg)
        uiview1.addSubview(support)
        
        let uiview2 = UIView(frame: CGRect(x: UIScreen.width/3.5 + 30, y: 100, width: UIScreen.width/3.5, height: 56))
        uiview2.backgroundColor = .systemBlue.withAlphaComponent(0.2)
        uiview2.layer.cornerRadius = 10
        
        let repeatImg = UIImageView(frame: CGRect(x: UIScreen.width/7-10, y: 8, width: 25, height: 20))
        repeatImg.image = UIImage(systemName: "arrow.triangle.2.circlepath")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        
        let repeats = UILabel(frame: CGRect(x: 0, y: 35, width: UIScreen.width/3.5, height: 10))
        repeats.text = "Повторить"
        repeats.font = .systemFont(ofSize: 12)
        repeats.textColor = .systemBlue
        repeats.textAlignment = .center
        
        uiview2.addSubview(repeatImg)
        uiview2.addSubview(repeats)
        
        let uiview3 = UIView(frame: CGRect(x: 2 * UIScreen.width/3.5 + 40, y: 100, width: UIScreen.width/3.5, height: 56))
        uiview3.backgroundColor = .systemGreen.withAlphaComponent(0.2)
        uiview3.layer.cornerRadius = 10
        
        let callImg = UIImageView(frame: CGRect(x: UIScreen.width/7-10, y: 8, width: 25, height: 20))
        callImg.image = UIImage(systemName: "phone.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        
        let call = UILabel(frame: CGRect(x: 0, y: 35, width: UIScreen.width/3.5, height: 10))
        call.text = "Позвонить"
        call.font = .systemFont(ofSize: 12)
        call.textColor = .systemGreen
        call.textAlignment = .center
        
        uiview3.addSubview(callImg)
        uiview3.addSubview(call)
        
        locationView.addSubview(uiview1)
        locationView.addSubview(uiview2)
        locationView.addSubview(uiview3)
        
        locationView.addSubview(fromImg)
        locationView.addSubview(gotoImg)
        locationView.addSubview(from)
        locationView.addSubview(goto)
        view.addSubview(locationView)
    }
    
    func driver() {
        driverView.frame.origin.x = 0
        driverView.frame.origin.y = originY
        driverView.frame.size.width = UIScreen.width
        driverView.frame.size.height = 80
        originY += driverView.frame.size.height
        
        let driverLabel = UILabel(frame: CGRect(x: 20, y: 50, width: driverView.frame.size.width/2, height: 25))
        driverLabel.text = "Водитель"
        driverLabel.font = .systemFont(ofSize: 20, weight: .medium)
        driverLabel.textColor = .black
        
        let line = UIView(frame: CGRect(x: 20, y: 80, width: UIScreen.width-40, height: 1))
        line.backgroundColor = .systemGray5
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 95, width: 60, height: 60))
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "profileImage")?.withRoundedCorners(radius: UIScreen.height/2)
        
        let name = UILabel(frame: CGRect(x: 100, y: 100, width: UIScreen.width*2/3, height: 25))
        name.text = "Elon Musk"
        name.font = .systemFont(ofSize: 18, weight: .medium)
        name.textColor = .black
        
        let rating = UILabel(frame: CGRect(x: 100, y: 125, width: UIScreen.width/3, height: 20))
        rating.text = "Рейтинг: 5"
        rating.font = .systemFont(ofSize: 14)
        rating.textColor = .systemGray
        
        let nums = UILabel(frame: CGRect(x: UIScreen.width/3 + 80, y: 125, width: UIScreen.width/3, height: 20))
        nums.text = "Поездки: 1885"
        nums.font = .systemFont(ofSize: 14)
        nums.textColor = .systemGray
        
        driverView.addSubview(driverLabel)
        driverView.addSubview(line)
        driverView.addSubview(imageView)
        driverView.addSubview(name)
        driverView.addSubview(rating)
        driverView.addSubview(nums)
        view.addSubview(driverView)
    }
    
    func allData() {
        allDatasView.frame.origin.x = 0
        allDatasView.frame.origin.y = originY
        allDatasView.frame.size.width = UIScreen.width
        allDatasView.frame.size.height = 150
        originY += allDatasView.frame.size.height
        
        let datasLabel = UILabel(frame: CGRect(x: 20, y: 90, width: driverView.frame.size.width/2, height: 25))
        datasLabel.text = "Общие данные"
        datasLabel.font = .systemFont(ofSize: 20, weight: .medium)
        datasLabel.textColor = .black
        
        let line = UIView(frame: CGRect(x: 20, y: 120, width: UIScreen.width-40, height: 1))
        line.backgroundColor = .systemGray5
        
        let keys = ["Тариф","Способ оплаты","Заказ №","Дата и время поездки","Продолжительность поездки"]
        let values = ["Бизнес","Наличными","3917866","29 Август, 19:20","00:45"]
        
        for index in 0..<keys.count {
            let key = UILabel(frame: CGRect(x: 20, y: index * 30 + 130, width: Int(UIScreen.width)*2/3, height: 25))
            key.text = keys[index]
            key.font = .systemFont(ofSize: 14)
            key.textColor = .darkGray
            allDatasView.addSubview(key)
        }
        
        for index in 0..<values.count {
            let value = UILabel(frame: CGRect(x: 20, y: index * 30 + 130, width: Int(allDatasView.frame.size.width)-40, height: 25))
            value.text = values[index]
            value.textAlignment = .right
            value.font = .systemFont(ofSize: 14, weight: .medium)
            value.textColor = .black
            allDatasView.addSubview(value)
        }
        
        allDatasView.addSubview(datasLabel)
        allDatasView.addSubview(line)
        view.addSubview(allDatasView)
    }
    
    func accountMoney() {
        accountMoneyView.frame.origin.x = 0
        accountMoneyView.frame.origin.y = originY
        accountMoneyView.frame.size.width = UIScreen.width
        accountMoneyView.frame.size.height = 100
        originY += accountMoneyView.frame.size.height
        
        let account = UILabel(frame: CGRect(x: 20, y: 140, width: driverView.frame.size.width/2, height: 25))
        account.text = "Расчёт стоимости"
        account.font = .systemFont(ofSize: 20, weight: .medium)
        account.textColor = .black
        
        let line = UIView(frame: CGRect(x: 20, y: 170, width: UIScreen.width-40, height: 1))
        line.backgroundColor = .systemGray5
        
        let keys = ["Минимальная сумма","Сумма поездки","Цена ожидании"]
        let values = ["10,000 UZS","31,645 UZS","0 UZS"]
        
        for index in 0..<keys.count {
            let key = UILabel(frame: CGRect(x: 20, y: index * 30 + 180, width: Int(UIScreen.width)/2, height: 25))
            key.text = keys[index]
            key.font = .systemFont(ofSize: 14)
            key.textColor = .darkGray
            accountMoneyView.addSubview(key)
        }
        
        for index in 0..<values.count {
            let value = UILabel(frame: CGRect(x: 20, y: index * 30 + 180, width: Int(allDatasView.frame.size.width)-40, height: 25))
            value.text = values[index]
            value.textAlignment = .right
            value.font = .systemFont(ofSize: 14, weight: .medium)
            value.textColor = .black
            accountMoneyView.addSubview(value)
        }
        
        accountMoneyView.addSubview(account)
        accountMoneyView.addSubview(line)
        view.addSubview(accountMoneyView)
    }
    
    func money() {
        moneyView.frame.origin.x = 0
        moneyView.frame.origin.y = originY
        moneyView.frame.size.width = UIScreen.width
        moneyView.frame.size.height = 60
        originY += moneyView.frame.size.height
        
        let line = UIView(frame: CGRect(x: 20, y: 190, width: UIScreen.width-40, height: 1))
        line.backgroundColor = .systemGray5
        
        let summa = UILabel(frame: CGRect(x: 20, y: 200, width: driverView.frame.size.width/2, height: 25))
        summa.text = "Итого"
        summa.font = .systemFont(ofSize: 20, weight: .medium)
        summa.textColor = .black
        
        let money = UILabel(frame: CGRect(x: 20, y: 200, width: driverView.frame.size.width-40, height: 25))
        money.text = "39,600 UZS"
        money.textAlignment = .right
        money.font = .systemFont(ofSize: 20, weight: .medium)
        money.textColor = .black
        
        moneyView.addSubview(line)
        moneyView.addSubview(summa)
        moneyView.addSubview(money)
        view.addSubview(moneyView)
    }

}
