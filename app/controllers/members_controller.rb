class MembersController < ApplicationController

	def index
		concept_uri = "http://data.parliament.uk/resource/#{params[:concept_id]}"
		# @members = concept.questions.map{ |q| q.tablingMember }.uniq
		@members = Person.find_by_sparql("SELECT DISTINCT ?uri WHERE {?question <http://data.parliament.uk/schema/parl#tablingMember> ?uri ;
															    		  <http://purl.org/dc/terms/subject> <#{concept_uri}> .} LIMIT 100")
	end

end

