module CieloAssets
  module FormHelper
    def cielo_controls name, style=:horizontal
      content_tag :div, id: :cielo_controls, class: style do
        [:amex,:diners,:elo,:mastercard,:mastercard_securecode,:verified_by_visa,:visa].collect { |flag|
          [
            radio_button_tag(name, flag),
            label_tag("#{name}_#{flag}", t(flag), class: flag)
          ].join.html_safe
        }.join.html_safe
      end
    end
  end
end
