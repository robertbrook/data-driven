class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    data = {
      :hierarchy => {
        :houses => url_for(controller: 'houses'),
        :concepts => url_for(controller: 'concepts'),
        :oralQuestions => url_for(controller: 'oral_questions'),
        :writtenQuestions => url_for(controller: 'written_questions'),
        :divisions => url_for(controller: 'divisions'),
        :people => url_for(controller: 'people')
      }
    }

    format(data)
  end

  protected
  def resource_uri(id)
    "http://id.ukpds.org/#{id}"
    # "http://data.parliament.uk/resource/#{id}"
  end

  def format(data)
    respond_to do |format|
      format.html
      format.any(:xml, :json) { render request.format.to_sym => data[:hierarchy] }

      format.rdf {
        result = ""
        data[:graph].each_statement do |statement|
          result << RDF::NTriples::Writer.serialize(statement)
        end

        render :text => result
      }
    end
  end

end

