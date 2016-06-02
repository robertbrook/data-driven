class Concept
  include Tripod::Resource

  rdf_type 'http://www.w3.org/2004/02/skos/core#Concept'

  field :label, 'http://www.w3.org/2004/02/skos/core#prefLabel'
  linked_from :writtenQuestions, :subjects, class_name: 'WrittenQuestion', multivalued: true

  def id 
  	self.uri.to_s.split("/").last
  end

  def self.most_popular_by_question
  	Concept.find_by_sparql("PREFIX dcterms: <http://purl.org/dc/terms/>
						SELECT ?uri
						WHERE {
						    ?question dcterms:subject ?uri
						}
						GROUP BY ?uri
						ORDER BY DESC(COUNT(?question))
						LIMIT 50
						")
  end

  def self.most_popular_by_question_for_tabling_member(person_uri)
  	Concept.find_by_sparql("PREFIX dcterms: <http://purl.org/dc/terms/>
						PREFIX parl: <http://data.parliament.uk/schema/parl#>
						SELECT ?uri
						WHERE {
						    ?question dcterms:subject ?uri;
						    parl:tablingMember <#{person_uri}> .
						}
						GROUP BY ?uri
						ORDER BY DESC(COUNT(?question))
						LIMIT 100
						")
  end

end