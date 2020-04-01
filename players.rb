require ('./score.rb')
require 'pry'

class Players < Score
    @@tc = 0
    @@num = []
    def initialize(players=1)
        @players = players
        @tc = Array.new(players,0)
        @counter = Array.new(players,0)
    end
    def play(i,no_of_dice=5)
        @input = "n"
      @@num = random_numbers(no_of_dice)
      puts "\nPlayer #{i} rolls: #{@@num}"
      sc = score(@@num)
      puts "Score in this round: #{sc}"
      return "no more chance" if sc == 0
      @@tc = total(i-1,sc)
      puts "total score of player#{i}: #{@@tc}"
      rem = non_scored_dice(@@num)
      puts "remaining dice: #{rem}"
      if rem!=0
        puts "Do you want to roll the non-scoring #{rem} dices?(y/n): "
        @input = gets.chomp
      end
      if @input =="y"
        play(i,rem)
      end
    end
    def winner
        puts " score: #{@tc}"
        index = @tc.rindex(@tc.max)
        puts "The Winner is: player #{index+1}"
    end
    def get_maxScore
        return @tc.rindex(@tc.max)+1
    end
    def getTotal
        @tc
    end
    def get_in_the_game(i,score)
        #binding.pry
        #puts "counter: #{@counter}"
        if score > 0 && @counter[i] >0
            @tc[i] += score
        end
        if @counter[i] == 0 && score >=300
            @counter[i] += 1
            @tc[i] += score
        end
    end
    def start(i,score)
        puts "counter: #{@counter}"
        if score >= 300
            @counter[i] +=1
        end
    end
    def total(i,score)
        start(i,score)
        if score>0 && @counter[i] > 0
            @tc[i] += score
        end
    end


end



