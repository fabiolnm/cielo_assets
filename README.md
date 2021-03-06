# CieloAssets

This project rocks and uses MIT-LICENSE.

## Sample

You can easily test this gem by:

  * Cloning this repository
  * Navigating to ``` test/dummy ``` directory
  * Running local server ``` rails s ```
  * Opening browser at ``` http://localhost:3000/cielo_assets ```

![Sample](https://raw.github.com/fabiolnm/cielo_assets/master/readme/sample.png)

## Usage

Add this gem to your Gemfile:

    gem 'cielo_assets'

Call ``` cielo_controls ``` helper method at your view:

    <%= cielo_controls :my_object, :field %>

This generates the following markup:

    <div class="horizontal" id="cielo_controls">
      <input id="my_object_field_amex" name="my_object[field]" type="radio" value="amex">
      <label class="amex" for="my_object_field_amex">Amex</label>

      <input id="my_object_field_diners" name="my_object[field]" type="radio" value="diners">
      <label class="diners" for="my_object_field_diners">Diners</label>

      <input id="my_object_field_elo" name="my_object[field]" type="radio" value="elo">
      <label class="elo" for="my_object_field_elo">Elo</label>

      <input id="my_object_field_mastercard" name="my_object[field]" type="radio" value="mastercard">
      <label class="mastercard" for="my_object_field_mastercard">Mastercard</label>

      <input id="my_object_field_mastercard_securecode" name="my_object[field]" type="radio" value="mastercard_securecode">
      <label class="mastercard_securecode" for="my_object_field_mastercard_securecode">Mastercard securecode</label>

      <input id="my_object_field_verified_by_visa" name="my_object[field]" type="radio" value="verified_by_visa">
      <label class="verified_by_visa" for="my_object_field_verified_by_visa">Verified by visa</label>

      <input id="my_object_field_visa" name="my_object[field]" type="radio" value="visa">
      <label class="visa" for="my_object_field_visa">Visa</label>
    </div>

To provide basic styles, just require cielo_assets at your manifest:

    /*
     *  ...
     *
     *= require cielo_assets
     *
     *  ...
     */

There are two basic styles available: Vertical and Horizontal.
See their definitions at ``` app/assets/stylesheets/cielo_assets/controls.css.scss ```.

Switching between styles can be done by providing the css class name as the second argument to the helper:

    <%= cielo_controls :my_object, :field, style: :vertical %>

This only changes the container class:

    <div class="vertical" id="cielo_controls">
      ...
    </div>

You can provide any arbitrary css class since you define it at your own application.

## FormBuilder Usage

    <%= form_for :my_object do |f| %>
      <%= f.cielo_controls :field %>
      <%= f.submit %>
    <% end %>

## Validation and FieldWithErrors workaround

When rails fields fails to validate, the corresponding field is surrounded by a div with field_with_errors
class. This breaks CieloAssets behavior, because it expects input and labels are adjacent, to highlight
the checked control:

    input {
      display: none;
      &:checked + label {
        border-color: #777;
      }
    }

To avoid this side effect, add
[this workaround](http://stackoverflow.com/questions/5267998/rails-3-field-with-errors-wrapper-changes-the-page-appearance-how-to-avoid-t)
on your project's ``` config/application.rb ```:

    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      if instance.object.respond_to? "disable_field_with_errors_for_#{instance.method_name}"
        html_tag.html_safe
      else
        "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
      end
    }

and declare the fields (via attr_reader or an empty method, for example)
that should not be surrounded by ``` field_with_errors ``` div when validation fails:

    # supposes attribute is named cielo_flag
    attr_accessible :cielo_flag

    attr_reader :disable_field_with_errors_for_cielo_flag

or

    # supposes attribute is named flag
    attr_accessible :flag

    def disable_field_with_errors_for_flag
    end
