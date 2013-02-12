module CieloAssets
  module FormHelper
    def cielo_controls object_name, method, options={}
      id    = options.delete(:id)    || :cielo_controls
      style = options.delete(:style) || :horizontal

      content_tag :div, id: id, class: style do
        [:amex,:diners,:elo,:mastercard,:mastercard_securecode,:verified_by_visa,:visa].collect { |flag|
          [
            radio_button(object_name, method, flag, options),
            label("#{object_name}_#{method}", flag, options.merge(class: "#{flag} selectable"))
          ].join.html_safe
        }.join.html_safe
      end
    end
  end
end
