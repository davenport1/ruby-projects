#  Implement a method #substrings that takes a word as the first argument 
#  and then an array of valid substrings (your dictionary) as the second argument. 
#  It should return a hash listing each substring (case insensitive) that was 
#  found in the original string and how many times it was found.

def substrings(string_input, dictionary)
    hash_result = Hash.new
    down_input = string_input.downcase

    dictionary.each do |word|
        if down_input.include?(word.downcase)
            if hash_result.has_key?(word)
                hash_result[word] = (hash_result[word] + 1)
            else
                hash_result.store(word, 1)
            end
        end
    end
    return hash_result
end




dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#  => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
#  => { "below" => 1, "low" => 1 }

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
#  => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
