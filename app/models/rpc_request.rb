class RpcRequest < ActiveRecord::Base
  attr_accessible :methodName, :params
end
