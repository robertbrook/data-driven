class QueryObject

	def self.client
		SPARQL::Client.new(DataDriven::Application.config.database)
	end

end