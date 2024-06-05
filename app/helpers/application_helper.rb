module ApplicationHelper
    def flash_background_color(type)
        case type.to_sym
        when :success then "bg-success"
        when :alert  then "bg-error"
        else "bg-gray-500"
        end
    end
end
