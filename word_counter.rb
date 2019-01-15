# YOUR CODE HERE
require 'pry'

text_file = ARGV[0]
words_count = ARGV[1]

if ARGV.size > 1
  puts "There are #{words_count} words "
  word_rank = {}

  File.open(text_file, "r") do |file|
    data = file.read
    sanitized_data = data.gsub(/[,.!?;:*&"-]/, '').downcase

    words = sanitized_data.split
    words.each do |word|
      if word_rank[word]
        word_rank[word] += 1
      else
        word_rank[word] = 1
      end
    end
  end

  word_count_order = word_rank.sort_by { |key, value| -1*value }

  i = 0
  (0..(words_count.to_i-1)).to_a.each do |index|

    i += 1
    puts " #{i}. #{word_count_order[index][0]}: #{word_count_order[index][1]}"
  end
  # binding.pry
else
  raise "Expecting two inputs. received #{ARGV.length} input(s)"
end

# binding.pry
# File.open("stop_words.txt", "r") do |file|
#   data = file.read
#   stop_words = data.split
#
#   stop_words.each do |stop_word|
#     if word_rank[stop_word]
#         word_rank[stop_word] = 0
#     end
#   end
# end
