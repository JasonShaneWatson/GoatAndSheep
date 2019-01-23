//
//  ViewController.swift
//  SheepAndGoatApp
//
//  Created by Jason Watson on 12/29/18.
//  Copyright © 2018 Angelo State University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImg = UIImageView(image:(UIImage(named: "field")))
    let newBackgroundImg = UIImageView()
    let whiteBackground = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    //Home page
    let sheepIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let goatIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let goatLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let sheepLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let titleSubLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let tapLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    //Input page
    let weaningMonthLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let weaningMonthSelectedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let weaningPoundsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let weaningPoundsSelectedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
   
    //Universal
    let animationTime : Double = 1.0
    var animalChosen : String = ""
    var weaningPounds : Int = 0
    var weaningMonth : String = "December"
    
    
    
    

    override func viewDidLoad(){
        super.viewDidLoad()
              // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(hexString: "#ccccccff")
        
       
        backgroundImg.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width/1.32)
        self.view.addSubview(backgroundImg)
        buildGoatSheepHome()
        buildNavBar()
        
    }
    
    func buildGoatSheepHome()
    {
        setBackgroundImg(img: "field")
        
        let whiteBackgroundYCoord : CGFloat = self.view.frame.height * 0.30
        let iconSize : CGFloat = 0.30
        let labelColor = UIColor(red: 0.07, green: 0.48, blue: 0.29, alpha: 1.0)
        
        //create white background
        whiteBackground.frame = CGRect(x: 0, y: whiteBackgroundYCoord+15, width: self.view.frame.width, height: self.view.frame.height * 0.60 - 17)
        whiteBackground.backgroundColor = UIColor(hexString: "#ffffffff")
        whiteBackground.tintColor = UIColor(hexString: "#ffffffff")
        whiteBackground.layer.cornerRadius = CGFloat(20.0)
        whiteBackground.clipsToBounds = true
        whiteBackground.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.view.addSubview(whiteBackground)
        
        //add title
        titleLabel.frame = CGRect(origin: CGPoint(x: 0 , y: self.view.frame.height * 0.13), size: CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.05))
        titleLabel.text = "Sheep & Goat"
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = UIColor.white
        titleLabel.alpha = 0.0
        if self.view.frame.height < 812
        {
            titleLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        }
        else
        {
            titleLabel.font = .systemFont(ofSize: 35, weight: .heavy)
        }
        
        titleSubLabel.frame = CGRect(origin: CGPoint(x: 0 , y: self.view.frame.height * 0.18), size: CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.03))
        titleSubLabel.text = "Market Forecast"
        titleSubLabel.textAlignment = .center
        titleSubLabel.adjustsFontSizeToFitWidth = true
        titleSubLabel.textColor = UIColor.white
        titleSubLabel.alpha = 0.0
        if self.view.frame.height < 812
        {
            titleSubLabel.font = .systemFont(ofSize: 17, weight: .regular)
        }
        else
        {
            titleSubLabel.font = .systemFont(ofSize: 25, weight: .regular)
        }
        self.view.addSubview(titleLabel)
        
        self.view.addSubview(titleSubLabel)
        
        
        //create sheep button
        let sheepIconImg = UIImage(named: "sheep_icon")?.withRenderingMode(.alwaysOriginal)
        let sheepIconWidth = (whiteBackground.frame.width * iconSize)
        let sheepIconHeight = (sheepIconWidth)
        sheepIcon.frame = CGRect(x: (whiteBackground.frame.width / 2) - (sheepIconWidth / 2), y: whiteBackgroundYCoord + (whiteBackground.frame.height * 0.10) , width: sheepIconWidth, height: sheepIconHeight)
        sheepIcon.imageView?.contentMode = .scaleAspectFit
        sheepIcon.tag = 1
        sheepIcon.setBackgroundImage(sheepIconImg, for: UIControl.State.normal)
        sheepIcon.addTarget(self, action: #selector(self.selectedAnimal), for: .touchUpInside)
        sheepIcon.layer.shadowOpacity = 0.0
        sheepIcon.alpha = 0.0
        
        //create sheep label
        sheepLabel.frame = CGRect(origin: CGPoint(x: 0 , y: sheepIcon.frame.maxY), size: CGSize(width: self.view.frame.width, height: sheepIconHeight * 0.2))
        sheepLabel.text = "Sheep"
        sheepLabel.textAlignment = .center
        sheepLabel.font = UIFont.boldSystemFont(ofSize: sheepLabel.font.pointSize)
        sheepLabel.adjustsFontSizeToFitWidth = true
        sheepLabel.textColor = labelColor
        sheepLabel.alpha = 0.0
        self.view.addSubview(sheepIcon)
        self.view.addSubview(sheepLabel)
        
        //create goat button
        let goatIconImg = UIImage(named: "goat_icon")?.withRenderingMode(.alwaysOriginal)
        goatIcon.frame = CGRect(x: (whiteBackground.frame.width / 2) - (sheepIconWidth / 2), y: sheepIcon.frame.maxY + (whiteBackground.frame.height * 0.10), width: sheepIconWidth, height: sheepIconHeight)
        goatIcon.imageView?.contentMode = .scaleAspectFit
        goatIcon.tag = 2
        goatIcon.setBackgroundImage(goatIconImg, for: UIControl.State.normal)
        goatIcon.addTarget(self, action: #selector(self.selectedAnimal), for: .touchUpInside)
        goatIcon.alpha = 0.0
        
        //create sheep label
        goatLabel.frame = CGRect(origin: CGPoint(x: 0 , y: goatIcon.frame.maxY), size: CGSize(width: self.view.frame.width, height: sheepIconHeight * 0.2))
        goatLabel.text = "Goat"
        goatLabel.textAlignment = .center
        goatLabel.font = UIFont.boldSystemFont(ofSize: sheepLabel.font.pointSize)
        goatLabel.adjustsFontSizeToFitWidth = true
        goatLabel.textColor = labelColor
        goatLabel.alpha = 0.0
        self.view.addSubview(goatIcon)
        self.view.addSubview(goatLabel)
        
        //add "tap an option" label
        tapLabel.frame = CGRect(origin: CGPoint(x: 0 , y: self.view.frame.height * 0.81), size: CGSize(width: self.view.frame.width, height: sheepIconHeight * 0.2))
        tapLabel.text = "Tap an option above to start."
        tapLabel.textAlignment = .center
        tapLabel.adjustsFontSizeToFitWidth = true
        tapLabel.alpha = 0.0
        if tapLabel.font.pointSize > 15 && self.view.frame.height < 812
        {
            tapLabel.font = .systemFont(ofSize: 15, weight: .bold)
           
        }
        else
        {
            tapLabel.font = .systemFont(ofSize: tapLabel.font.pointSize, weight: .bold)
        }
        tapLabel.textColor = UIColor(hexString: "#757575ff")
        self.view.addSubview(tapLabel)
        
       
         UIView.animate(withDuration: animationTime, animations: {
            self.sheepIcon.alpha = 1.0
            self.goatIcon.alpha = 1.0
            self.goatLabel.alpha = 1.0
            self.sheepLabel.alpha = 1.0
            self.titleLabel.alpha = 1.0
            self.titleSubLabel.alpha = 1.0
            self.tapLabel.alpha = 1.0
        })
        
    }
    
    func buildInputPage()
    {
        titleLabel.alpha = 0.0
        titleLabel.frame = CGRect(origin: CGPoint(x: whiteBackground.frame.width * 0.05 , y: whiteBackground.frame.minY + whiteBackground.frame.height * 0.07), size: CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.05))
        titleLabel.text = animalChosen
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = UIColor.black
        titleLabel.font = .systemFont(ofSize: titleLabel.font.pointSize + 5, weight: .bold)
        titleLabel.alpha = 1.0
        
        weaningMonthLabel.frame = CGRect(origin: CGPoint(x: whiteBackground.frame.width * 0.05 , y: titleLabel.frame.maxY + whiteBackground.frame.height * 0.07), size: CGSize(width: self.view.frame.width/3, height: self.view.frame.height * 0.05))
        weaningMonthLabel.text = "Weaning Month"
        weaningMonthLabel.textAlignment = .left
        weaningMonthLabel.adjustsFontSizeToFitWidth = true
        weaningMonthLabel.textColor = UIColor.black
        weaningMonthLabel.font = .systemFont(ofSize: weaningMonthLabel.font.pointSize, weight: .thin)
        self.view.addSubview(weaningMonthLabel)
        
        weaningMonthSelectedLabel.frame = CGRect(origin: CGPoint(x: whiteBackground.frame.width * 0.55 , y: titleLabel.frame.maxY + whiteBackground.frame.height * 0.07), size: CGSize(width: self.view.frame.width/3, height: self.view.frame.height * 0.05))
        weaningMonthSelectedLabel.text =  weaningMonth
        weaningMonthSelectedLabel.textAlignment = .right
        weaningMonthSelectedLabel.textColor = UIColor.black
        weaningMonthSelectedLabel.font = .systemFont(ofSize: weaningMonthLabel.font.pointSize, weight: .thin)
        self.view.addSubview(weaningMonthSelectedLabel)
        
        //makes the weaning month portion clickable so we can click to open picker
        let weaningMonthButton = UIButton(frame: CGRect(x: 0, y: titleLabel.frame.maxY + whiteBackground.frame.height * 0.07, width: whiteBackground.frame.width, height: self.view.frame.height * 0.05))
        weaningMonthButton.tag = 1
        weaningMonthButton.addTarget(self, action: #selector(self.openPicker), for: .touchUpInside)
        self.view.addSubview(weaningMonthButton)
        
        weaningPoundsLabel.frame = CGRect(origin: CGPoint(x: whiteBackground.frame.width * 0.05 , y: weaningMonthLabel.frame.maxY + whiteBackground.frame.height * 0.04), size: CGSize(width: self.view.frame.width/3, height: self.view.frame.height * 0.05))
        weaningPoundsLabel.text = "Weaning Pounds"
        weaningPoundsLabel.textAlignment = .left
        weaningPoundsLabel.adjustsFontSizeToFitWidth = true
        weaningPoundsLabel.textColor = UIColor.black
        weaningPoundsLabel.font = .systemFont(ofSize: weaningMonthLabel.font.pointSize, weight: .thin)
        self.view.addSubview(weaningPoundsLabel)
        
        weaningPoundsSelectedLabel.frame = CGRect(origin: CGPoint(x: whiteBackground.frame.width * 0.55 , y: weaningMonthLabel.frame.maxY + whiteBackground.frame.height * 0.04), size: CGSize(width: self.view.frame.width/3, height: self.view.frame.height * 0.05))
        weaningPoundsSelectedLabel.text =  "25"
        weaningPoundsSelectedLabel.textAlignment = .right
        weaningPoundsSelectedLabel.textColor = UIColor.black
        weaningPoundsSelectedLabel.font = .systemFont(ofSize: weaningPoundsLabel.font.pointSize, weight: .thin)
        self.view.addSubview(weaningPoundsSelectedLabel)
        
        let weaningPoundButton = UIButton(frame: CGRect(x: 0, y: weaningMonthLabel.frame.maxY + whiteBackground.frame.height * 0.04, width: whiteBackground.frame.width, height: self.view.frame.height * 0.05))
        weaningPoundButton.tag = 1
        weaningPoundButton.addTarget(self, action: #selector(self.openPicker), for: .touchUpInside)
        self.view.addSubview(weaningPoundButton)
        
    }

    func buildNavBar()
    {
        
        //navBar will be 1/10 of total screen size. if factor was 12 then it would be 1/12 of total screen size.
        let factor : CGFloat = 10
        let navBarHeight : CGFloat = self.view.frame.height / factor
        let navBarWidth : CGFloat = self.view.frame.width
        let navBarYCoord : CGFloat = self.view.frame.height - navBarHeight
        let iconSize : CGFloat = 0.40
        let iconColor = UIColor(hexString: "#757575ff")
        let labelColor = UIColor(red: 0.33, green: 0.33, blue: 0.33, alpha: 1.0)
        let navBar = UIView(frame: CGRect(x: 0, y: navBarYCoord , width: navBarWidth, height: navBarHeight))
        navBar.backgroundColor = UIColor(hexString: "#f9f9f9ff")
        
        
        //build home icon and label
        let homeIconImg = UIImage(named: "home_icon")?.withRenderingMode(.alwaysTemplate)
        let homeIconWidth = (navBar.frame.height * iconSize)  * 1.34
        let homeIconHeight = (navBarHeight * iconSize)
        let homeIcon = UIButton(frame: CGRect(x: (navBarWidth / 3) - (navBarWidth / 3 / 2) - (homeIconWidth/2), y: navBarYCoord + (navBar.frame.height * 0.10) , width: homeIconWidth, height: homeIconHeight))
        homeIcon.tintColor = iconColor
        homeIcon.tag = 1
        homeIcon.setBackgroundImage(homeIconImg, for: UIControl.State.normal)
        homeIcon.addTarget(self, action: #selector(self.homePressed), for: .touchUpInside)
        
        let homeLabel = UILabel(frame: CGRect(origin: CGPoint(x: (navBarWidth / 3) - (navBarWidth / 3 / 2) - (homeIconWidth/2), y: navBarYCoord + (navBar.frame.height * 0.55)), size: CGSize(width: homeIconWidth, height: homeIconHeight * 0.6)))
        homeLabel.text = "Home"
        homeLabel.adjustsFontSizeToFitWidth = true
        homeLabel.textColor = labelColor
        
    
        //build calculator icon and label
        let calcIconImg = UIImage(named: "calc_icon")?.withRenderingMode(.alwaysTemplate)
        let calcIconWidth = (navBar.frame.height * iconSize)  * 0.679
        let calcIconHeight = (navBarHeight * iconSize)
        let calcIcon = UIButton(frame: CGRect(x: ((navBarWidth / 3)  * 2) - (navBarWidth / 3 / 2) - (calcIconWidth/2), y: navBarYCoord + (navBar.frame.height * 0.10) , width: calcIconWidth, height: calcIconHeight))
        calcIcon.tintColor = iconColor
        calcIcon.tag = 2
        calcIcon.setBackgroundImage(calcIconImg, for: UIControl.State.normal)
        calcIcon.addTarget(self, action: #selector(self.homePressed), for: .touchUpInside)
        
        let calcLabel = UILabel(frame: CGRect(origin: CGPoint(x: ((navBarWidth / 3)  * 2) - (navBarWidth / 3 / 2) - (homeIconWidth), y: navBarYCoord + (navBar.frame.height * 0.55)), size: CGSize(width: homeIconWidth *
            2, height: homeIconHeight * 0.6)))
        calcLabel.text = "Cost of Gain"
        calcLabel.adjustsFontSizeToFitWidth = true
        calcLabel.textColor = labelColor
        
        
        //build info icon and label
        let infoIconImg = UIImage(named: "info_icon")?.withRenderingMode(.alwaysTemplate)
        let infoIconWidth = (navBar.frame.height * iconSize)
        let infoIconHeight = (navBarHeight * iconSize)
        let infoIcon = UIButton(frame: CGRect(x: navBarWidth  - (navBarWidth / 3 / 2) - (infoIconWidth/2), y: navBarYCoord + (navBar.frame.height * 0.10) , width: infoIconWidth, height: infoIconHeight))
        infoIcon.tintColor = iconColor
        infoIcon.tag = 3
        infoIcon.setBackgroundImage(infoIconImg, for: UIControl.State.normal)
        infoIcon.addTarget(self, action: #selector(self.homePressed), for: .touchUpInside)
       
        let infoLabel = UILabel(frame: CGRect(origin: CGPoint(x: navBarWidth  - (navBarWidth / 3 / 2) - (homeIconWidth/2), y: navBarYCoord + (navBar.frame.height * 0.55)), size: CGSize(width: homeIconWidth, height: homeIconHeight * 0.6)))
        infoLabel.text = "About"
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.textColor = labelColor
        
        
        //place all piece together on navbar
        self.view.addSubview(navBar)
        self.view.addSubview(homeIcon)
        self.view.addSubview(homeLabel)
        self.view.addSubview(calcIcon)
        self.view.addSubview(calcLabel)
        self.view.addSubview(infoIcon)
        self.view.addSubview(infoLabel)
    }
    
    
    @objc func homePressed(_ sender:UIButton!)
    {
        if sender.tag == 1
        {
            self.buildGoatSheepHome()
        }
        else if sender.tag == 2
        {
            print("Cost of Gain pressed")
        }
        else if sender.tag == 3
        {
            print("Info Pressed")
        }
        
    }
    @objc func openPicker(_ sender:UIButton!)
    {
      print("it worked!")
        
    }
  
    
    @objc func selectedAnimal(_ sender:UIButton!)
    {
        UIView.animate(withDuration: animationTime, animations: {
            
            
            self.sheepIcon.alpha = 0.0
            self.goatIcon.alpha = 0.0
            self.goatLabel.alpha = 0.0
            self.sheepLabel.alpha = 0.0
            self.titleLabel.alpha = 0.0
            self.titleSubLabel.alpha = 0.0
            self.tapLabel.alpha = 0.0
            
            
            
        },completion: { _ in
            
            //self.goatIcon.removeFromSuperview()
            //self.sheepIcon.removeFromSuperview()
            
            self.buildInputPage()
            // self.view.superview?.alpha = 1.0
            
        })
        
        if sender.tag == 1
        {
        
            
            self.setBackgroundImg(img: "sheep")
            animalChosen = "Sheep"
        }
        else if sender.tag == 2
        {
            self.setBackgroundImg(img: "goat")
            animalChosen = "Goat"
        }
        
    }
    
    func setBackgroundImg(img : String)
    {
        
        newBackgroundImg.image = UIImage(named: img)
        newBackgroundImg.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width/1.32)
        newBackgroundImg.alpha = 0.0
        self.view.addSubview(newBackgroundImg)
        self.view.sendSubviewToBack(newBackgroundImg)
        
        UIView.animate(withDuration: animationTime, animations: {
            
            self.backgroundImg.alpha = 0.0
            self.newBackgroundImg.alpha = 1.0
            
            
        },completion: { _ in
        
            self.backgroundImg.image = UIImage(named: img)
            self.backgroundImg.alpha = 1.0
            self.newBackgroundImg.removeFromSuperview()
            
            })
       
        
    }
    
    
}
