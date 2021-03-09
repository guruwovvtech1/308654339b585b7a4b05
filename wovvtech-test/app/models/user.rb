class User < ApplicationRecord

	def self.api_format
    self.distinct.collect { |e|
    	{
    		id: e.id,
    	  email: e.email,
    	  first_name: e.first_name,
    	  last_name: e.last_name
    	}
    }
	end

	def api_format
    	{
    		id: self.id,
    	  email: self.email,
    	  first_name: self.first_name,
    	  last_name: self.last_name
    	}
	end
end
