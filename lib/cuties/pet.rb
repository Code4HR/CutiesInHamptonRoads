class Pet

  attr_reader :id,
              :link,
              :name,
              :sex,
              :breed,
              :type,
              :desc,
              :pic,
              :city

  def initialize(attributes)
    @id    = attributes[:id]
    @breed = attributes[:breed]
    @desc  = attributes[:desc]
    @link  = attributes[:link]
    @name  = attributes[:name]
    @pic   = attributes[:pic]
    @sex   = attributes[:sex]
    @type  = attributes[:type]
    @city  = attributes[:city]
  end

  def breed_or_animal
    # If it's a rabbit or pig, mention that it's a rabbit or pig.
    # Otherwise, just list the breed.
    # 'Small & Furry' animals like mice & chinchillas
    # have their species in 'breed'

    return "#{breed} #{type.downcase}" if ['Rabbit', 'Pig'].include? type
    return breed.downcase if type == 'Small & Furry'
    breed
  end

  # Remove unnecessary words from breed for hash
  # Refactor with regex
  def sanitize_breed(breed)
    breed = breed.gsub('dog', '').gsub('cat', '').gsub('/', '').gsub('mix', '')
    breed
  end

  def hashtags
    sanitized = sanitize_breed(breed_or_animal)
    hashtags = [
      "#{sanitized}",
      "#{type.downcase}",
      "#{city}"
      ]
    return hashtags.map! { |h| "##{h.delete(' ')}" }.join(" ")
  end

  def message
    "#{name}, a #{sex} #{breed_or_animal}. #{hashtags} #{link}"
  end

  def error?
    # attributes['code']
  end
end
