class CustomResponder < ActionController::Base
  def to_html
    unless has_errors?
      if post?
        controller.flash.notice = resource.class.name.humanize + " ctreated successfuly"
      elsif patch? || put?
        controller.flash.notice = resource.class.name.humanize + " updated successfuly"
      end
    end

    super
  end
end