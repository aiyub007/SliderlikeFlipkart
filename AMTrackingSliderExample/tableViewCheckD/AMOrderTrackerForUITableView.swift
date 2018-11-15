//
//  AMOrderTrackerForUITableView.swift
//  tableViewCheckD
//
//  Created by Aiyub on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

import UIKit

class AMOrderTrackerForUITableView: UIView
{
    //MARK: - View Variables -
    private var fillView : UIView!
    private var dotViewArr : [UIView] = []
    
    //MARK: - Other Property variables -
    public var baseY : CGFloat = 15 // vertical spacing
    public var dot_Height : CGFloat = 12 // height of dot
    public var dot_Width : CGFloat = 12 // height of dot
    public var leading : CGFloat = 15 // x - spacing
    public var strip_width : CGFloat = 4 // strip width
    public var strip_color : UIColor = .red // bg color
    public var strip_selected_color : UIColor = .green // selected color
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
    }
    func setView(tblView : UITableView, selected_indexForAnimation : Int)
    {
        let total_count = tblView.numberOfRows(inSection: 0)
        guard total_count > 0 else
        {
            self.frame = CGRect(x: leading+(dot_Width/2)-(strip_width/2), y: baseY+dot_Height, width: strip_width, height: 0)
             return
        }
        let frame5 = tblView.convert(tblView.rectForRow(at: IndexPath(row: total_count-1, section: 0)), to: tblView)
        self.frame = CGRect(x: leading+(dot_Width/2)-(strip_width/2), y: baseY+dot_Height, width: strip_width, height: frame5.origin.y)
        tblView.addSubview(self)
        self.backgroundColor = strip_color
        
        fillView = UIView(frame: CGRect(x: leading+(dot_Width/2)-(strip_width/2), y: baseY, width: strip_width, height: 0))
        fillView.backgroundColor = .green
        tblView.addSubview(self.fillView)
        for c in 0...total_count-1
        {
            let frameN = tblView.convert(tblView.rectForRow(at: IndexPath(row: c, section: 0)), to: tblView)
            let rView = UIView(frame: CGRect(x: leading, y: frameN.origin.y+baseY, width: dot_Width, height: dot_Height))
            rView.backgroundColor = strip_color
            rView.layer.cornerRadius = dot_Width/2
            tblView.addSubview(rView)
            self.dotViewArr.append(rView)
        }
        guard selected_indexForAnimation < total_count else
        {
            return
        }
        self.setDotColorAndAnimate(toIndex: 0, selectedIndex: selected_indexForAnimation, tblView: tblView)
        
    }
    func delay(delay: Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    func setDotColorAndAnimate(toIndex : Int, selectedIndex : Int, tblView : UITableView)
    {
        if toIndex<=selectedIndex
        {
            UIView.animate(withDuration: Double(1), animations: {
                let frameN = tblView.convert(tblView.rectForRow(at: IndexPath(row: toIndex, section: 0)), to: tblView)
                self.fillView.frame.size.height = frameN.origin.y
            }) { (success) in
                self.dotViewArr[toIndex].backgroundColor = .green
            }
            delay(delay: 1.0)
            {
                self.setDotColorAndAnimate(toIndex: toIndex+1,selectedIndex: selectedIndex, tblView: tblView)
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
