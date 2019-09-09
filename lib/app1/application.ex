defmodule App1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    cond  do
      !Node.alive?() -> 
      Node.start(:"w@192.168.0.142",:longnames)
      Node.set_cookie(Node.self(),:rahul)
      Node.connect(:"foo@192.168.0.142")
      Node.connect(:"r@192.168.0.142")
      true -> ""
    end
      
    
   
    
    case OptionParser.parse(System.argv() ,  strict: [n: :integer, k: :integer]) do
  
  {_ ,[a,b],_} -> divideArgAndCallFunc(String.to_integer(a),String.to_integer(b))
  _ -> app(1,2)
  end
end

defp remeoteCall(node,number1,number2) do
  
    :rpc.call(node, App1.Server,:checkvampire, [number1,number2] )
    
    case :rpc.call(node, App1.Server,:get, [] ) do
    
      result -> Enum.each(result , fn x -> 
        Enum.each(x,fn y-> IO.puts y end) end)
     end
   :rpc.call(node, App1.Server,:set, [] )

end

defp divideArgAndCallFunc(number1, number2) do

  
  cond  do
    
    length(Node.list()) > 0 ->
      
      tmp1 = number2 - number1
      tmp = trunc( tmp1 / (length(Node.list()) + 1) )
      
      
    Enum.each(0..(length(Node.list()) -1), fn x ->
    
        remeoteCall( Enum.at(Node.list(),x),number1 + tmp*x , number1 + tmp*(x+1) -1 )
        
        
      end)

     app(number1 + tmp*2 , number2)
     
     length(Node.list()) == 0->
      app(number1, number2)
      
    end
 
    


end


defp app(number1,number2) do

    children = [
      {App1.Producer,[number1,number2]},
      {App1.Server, []}
      
    ]
    opts = [strategy: :one_for_one, name: App1.Supervisor]
    {:ok, pid} =  Supervisor.start_link(children, opts) 
    App1.Server.checkvampire(number1, number2)
    
    case App1.Server.get() do
    
      result -> Enum.each(result , fn x -> 
        Enum.each(x,fn y-> IO.puts y end) end)
     end
  
     
     {:ok, pid}
 end
  

end

