require ('./score.rb')

class Players < Score
    @@tc = 0
    @@num = []
    def initialize(players=1)
        @players = players
        @tc = Array.new(players,0)
    end
    def play(i,no_of_dice=5)
        @input = "n"
      @@num = random_numbers(no_of_dice)
      puts "\nPlayer #{i} rolls: #{@@num}"
      sc = score(@@num)
      puts "Score in this round: #{sc}"
      return "no more chance" if sc == 0
      @@tc = total_score(i-1,sc)
      puts "total score: #{@@tc}"
      
      rem = non_scored_dice(@@num)
      puts rem
      if rem!=0
        puts "Do you want to roll the non-scoring #{rem} dices?(y/n): "
        @input = gets.chomp
      end
      if @input =="y"
        play(i,rem)
      end
    end
    def total_score(i,num)
        @tc[i] += num
    end
    def winner
        puts " score: #{@tc}"
        index = @tc.rindex(@tc.max)
        puts "The Winner is: player #{index+1}"
    end
    def getTotal
        @tc
    end
end



