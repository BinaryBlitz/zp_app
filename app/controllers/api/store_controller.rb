class API::StoreController < API::APIController
  skip_before_action :restrict_access!, only: [:show]

  def show
    @store = Store.new
  end
end
