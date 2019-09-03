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

def checkvampire(pid, item) do

    GenServer.call(pid, {:checkvampire, item} )
end

def handle_call({:checkvampire, item}, _from,item) do
    
    {:reply, checkVampire1(item), item+1}
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

numbers = Enum.to_list(16758243290880..24959017348650)
{:ok, pid} = Vampire.Server.start_link(16758243290880)

#Vampire.Server.add(pid, "item-1")
#IO.puts Vampire.Server.length1(pid)
#Vampire.Server.add(pid, "item-2")
#Vampire.Server.length1(pid)
# = 1260
#IO.write numbers

Enum.each(numbers, fn x -> 
case Vampire.Server.checkvampire(pid,x) do
[] -> {:ok}
result -> 
IO.write x
Enum.each(result , fn {a,b} -> IO.write  " #{a} " <> "#{b}"  end ) 
IO.puts ""

 end end)
