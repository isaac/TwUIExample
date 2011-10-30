framework 'TwUI'
require 'rubygems'
require 'hotcocoa'
require 'hotcocoa/graphics'

class AppDelegate
  attr_accessor :window
  def applicationDidFinishLaunching(a_notification)
    frame = [ 0, 0, 500, 450 ]
    view = TUINSView.alloc.initWithFrame frame
    view.rootView = ExampleView.alloc.initWithFrame frame
    window.contentView = view
  end
end

