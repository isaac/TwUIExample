class ExampleTab < TUIView
  def tabBar
    superview
  end

  def mouseDown event
    super
    setNeedsDisplay
  end

  def mouseUp event
    super
    animations = Proc.new { redraw }
    TUIView.animateWithDuration 0.5, animations:animations
    tabBar.delegate.tabBar(tabBar, didSelectTab:self.tag) if eventInside(event)
  end

  def layoutSubviews
    subviews.each do |v|
      b = v.superview.bounds
      tabs = tabBar.tabs
      puts tabs
      puts tabs.class
      width = b.size.width / tabs
      x = index * width
      v.frame = [ x.round, 0, width.round, b.size.height ]
    end
  end
end