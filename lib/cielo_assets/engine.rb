module CieloAssets
  class Engine < ::Rails::Engine
    isolate_namespace CieloAssets

    initializer 'cielo_assets.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper CieloAssets::FormHelper
      end
    end
  end

  # Monkey patches FormBuilder
  class ActionView::Helpers::FormBuilder
    def cielo_controls method, options={}
      options.merge! object: @object
      @template.cielo_controls @object_name, method, options
    end
  end
end
