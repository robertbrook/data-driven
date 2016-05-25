class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index

  	# render :text => "hello world controller"

  	# kirsty = Person.find('http://data.parliament.uk/members/4355')
  	# kirsty = Person.first
  	# kirsty = Person.where(:name => 'Earl of Oxford and Asquith').first
  	# kirsty = Person.all.limit(1)
  	# kirsty = Person.count
  	# kirsty = Person.where(p => p.hasRegisteredInterests.any(ri => ri.name == ''))
  	# kirsty = Person.where(:hasRegisteredInterests => .any? { |e|  })

  	# render :text => kirsty.resources[0]
  	# render :text => kirsty.hasRegisteredInterests.first.belongsTo

  	topic = Concept.find('http://data.parliament.uk/resource/96680000-0000-0000-0000-000000000002')
    questions = topic.questions
    members = questions.map{ |q| q.tablingMember }

    #render :text => questions
    render :text => members[7]


    member = Person.find('http://data.parliament.uk/resource/34530000-0000-0000-0000-000000000001')
    #questions = member.questionsTabled.resources
    topics = member.questionsTabled.map{ |q| q.subject }

    #render :text => questions.first
    #render :text => topics.first
  end
end

class Person

  include Tripod::Resource

  rdf_type 'http://schema.org/Person'

  field :name, 'http://schema.org/name'
  field :image, 'http://schema.org/image'

  linked_from :questionsTabled, :tablingMember, class_name: 'Question'

end

class Question

  include Tripod::Resource

  rdf_type 'http://data.parliament.uk/schema/parl#WrittenParliamentaryQuestion'

  linked_to :tablingMember, 'http://data.parliament.uk/schema/parl#tablingMember', class_name: 'Person'
  linked_to :subject, 'http://purl.org/dc/terms/subject', class_name: 'Concept'

end

class Concept

  include Tripod::Resource

  rdf_type 'http://www.w3.org/2004/02/skos/core#Concept'

  field :label, 'http://www.w3.org/2004/02/skos/core#prefLabel'

  linked_from :questions, :subject, class_name: 'Question'

end

# class Person
# 	include Tripod::Resource

# 	rdf_type 'http://schema.org/Person'

# 	field :name, 'http://schema.org/name'
#   field :party, 'http://data.parliament.uk/schema/parl#party'

#   linked_to :hasRegisteredInterests, 'http://data.parliament.uk/schema/parl#hasRegisteredInterest', class_name: 'RegisteredInterest', multivalued: true
# end

# class RegisteredInterest
# 	include Tripod::Resource

# 	rdf_type 'http://data.parliament.uk/schema/parl#RegisteredInterest'

# 	field :name, 'http://data.parliament.uk/schema/parl#registeredInterest'

# 	linked_from :belongsTo, :hasRegisteredInterests, class_name: 'Person'
# end



