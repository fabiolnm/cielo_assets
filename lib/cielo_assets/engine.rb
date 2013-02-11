module CieloAssets
  class Engine < ::Rails::Engine
    isolate_namespace CieloAssets

    initializer 'cielo_assets.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper CieloAssets::ApplicationHelper
      end
    end
  end
end
