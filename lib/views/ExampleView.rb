class ExampleView < TUIView
  include HotCocoa::Graphics

  attr_accessor :exampleFont1, :exampleFont2, :tableView, :tabBar

  TAB_HEIGHT = 60

  def initWithFrame frame
    super
    self.backgroundColor = TUIColor.colorWithWhite 0.9, alpha:1.0
    self.exampleFont1 = TUIFont.fontWithName "HelveticaNeue", size:15
    self.exampleFont2 = TUIFont.fontWithName "HelveticaNeue-Bold", size:15
    b = bounds
    b.origin.y += TAB_HEIGHT
    b.size.height -= TAB_HEIGHT
    self.tableView = TUITableView.alloc.initWithFrame b
    tableView.autoresizingMask = TUIViewAutoresizingFlexibleSize
    tableView.dataSource = self
    tableView.delegate = self
    tableView.maintainContentOffsetAfterReload = true
    addSubview tableView
    self.tabBar = ExampleTabBar.alloc.initWithNumberOfTabs 5
  end

  def numberOfSectionsInTableView view
    8
  end

  def tableView view, numberOfRowsInSection:section
    25
  end

  def tableView view, heightForRowAtIndexPath:indexPath
    50
  end

  def tableView view, headerViewForSection:section
    headerView = ExampleSectionHeaderView.alloc.initWithFrame [ 0, 0, 100, 32 ]
    title = TUIAttributedString.stringWithString "Example Section #{section}"
    title.color = TUIColor.blackColor
    title.font = exampleFont2
    headerView.labelRenderer.attributedString = title
    headerView
  end

  def tableView view, cellForRowAtIndexPath:indexPath
    cell = reusableTableCellOfClass(ExampleTableViewCell) { |c| }
    cell.attributedString = TUIAttributedString.stringWithString "example cell #{indexPath.row}"
    cell.attributedString.color = TUIColor.blackColor
    cell.attributedString.font = exampleFont1
    cell.attributedString.setFont exampleFont2, inRange:[ 8, 4 ]
    cell
  end

  def tableView view, shouldSelectRowAtIndexPath:indexPath, forEvent:event
    case event.type
    when NSRightMouseDown
      return false
    end
    true
  end

  def tableView view, canMoveRowAtIndexPath:indexPath
    true
  end

  def tableView view, moveRowAtIndexPath:fromIndexPath, toIndexPath:toIndexPath
    puts "Move dragged row: #{fromIndexPath} => #{toIndexPath}"
  end

  def tableView view, targetIndexPathForMoveFromRowAtIndexPath:fromPath, toProposedIndexPath:proposedPath
    proposedPath
  end

  def reusableTableCellOfClass(cellClass, &block)
    tableView.ab_reusableCellOfClass cellClass, identifier:"ab.#{cellClass}", initializationBlock:block
  end

end