class MembersController < ApplicationController

	def index
		uri = "http://data.parliament.uk/resource/#{params[:concept_id]}"
		concept = Concept.find(uri)
		concept.eager_load_object_triples!
		@members = concept.questions.map{ |q| q.tablingMember }.uniq
	end

end