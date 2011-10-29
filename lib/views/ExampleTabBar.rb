class ExampleTabBar < TUIView
  attr_accessor :delegate, :tabViews

  def initWithNumberOfTabs tabs
    initWithFrame CGRectZero
    self.tabViews = []
    (0..tabs - 1).to_a.each do |index|
      t = ExampleTab.alloc.initWithFrame CGRectZero
      t.layout = Proc.new { |v| CGRectZero }
      addSubview t
      tabViews << t
    end
    self
  end
end