module Vocabulary
	class Skos
		@@prefix = 'http://www.w3.org/2004/02/skos/core#'

		def self.prefLabel
			RDF::URI.new("#{@@prefix}prefLabel")
		end

		def self.Concept
			RDF::URI.new("#{@@prefix}Concept")
		end
	end
	
	class Schema
		@@prefix = 'http://schema.org/'
		
		def self.name
			RDF::URI.new("#{@@prefix}name")
		end

		def self.Person
			RDF::URI.new("#{@@prefix}Person")
		end

		def self.text
			RDF::URI.new("#{@@prefix}text")
		end

		def self.label
			RDF::URI.new("#{@@prefix}label")
		end

		def self.startDate
			RDF::URI.new("#{@@prefix}startDate")
		end

		def self.endDate
			RDF::URI.new("#{@@prefix}endDate")
		end
	end
	
	class Dcterms
		@@prefix = 'http://purl.org/dc/terms/'

		def self.subject
			RDF::URI.new("#{@@prefix}subject")
		end

		def self.date
			RDF::URI.new("#{@@prefix}date")
		end

		def self.title
			RDF::URI.new("#{@@prefix}title")
		end

		def self.description
			RDF::URI.new("#{@@prefix}description")
		end
	end
	
	class Parl
 
		@@prefix = 'http://data.parliament.uk/schema/parl#'

		def self.OralParliamentaryQuestion
			RDF::URI.new("#{@@prefix}OralParliamentaryQuestion")
		end

		def self.WrittenParliamentaryQuestion
			RDF::URI.new("#{@@prefix}WrittenParliamentaryQuestion")
		end

		def self.WrittenParliamentaryAnswer
			RDF::URI.new("#{@@prefix}WrittenParliamentaryAnswer")
		end

		def self.member
			RDF::URI.new("#{@@prefix}member")
		end

		def self.house
			RDF::URI.new("#{@@prefix}house")
		end

		def self.count
			RDF::URI.new("#{@@prefix}count")
		end

		def self.voteValue
			RDF::URI.new("#{@@prefix}voteValue")
		end

		def self.divisionTitle
			RDF::URI.new("#{@@prefix}divisionTitle")
		end

		def self.division
			RDF::URI.new("#{@@prefix}division")
		end

		def self.houseLabel
			RDF::URI.new("#{@@prefix}houseLabel")
		end

		def self.questionMemberName
			RDF::URI.new("#{@@prefix}questionMemberName")
		end

		def self.answerMemberName
			RDF::URI.new("#{@@prefix}answerMemberName")
		end

		def self.question
			RDF::URI.new("#{@@prefix}question")
		end

		def self.questionText
			RDF::URI.new("#{@@prefix}questionText")
		end				

		def self.questionDate
			RDF::URI.new("#{@@prefix}questionDate")
		end

		def self.answerText
			RDF::URI.new("#{@@prefix}answerText")
		end

		def self.answerDate
			RDF::URI.new("#{@@prefix}answerDate")
		end

		def self.committeeName
			RDF::URI.new("#{@@prefix}committeeName")
		end

		def self.personName
			RDF::URI.new("#{@@prefix}personName")
		end

		def self.membershipType
			RDF::URI.new("#{@@prefix}membershipType")
		end

		def self.committee
			RDF::URI.new("#{@@prefix}committee")
		end

		def self.CommitteeChair
			RDF::URI.new("#{@@prefix}CommitteeChair")
		end

		def self.CommitteeMember
			RDF::URI.new("#{@@prefix}CommitteeMember")
		end

		def self.CommitteeAdviser
			RDF::URI.new("#{@@prefix}CommitteeAdviser")
		end

		def self.score
			RDF::URI.new("#{@@prefix}score")
		end

		def self.Division
			RDF::URI.new("#{@@prefix}Division")
		end

		def self.Committee
			RDF::URI.new("#{@@prefix}Committee")
		end

		def self.oralQuestionCount
			RDF::URI.new("#{@@prefix}oralQuestionCount")
		end

		def self.writtenQuestionCount
			RDF::URI.new("#{@@prefix}writtenQuestionCount")
		end

		def self.writtenAnswerCount
			RDF::URI.new("#{@@prefix}writtenAnswerCount")
		end

		def self.divisionCount
			RDF::URI.new("#{@@prefix}divisionCount")
		end

		def self.peopleCount
			RDF::URI.new("#{@@prefix}peopleCount")
		end

		def self.voteCount
			RDF::URI.new("#{@@prefix}voteCount")
		end

		def self.membershipCount
			RDF::URI.new("#{@@prefix}membershipCount")
		end

		def self.label
			RDF::URI.new("#{@@prefix}label")
		end
	end
	
	class Rdfs
		@@prefix = 'http://www.w3.org/2000/01/rdf-schema#'

		def self.label
			RDF::URI.new("#{@@prefix}label")
		end
	end

	class Rdf
		@@prefix = 'http://www.w3.org/1999/02/22-rdf-syntax-ns#'

		def self.type
			RDF::URI.new("#{@@prefix}type")
		end
	end
end
