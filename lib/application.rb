require 'rubygems'
require 'hotcocoa'

framework 'TwUI'

Dir.glob(File.join(File.dirname(__FILE__), 'views', '*.rb')).each { |file| require file }

class TwUIExample
  include HotCocoa

  def start
    application name: 'TwUIExample' do |app|
      app.delegate = self
      frame = [ 0, 0, 500, 450 ]
      window frame: frame, title: 'TwUIExample', minSize: [ 300, 250 ], center:true do |win|
        win.view = TUINSView.alloc.initWithFrame frame
        win.view.rootView = ExampleView.alloc.initWithFrame frame
        win.will_close { exit }
      end
    end
  end

  # file/open
  def on_open(menu)
  end

  # file/new
  def on_new(menu)
  end

  # help menu item
  def on_help(menu)
  end

  # This is commented out, so the minimize menu item is disabled
  #def on_minimize(menu)
  #end

  # window/zoom
  def on_zoom(menu)
  end

  # window/bring_all_to_front
  def on_bring_all_to_front(menu)
  end
end

TwUIExample.new.start
