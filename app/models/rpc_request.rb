class RpcRequest < ActiveRecord::Base
  attr_accessible :methodName, :params, :option_id
end
