class MainController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    @field_bar = MIMInputToolbar.new

    @text_1 = UITextField.alloc.initWithFrame([[40, 100],[100, 30]])
    @text_1.placeholder = "Text Field 1"
    @text_1.inputAccessoryView = @field_bar

    @text_2 = UITextField.alloc.initWithFrame([[40, 140],[100, 30]])
    @text_2.placeholder = "Text Field 2"
    @text_2.inputAccessoryView = @field_bar

    @text_3 = UITextField.alloc.initWithFrame([[40, 180],[100, 30]])
    @text_3.placeholder = "Text Field 3"
    @text_3.inputAccessoryView = @field_bar

    view.addSubview(@text_1)
    view.addSubview(@text_2)
    view.addSubview(@text_3)

    @field_bar.fields = [@text_1, @text_2, @text_3]
  end
end
