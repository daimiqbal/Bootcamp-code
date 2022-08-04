require 'timeout'
require "csv"

file = CSV.parse(File.read("problems.csv"))

def ask_question(question, answer, timer_answer)
  puts "\n QUESTION???"
  puts question
  Timeout::timeout(timer_answer) do
    user_ans = gets.chomp
    return user_ans === answer
  end
rescue Timeout::Error
  return false
end

timer_answer = 5
score = 0

for a in 0..file.length-1 do
    correct = ask_question(file[a][0], file[a][1], timer_answer)
    score += 1 if correct
end

puts "Total Questions: #{file.length}"
puts "Correct Answers: #{score}"
