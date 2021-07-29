require 'digest/sha2'

class Shortener
  attr_accessor :url

  def initialize(url)
    @url = url 
  end

  def generate_short_link
    link = search_slug_code
    link.nil? ? Link.create(original_url: url, slug: slug_generator_code) : nil
  end

  def search_slug_code
    Link.find_by_slug(slug_generator_code)
  end

  def slug_generator_code
    random_code = Digest::SHA256.hexdigest(url)[0..8]
    print(random_code)
    random_code
  end

end
