# AMTrackingsliderlikeFlipkart
Order Tracker like Flipkart Orders

This will display like flipkart slider animated progress view vertical 

****Only applicable on UITableview

video:
<p><video>
  <source src="https://vimeo.com/user91776928/review/301060550/2d3f9359cf" type='video/mp4'>
</video></p>

**usage :

Simply drag and Drop file 'AMOrderTrackerForUITableView.swift'

    var baseView = AMOrderTrackerForUITableView() // create obj
    baseView.setView(tblView: self.tblView, selected_indexForAnimation : 3) // set on table view

That's it.

**Functionality and variables for customizations :  

    public var baseY : CGFloat = 15 // vertical spacing
    public var dot_Height : CGFloat = 12 // height of dot
    public var dot_Width : CGFloat = 12 // height of dot
    public var leading : CGFloat = 15 // x - spacing
    public var strip_width : CGFloat = 4 // strip width
    public var strip_color : UIColor = .red // bg color
    public var strip_selected_color : UIColor = .green // selected color

**Thanks in advance
