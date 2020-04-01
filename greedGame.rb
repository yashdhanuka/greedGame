require ('./players.rb')


puts "Enter number of players: "
no_of_players = gets.chomp.to_i
players = Players.new(no_of_players)
max_score = 0
round = 1

while(max_score<1000)
    puts "Round #{round}"
    puts "-----------------------------------------------------"
    for i in 1..no_of_players
     players.play(i)
    end
    max_score = players.getTotal.max
    round+=1
    puts "total score of all players: #{players.getTotal}"
end
top_player = players.get_maxScore
puts "top player: #{top_player}"
puts "Final Round"
    puts "-----------------------------------------------------"
    for i in 1..no_of_players
       if i == top_player
        next
       end
     players.play(i)
    end

players.winner
