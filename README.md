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

    <%= cielo_controls 'test[0]' %>

This generates the following markup:

    <div class="horizontal" id="cielo_controls">
      <input id="test_0_amex" name="test[0]" type="radio" value="amex" />
      <label class="amex" for="test_0_amex">Amex</label>

      <input id="test_0_diners" name="test[0]" type="radio" value="diners" />
      <label class="diners" for="test_0_diners">Diners</label>

      <input id="test_0_elo" name="test[0]" type="radio" value="elo" />
      <label class="elo" for="test_0_elo">Elo</label>

      <input id="test_0_mastercard" name="test[0]" type="radio" value="mastercard" />
      <label class="mastercard" for="test_0_mastercard">Mastercard</label>

      <input id="test_0_mastercard_securecode" name="test[0]" type="radio" value="mastercard_securecode" />
      <label class="mastercard_securecode" for="test_0_mastercard_securecode">Mastercard Securecode</label>

      <input id="test_0_verified_by_visa" name="test[0]" type="radio" value="verified_by_visa" />
      <label class="verified_by_visa" for="test_0_verified_by_visa">Verified By Visa</label>

      <input id="test_0_visa" name="test[0]" type="radio" value="visa" />
      <label class="visa" for="test_0_visa">Visa</label>
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

    <%= cielo_controls 'test[0]', :vertical %>

This only changes the container class:

    <div class="vertical" id="cielo_controls">
      ...
    </div>

You can provide any arbitrary css class since you define it at your own application.
