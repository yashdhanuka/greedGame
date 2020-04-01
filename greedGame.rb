require ('./players.rb')


puts "Enter number of players: "
no_of_players = gets.chomp.to_i
players = Players.new(no_of_players)
max_score = 0
round = 1

while(max_score<3000)
    puts "Round #{round}"
    puts "-----------------------------------------------------"
    for i in 1..no_of_players
     players.play(i)
    end
    max_score = players.getTotal.max
    round+=1
end

puts "Final Round"
    puts "-----------------------------------------------------"
    for i in 1..no_of_players
     players.play(i)
    end

players.winner
