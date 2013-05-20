require_relative 'cyclic_tag_rule'

class TagRule < Struct.new(:first_character, :append_characters)
  def applies_to?(string)
    string.chars.first == first_character
  end

  def follow(string)
    string + append_characters
  end

  def alphabet
    ([first_character] + append_characters.chars.entries).uniq
  end

  def to_cyclic(encoder)
    CyclicTagRule.new(encoder.encode_string(append_characters))
  end
end
