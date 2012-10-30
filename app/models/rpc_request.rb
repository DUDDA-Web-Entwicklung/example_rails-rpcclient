class RpcRequest < ActiveRecord::Base
  attr_accessible :methodName, :params, :option_id, :response, :methodResponse, :methodRequest

  def option_id
  	@option_id
  end

  def option_id=(arg)
  	@option_id = arg
  end
end
