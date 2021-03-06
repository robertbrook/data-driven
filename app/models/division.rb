class Division < QueryObject
  include Vocabulary

  def self.all
      result = self.query("
      PREFIX parl: <http://data.parliament.uk/schema/parl#>
      PREFIX dcterms: <http://purl.org/dc/terms/>
      CONSTRUCT {
        ?division dcterms:title ?title .
      }
      WHERE { 
        ?division
          a parl:Division ;
          dcterms:title ?title .
      }")

    divisions = result.map do |statement| 
      {
        :id => self.get_id(statement.subject),
        :title => statement.object.to_s
      }
    end

    hierarchy = {
      :divisions => divisions
    }

    { :graph => result, :hierarchy => hierarchy }
  end

 def self.find(uri)
    result = self.query("
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX dcterms: <http://purl.org/dc/terms/>
      PREFIX parl: <http://data.parliament.uk/schema/parl#>
      CONSTRUCT {
        <#{uri}> 
          dcterms:title ?title ;
          dcterms:description ?description ;
          dcterms:date ?date ;
          parl:house ?house .
        ?house
          rdfs:label ?house_label .
      }
      WHERE { 
        <#{uri}> 
          dcterms:title ?title ;
          dcterms:description ?description ;
          dcterms:date ?date ;
          parl:house ?house .
        ?house
          rdfs:label ?house_label .
      }")

      title_pattern = RDF::Query::Pattern.new(
        RDF::URI.new(uri),
        Dcterms.title,
        :title)
      description_pattern = RDF::Query::Pattern.new(
        RDF::URI.new(uri),
        Dcterms.description,
        :description)
      date_pattern = RDF::Query::Pattern.new(
        RDF::URI.new(uri),
        Dcterms.date,
        :date)
      house_pattern = RDF::Query::Pattern.new(
        RDF::URI.new(uri),
        Parl.house,
        :house)

      title = result.first_literal(title_pattern)
      description = result.first_literal(description_pattern)
      date = result.first_literal(date_pattern)
      house = result.first_object(house_pattern)

      p house

      house_label_pattern = RDF::Query::Pattern.new(
        house,
        Rdfs.label,
        :label)
      house_label = result.first_literal(house_label_pattern)

      hierarchy = result.map do |statement| 
      {
        :id => self.get_id(statement.subject),
        :title => title.to_s,
        :description => description.to_s,
        :date => date.to_s.to_datetime,
        :house => {
          :id => self.get_id(house),
          :label => house_label.to_s
        }
      }
    end.first

    { :graph => result, :hierarchy => hierarchy }
  end

  def self.find_by_house(house_uri)
    result = self.query("
      PREFIX parl: <http://data.parliament.uk/schema/parl#>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX dcterms: <http://purl.org/dc/terms/>     
      CONSTRUCT {
         ?division 
           dcterms:title ?title .
         ?house
           rdfs:label ?label .
      }
      WHERE { 
        ?house rdfs:label ?label .

        OPTIONAL {
          ?division 
            a parl:Division;
            parl:house ?house;
            dcterms:title ?title .
        }

        FILTER(?house = <#{house_uri}>)
      }")

    house_label_pattern = RDF::Query::Pattern.new(
      RDF::URI.new(house_uri),
      Rdfs.label,
      :house_label)
    divisions_pattern = RDF::Query::Pattern.new(
      :division,
      Dcterms.title,
      :title)


    house_label = result.first_literal(house_label_pattern).to_s
    divisions = result.query(divisions_pattern).map do |statement| 
      {
        :id => self.get_id(statement.subject),
        :title => statement.object.to_s
      }
    end

    hierarchy = {
      :id => self.get_id(house_uri),
      :house_label => house_label,
      :divisions => divisions
    }

    { :graph => result, :hierarchy => hierarchy }
  end

  def self.find_by_concept(concept_uri)
    result = self.query("
      PREFIX parl: <http://data.parliament.uk/schema/parl#>
      PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
      PREFIX dcterms: <http://purl.org/dc/terms/>     

      CONSTRUCT {
          ?concept 
              skos:prefLabel ?label .
          ?division 
              dcterms:title ?title .
      }
      WHERE { 
          ?concept skos:prefLabel ?label .

          OPTIONAL{
              ?division 
                  a parl:Division;
                  dcterms:subject ?concept ;
                  dcterms:title ?title .
          }
          
          FILTER(?concept = <#{concept_uri}>)
      }")

    concept_label_pattern = RDF::Query::Pattern.new(
      RDF::URI.new(concept_uri),
      Skos.prefLabel,
      :concept_label)
    divisions_pattern = RDF::Query::Pattern.new(
      :division,
      Dcterms.title,
      :title)


    concept_label = result.first_literal(concept_label_pattern)
    
    divisions = result.query(divisions_pattern).map do |statement| 
      {
        :id => self.get_id(statement.subject),
        :title => statement.object.to_s
      }
    end

    hierarchy = {
      :id => self.get_id(concept_uri),
      :concept_label => concept_label,
      :divisions => divisions
    }

    { :graph => result, :hierarchy => hierarchy }
  end

end