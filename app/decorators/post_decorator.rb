class PostDecorator < Draper::Decorator
  delegate_all

  def drink_type_show
    if object.drink_type == "cold"
      h.content_tag(:div, class: 'flex items-center') do
        h.concat(h.content_tag(:span, 'ac_unit', class: 'material-icons'))
        h.concat(h.content_tag(:span, 'cold', class: 'ml-2'))
      end
    else 
      h.content_tag(:div, class: 'flex items-center') do
        h.concat(h.content_tag(:span, 'coffee', class: 'material-icons'))
        h.concat(h.content_tag(:span, 'hot', class: 'ml-2'))
      end
    end
  end

  def drink_time_show
    if object.drink_time == "morning"
      h.content_tag(:div, class: 'flex items-center') do
        h.concat(h.content_tag(:span, 'wb_twilight', class: 'material-icons'))
        h.concat(h.content_tag(:span, 'morning', class: 'ml-2'))
      end
    elsif object.drink_time == "midmorning"
      h.content_tag(:div, class: 'flex items-center') do
        h.concat(h.content_tag(:span, 'wb_twilight', class: 'material-icons'))
        h.concat(h.content_tag(:span, 'midmorning', class: 'ml-2'))
      end
    elsif object.drink_time == "noon"
      h.content_tag(:div, class: 'flex items-center') do
        h.concat(h.content_tag(:span, 'wb_sunny', class: 'material-icons'))
        h.concat(h.content_tag(:span, 'noon', class: 'ml-2'))
      end
    elsif object.drink_time == "afternoon"
      h.content_tag(:div, class: 'flex items-center') do
        h.concat(h.content_tag(:span, 'wb_sunny', class: 'material-icons'))
        h.concat(h.content_tag(:span, 'afternoon', class: 'ml-2'))
      end
    elsif object.drink_time == "evening"
      h.content_tag(:div, class: 'flex items-center') do
        h.concat(h.content_tag(:span, 'nights_stay', class: 'material-icons'))
        h.concat(h.content_tag(:span, 'evening', class: 'ml-2'))
      end
    else
      h.content_tag(:div, class: 'flex items-center') do
        h.concat(h.content_tag(:span, 'nights_stay', class: 'material-icons'))
        h.concat(h.content_tag(:span, 'night', class: 'ml-2'))
      end
    end
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end