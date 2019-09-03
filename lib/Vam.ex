defmodule FindVampire do

    def factors(number) do
        noOfDigitis = length(Integer.digits(number))
        
            start = :math.pow(10,noOfDigitis/2 -1 ) |> round
            last = :math.sqrt(number) |> round
            #IO.puts "#{start}" <> "#{last}"
            for i <- (start..last), rem(number,i) == 0, do: {i,div(number,i)}
         
    end


    
    def checkVampire(number) do
        noOfDigitis = length(Integer.digits(number))
        if(rem(noOfDigitis,2) != 0) do
            []
        else
            #IO.inspect FindVampire.factors(number)
            Enum.filter( FindVampire.factors(number) , fn {a,b} -> 
            length(Integer.digits(a)) == length(Integer.digits(number) )/2 && 
            length(Integer.digits(b)) == length(Integer.digits(number) )/2 &&
            !(rem(a,10) == 0 && rem(b,10) == 0) && length((Integer.digits(a) ++  Integer.digits(b)) -- Integer.digits(number))  == 0 
             end)
        end
    end
end



#IO.inspect FindVampire.checkVampire(104260)
