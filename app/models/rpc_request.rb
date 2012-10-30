class RpcRequest < ActiveRecord::Base
  attr_accessible :methodName, :params, :option_id

  def option_id
  	@option_id
  end

  def option_id=(arg)
  	@option_id = arg
  end
end
