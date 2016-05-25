class Question

  include Tripod::Resource

  rdf_type 'http://data.parliament.uk/schema/parl#WrittenParliamentaryQuestion'

  linked_to :tablingMember, 'http://data.parliament.uk/schema/parl#tablingMember', class_name: 'Person'
  linked_to :subject, 'http://purl.org/dc/terms/subject', class_name: 'Concept'

end