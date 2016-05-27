class MembersController < ApplicationController

	def index
		uri = "http://data.parliament.uk/resource/#{params[:concept_id]}"
		#concept = Concept.find(uri)
		question = Question.where(subjectId: uri)
		render :text => question
		#@members = concept.questions.map{ |q| q.tablingMember }.uniq
	end

end