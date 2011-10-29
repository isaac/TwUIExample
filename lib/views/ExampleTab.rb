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
end