class RpcRequest < ActiveRecord::Base
  attr_accessible :methodName, :params, :option_id
  attr_accessor :option_id
end
