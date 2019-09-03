defmodule Vampire.Server  do 
use GenServer
#Code.require_file("Vam.ex")

def start_link(state \\[]) do
    GenServer.start_link(__MODULE__, state , name: :vampire)
end





def init(state) do
    
    {:ok, state}
end

def fetch(pid) do  
    GenServer.call(pid, :fetch)
end



#def handle_cast({:add, item}, queue) do
 #   {:noreply, :queue.in(item, queue)}
#end

def checkvampire(pid, item1, item2) do

    GenServer.call(pid, {:checkvampire, item1, item2} )
end

def handle_call({:checkvampire, item1, item2}, _from,item) do
    totalConcurrentTasks = 8

    numbers = Enum.to_list(item1..item2)

    Enum.chunk_every(numbers, totalConcurrentTasks) 
    |> Enum.map(fn(numberList) -> Task.async(fn -> vampires(numberList) end) end)


    {:reply, item+1,item+1}
end

defp vampires (numberList) do


    Enum.each(numberList, fn x -> 
    case checkVampire1(x) do
    [] -> {:ok}
    result -> 
    msg = "#{x}"
   # IO.write x
    #Enum.each(result , fn {a,b} -> IO.write  " #{a} " <> "#{b}"  end ) 
     IO.puts Enum.reduce(result , msg,fn ({a,b}  , msg) -> msg <> " #{a} " <> "#{b}"   end ) 
    

    end end )

end


defp factors(number) do
        noOfDigitis = length(Integer.digits(number))
        
            start = :math.pow(10,noOfDigitis/2 -1 ) |> round
            last = :math.sqrt(number) |> round
            #IO.puts "#{start}" <> "#{last}"
            for i <- (start..last), rem(number,i) == 0, do: {i,div(number,i)}
         
end



defp checkVampire1(number) do
        noOfDigitis = length(Integer.digits(number))
       # IO.inspect "r"
        if(rem(noOfDigitis,2) != 0) do
            []
        else
            #IO.inspect FindVampire.factors(number)
            Enum.filter( factors(number) , fn {a,b} -> 
            length(Integer.digits(a)) == length(Integer.digits(number) )/2 && 
            length(Integer.digits(b)) == length(Integer.digits(number) )/2 &&
            !(rem(a,10) == 0 && rem(b,10) == 0) && length((Integer.digits(a) ++  Integer.digits(b)) -- Integer.digits(number))  == 0 
             end)
        end
end




end


number1 = 1000
number2 = 2000000
{:ok, pid} = Vampire.Server.start_link(16758243290880)

#Vampire.Server.add(pid, "item-1")
#IO.puts Vampire.Server.length1(pid)
#Vampire.Server.add(pid, "item-2")
#Vampire.Server.length1(pid)
# = 1260
#IO.write numbers

#{ok, Tracer} = fprof: profile(start),
#fprof: trace([start, {tracer, Tracer}]),
Vampire.Server.checkvampire(pid,number1, number2)

#fprof: trace(stop);

