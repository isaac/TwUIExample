require 'rubygems'
require 'hotcocoa'
require 'hotcocoa/graphics'

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
end

TwUIExample.new.start
