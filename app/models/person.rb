class Person

  include Tripod::Resource

  rdf_type 'http://schema.org/Person'

  field :name, 'http://schema.org/name'
  field :image, 'http://schema.org/image'

  linked_from :questionsTabled, :tablingMember, class_name: 'Question'

  def id
  	self.uri.to_s.split("/").last
  end
end