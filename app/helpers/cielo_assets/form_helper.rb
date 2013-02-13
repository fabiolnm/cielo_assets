module CieloAssets
  module FormHelper
    def cielo_controls object_name, method, options={}
      id    = options.delete(:id)    || :cielo_controls
      style = options.delete(:style) || :horizontal

      # object is deleted by radio_button helper,
      # so it must be re-added to options every flag
      object = options[:object]

      content_tag :div, id: id, class: style do
        %w(amex diners elo mastercard mastercard_securecode verified_by_visa visa).collect { |flag|
          options.merge! object: object
          radio = radio_button object_name, method, flag, options
          radio_id = radio.to_s.scan(/id=\"([^"]*)/).flatten.first
          label_options = options.merge class: "#{flag} selectable", for: radio_id
          [
            radio, label(radio_id, flag, label_options)
          ].join.html_safe
        }.join.html_safe
      end
    end
  end
end
