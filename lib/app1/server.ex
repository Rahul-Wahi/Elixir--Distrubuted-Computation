defmodule App1.Server  do 
use GenServer
#Code.require_file("Vam.ex")

def start_link(state \\[]) do
    GenServer.start_link(__MODULE__, state , name:  __MODULE__)
end





def init(state) do
    
    
    {:ok, state}
end



def get() do  
  
    GenServer.call(__MODULE__, :get, 100000000)
end

def handle_call(:get, _from, state) do
  
  {:reply,state, state , 100000}
end



#def handle_cast({:add, item}, queue) do
 #   {:noreply, :queue.in(item, queue)}
#end

def checkvampire(item1, item2) do

    
    GenServer.cast(__MODULE__, {:checkvampire, item1, item2} )
end

def handle_cast({:checkvampire, item1, item2},state) do
   totalConcurrentTasks = 1200
    #IO.puts "sds"
    #IO.puts item2
    numbers = Enum.to_list(item1..item2)
  #IO.puts item2
  

    
#IO.inspect vampires([1260,1260])


    {:noreply,state ++ buildresult(numbers , totalConcurrentTasks)  }
end

defp buildresult(numbers , totalConcurrentTasks) do

  Enum.chunk_every(numbers, totalConcurrentTasks) 
  #|> Enum.map(fn(numberList) ->  vampires(numberList)  end)
  |> Enum.map(fn(numberList) -> Task.async(fn -> vampires(numberList) end) end)
  |>Enum.map(fn(task) -> Task.await(task) end)
 #|> Enum.map(fn(numberList) ->   vampires(numberList)  end)
  |>Enum.filter( fn(x) -> x != [] end)
 

end


 # handle_info/2 receives generic messages from the Task processes
  #def handle_info({_task, {:ok, result}}, state) do
   # IO.puts("#{inspect(result)} Job Done.")
    #{:noreply, state}
  #end

# Once the task finised successfully, it exits normally.
# This handle_info function responds to this message.
#def handle_info({:EXIT, _pid, :normal}, state) do
   # Do some book keeping
 #  IO.puts("The task exited and finished normally")

  # {:noreply, state} 
#end

# Finally, when the task, the caller receives a DOWN message.
# In this case the caller was the GenServer.
#def handle_info({:DOWN, _ref, :process, _pid, :normal}, state) do
  # Do some book keeping one the task goes down
#  IO.puts(state.msg)

 # {:noreply, state}
#end

defp vampires (numberList) do
  
  #IO.inspect numberList
    _resList = []
   

    
    #for n <- numberList,

       #  res <- Enum.flat_map(checkVampire1(n) , fn {x,y} -> [x,y] end) ,  do:    [n] ++ res  
    


    Enum.map(numberList, fn n ->
        
        case Enum.flat_map(checkVampire1(n) , fn {x,y} -> [" #{x}"," #{y}"] end) do
            [] -> []
            result -> ["#{n}"] ++ result
       end end ) 
       |> Enum.filter(fn x -> length(x) >0 end)
    
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
        #IO.inspect "r"
        if(rem(noOfDigitis,2) != 0) do
            []
        else
            #IO.inspect FindVampire.factors(number)
            Enum.filter( factors(number) , fn {a,b} -> 
            length(Integer.digits(a)) == length(Integer.digits(number) )/2 && 
            length(Integer.digits(b)) == length(Integer.digits(number) )/2 &&
            !(rem(a,10) == 0 && rem(b,10) == 0) && length((Integer.digits(a) ++  Integer.digits(b)) -- Integer.digits(number))  == 0 
             end) 
             #|> Enum.reduce( number , fn{a,b} when a != [],  number -> [number | a| b] end)
            
             
        end
end


end





#|> Enum.join(" ")
 #|> IO.inspect()
#|> Enum.reduce("" ,fn x , acc-> acc <> " #{x}" end)
#|>IO.puts()
# Enum.each( Vampire.Server.get(pid) , fn ([a]) -> n <- for (i), do: IO.write "#{n}" 
#IO.puts "" end)
  #IO.write List.flatten(b) end ) 
 #|> List.flatten()
 #|> IO.puts()
