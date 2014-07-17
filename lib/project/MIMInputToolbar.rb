class MIMInputToolbar < UIToolbar
  attr_accessor :fields

  def init
    super
    @fields ||= []

    self.items = [
      UIBarButtonItem.alloc.initWithTitle('Previous', style: UIBarButtonItemStylePlain, target: self, action: 'previous_field:'),
      UIBarButtonItem.alloc.initWithTitle('Next', style: UIBarButtonItemStylePlain, target: self, action: 'next_field:'),
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemFlexibleSpace, target: nil, action: nil),
      UIBarButtonItem.alloc.initWithTitle('Done', style: UIBarButtonItemStyleDone, target: self, action: 'finish_editing:')
    ]

    self.sizeToFit

    self
  end

  def previous_title=(title)
    self.items[0].title = title
  end

  def next_title=(title)
    self.items[1].title = title
  end

  def done_title=(title)
    self.items[3].title = title
  end

  def previous_field(sender)
    index = fields.index(selected_field)
    if index >= 1
      fields[index - 1].becomeFirstResponder
    end
  end

  def next_field(sender)
    index = fields.index(selected_field)
    if index < fields.length - 1
      fields[index + 1].becomeFirstResponder
    end
  end

  def finish_editing(sender)
    selected_field.resignFirstResponder
  end

  private

  def selected_field
    fields.select { |f| f.isFirstResponder }.first
  end
end
