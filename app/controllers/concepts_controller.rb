class ConceptsController < ApplicationController

	def index
		uri = "http://data.parliament.uk/resource/#{params[:member_id]}"
		member = Person.find(uri)
		@concepts = member.questionsTabled.map{ |q| q.subject }.uniq
	end

end