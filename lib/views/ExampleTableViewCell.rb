class ExampleTableViewCell < TUITableViewCell
  include HotCocoa::Graphics

  attr_accessor :textRenderer

  def initWithStyle style, reuseIdentifier:reuseIdentifier
    super
    self.textRenderer = TUITextRenderer.new
    self.textRenderers = [ textRenderer ]
    self
  end

  def attributedString
    textRenderer.attributedString
  end

  def attributedString= string
    textRenderer.attributedString = string
    setNeedsDisplay
  end

  def drawRect rect
    Canvas.for_current_context :size => bounds.size do |c|
      if selected?
        c.background Color.new 0.87, 0.87, 0.87
      else
        c.background Color.new 0.97, 0.97, 0.97
        c.fill Color.white.a(0.9)
        c.rect 0, bounds.size.height-1, bounds.size.width, 1
        c.fill Color.black.a(0.08)
        c.rect 0, 0, bounds.size.width, 1
      end
    end
    textRenderer.frame = CGRectOffset(bounds, 15, -15)
    textRenderer.draw
  end
end