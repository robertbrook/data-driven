class Concept

  include Tripod::Resource

  rdf_type 'http://www.w3.org/2004/02/skos/core#Concept'

  field :label, 'http://www.w3.org/2004/02/skos/core#prefLabel'

  linked_from :questions, :subject, class_name: 'Question'

  def id
  	self.uri.to_s.split("/").last
  end

end