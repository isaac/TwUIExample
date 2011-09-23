class ExampleSectionHeaderView < TUITableViewSectionHeader
  include HotCocoa::Graphics

  attr_accessor :labelRenderer

  def initWithFrame frame
    super
    self.labelRenderer = TUITextRenderer.new
    self.textRenderers = [ labelRenderer ]
    self.opaque = true
    self
  end

  def headerWillBecomePinned
    self.opaque = false
    super
  end

  def headerWillBecomeUnpinned
    self.opaque = true
    super
  end

  def drawRect rect
    return unless g = TUIGraphicsGetCurrentContext()
    NSGraphicsContext.currentContext = NSGraphicsContext.graphicsContextWithGraphicsPort g, flipped:false

    Canvas.for_current_context do |c|
      c.background Color.white unless pinnedToViewport?
      start = Color.new 0.8, 0.8, 0.8, 0.9
      finish = Color.new 0.9, 0.9, 0.9, 0.9
      c.gradient Gradient.new start, finish
      c.fill start.darken
      c.rect 0, 0, bounds.size.width, 1
    end

    height = 18
    labelRenderer.frame = [ 15, ((bounds.size.height - height) / 2).to_i, bounds.size.width - 30, height]
    labelRenderer.draw
  end

end