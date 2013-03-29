#the following code is copied from
#roberto / _flash_messages.html.erb github posting.
#github link is: https://gist.github.com/roberto/3344628
module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
