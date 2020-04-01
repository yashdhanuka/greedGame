class Score
    def score(dice)
        @score = 0
        return @score = 0 if(dice == [] || dice == nil)
        dice.sort!
        return @score = 1000 + score(dice[3..-1]) if(dice[0..2] == [1,1,1]) #[1,1,1,1,3]
        return @score = 600 + score(dice[3..-1]) if(dice[0..2] == [6,6,6])
        return @score = 500 + score(dice[3..-1]) if(dice[0..2] == [5,5,5])
        return @score = 400 + score(dice[3..-1]) if(dice[0..2] == [4,4,4])
        return @score = 300 + score(dice[3..-1]) if(dice[0..2] == [3,3,3])
        return @score = 200 + score(dice[3..-1]) if(dice[0..2] == [2,2,2])
        return @score = 100 + score(dice[1..-1]) if(dice[0] == 1)
        return @score = 50 + score(dice[1..-1]) if(dice[0] == 5)
        return @score = 0 + score(dice[1..-1]);
    end

    def non_scored_dice(ar)
        @count = 0
        if ar.count(2)<=2
            @count += ar.count(2)
        end
        if ar.count(3)<=2
            @count += ar.count(3)
        end
        if ar.count(4)<=2
            @count += ar.count(4)
        end
        if ar.count(6)<=2
            @count += ar.count(6)
        end
        return @count
    end

    def random_numbers(num=5)
        Array.new(num) { rand (1..6) }
    end

end

