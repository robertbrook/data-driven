class MembersController < ApplicationController

	def index
		uri = "http://data.parliament.uk/resource/#{params[:concept_id]}"
		p uri
		concept = Concept.find(uri)
		@members = concept.questions.map{ |q| q.tablingMember }.uniq
	end

end