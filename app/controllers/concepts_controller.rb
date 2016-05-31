class ConceptsController < ApplicationController

	def index
		member_uri = "http://data.parliament.uk/resource/#{params[:member_id]}"
		@concepts = Concept.find_by_sparql("SELECT DISTINCT ?uri WHERE { ?question <http://purl.org/dc/terms/subject> ?uri ;
																				  <http://data.parliament.uk/schema/parl#tablingMember> <#{member_uri}> . }")
	end

end
