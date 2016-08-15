require IEx

defmodule Scrapper do

  @datas_list [:ethnicity, :nationality, :hair, :height, :weight, :mensurations, :random]

  def process(directory) do
    module_directory = module_directory(directory)
    response = request!(module_directory)
    process_response!(module_directory, response)
  end

  def module_directory(directory) do
    directory
    |> to_string
    |> String.capitalize
    |> to_module
  end

  defp to_module(string) do
    Module.concat([Elixir, Scrapper, string]) #:"Elixir.Scrapper.#{string}"
  end

  defp process_response!(module_directory, response) do
    for data <- @datas_list do
      response
      |> module_directory.fetch_tags
      |> module_directory.select_tag(data)
      |> module_directory.extract_from_tag
      |> process_result(data)
    end
  end

  defp process_result(result, data) when is_bitstring(result) do
    success(data, result)
  end

  defp process_result({:error, error}, data) do
    error(data, error)
  end

  defp error(data, response) do
    {:error, %{type: data, response: response}}
  end

  defp success(data, response) do
    {:ok, %{type: data, response: response}}
  end

  defp request!(module_directory) do
    HTTPoison.start
    HTTPoison.get! module_directory.remote_url
  end

end
