class RpcRequest < ActiveRecord::Base
  attr_accessible :methodName, :params, :option_id, :option_name, :response, :methodResponse, :methodRequest

  def option_id
  	@option_id
  end

  def option_id=(arg)
  	@option_id = arg
  end
  
  def option_name
  	@option_name
  end

  def option_name=(arg)
  	@option_name = arg
  end
end
