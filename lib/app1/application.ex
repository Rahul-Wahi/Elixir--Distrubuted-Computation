defmodule App1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

 {_ ,[a,b],_}  =  OptionParser.parse(System.argv() , switches: [ help: :boolean], 
     
   
aliases:  [ h:    :help   ]) 
  
number1 = String.to_integer(a)
number2 = String.to_integer(b)
#number1 = 1000
#umber2 = 2000
    children = [
      {App1.Producer,[number1,number2]},
      {App1.Server, []}
       
      # Starts a worker by calling: App1.Worker.start_link(arg)
      # {App1.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: App1.Supervisor]
    {:ok, pid} =  Supervisor.start_link(children, opts) 
    App1.Server.checkvampire(number1, number2)
    # IO.inspect List.flatten(App1.Server.get()) 
    case App1.Server.get() do
     #|> Enum.each( fn x ->
      
      #Enum.each(fn y ->))  
      result -> Enum.each(result , fn x -> 
        Enum.each(x,fn y-> IO.puts y end) end)
     end
  
     
     {:ok, pid}

  end
end

