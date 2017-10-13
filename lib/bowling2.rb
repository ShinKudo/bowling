class Bowling
    def initialize
        @total_score = 0
        @frame_score = Array.new(10,0)
        @bowl_count = 0
        @frame_count = 0
        @spare_flg = 0
    end
    
    def add_score(pins)
        @frame_score[@frame_count] += pins

        if @spare_flg == 1
            @frame_score[@frame_count - 1] += pins
            @spare_flg = 0
        end

        if @frame_score == 10
            @spare_flg = 1
        end

        @bowl_count +=1

        if @bowl_count == 2
            @bowl_count = 0
            @frame_score = 0
            @frame_count += 1
        end
    end
    
    def total_score
        @total_score
    end
    def calc_score
        @framescore.each {|score|
            @total_score += score
        }
    end
end