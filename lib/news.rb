require 'httparty'

class News

  def all
    response['results'].map { |article| article['title'] }
  end

  def response
    HTTParty.get(url)
  end

  private

  def url
    "http://api.nytimes.com/svc/topstories/v1/#{section}.#{format}?api-key=#{key}"
  end

  def section
    'technology'
  end

  def key
    ENV['ny_times']
  end

  def format
    'json'
  end

end
