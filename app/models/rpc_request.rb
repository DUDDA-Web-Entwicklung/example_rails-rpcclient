class RpcRequest < ActiveRecord::Base
  attr_accessible :methodName, :params, :option_id, :option_value, :response, :methodResponse, :methodRequest

  def option_id
    @option_id
  end

  def option_id=(arg)
    @option_id = arg
  end

  def option_value
    @option_value
  end

  def option_value=(arg)
    @option_value = arg
  end
end
