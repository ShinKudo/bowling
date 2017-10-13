require "pry"

class Bowling
    def initialize
        @total_score = 0
        @frame_score = Array.new(10,0)
        @bowl_count = 0
        @frame_count = 0
        @strike_flg = 0
        @spare_flg = 0
        @double_flg = 0
    end
    
    def add_score(pins)

        @bowl_count +=1
        @frame_score[@frame_count] += pins

        if @spare_flg == 1
            @frame_score[@frame_count - 1] += pins
            @spare_flg = 0
        end

        if @strike_flg > 0
            @frame_score[@frame_count - 1] += pins
            @strike_flg -= 1
        end

        if @double_flg == 1
            @frame_score[@frame_count - 2] += pins
            @double_flg = 0
        end
        
        if @bowl_count == 1 && @frame_score[@frame_count] == 10
            if @strike_flg == 1
                @double_flg = 1
            end
            @strike_flg = 2
            @bowl_count = 0
            @frame_count += 1
        end

        if @bowl_count == 2 && @frame_score[@frame_count] == 10
            @spare_flg = 1
        end

        if @bowl_count == 2
            @bowl_count = 0
            @frame_count += 1
        end

    end
    
    def total_score
        @total_score
    end

    def calc_score
        @total_score = @frame_score.inject(:+)
    end

    def frame_score(frame)
        @frame_score[frame-1]
    end
end