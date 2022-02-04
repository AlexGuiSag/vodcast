defmodule Vodcast.Content.Api do

  use HTTPoison.Base

  def get_rssfeed(url) do
    #Crear request get a url recibida en params
    response = HTTPoison.get!(url)

    #Imprimir lo obtenido de la url
    response
    |> IO.inspect(label: "Esta es la respuesta")

  end
end
