require IEx

defmodule Scrapper do

  @datas_list [:ethnicity, :nationality, :hair, :height, :weight, :mensurations, :random]

  def process(directory) do
    module_directory = module_directory(directory)
    response = request!(module_directory)
    process_response!(response, module_directory)
  end

  def module_directory(directory) do
    directory
    |> to_string
    |> String.capitalize
    |> to_module
  end

  def to_module(string) do
    :"Elixir.Scrapper.#{string}"
  end

  defp process_response!(response, module_directory) do
    for data <- @datas_list do
       response
       |> module_directory.fetch_tags
       |> module_directory.select_tag(data)
       |> process_result(data)
     end
  end

  defp process_result(result, data) when is_tuple(result), do: success(data, result)
  defp process_result(_, data), do: error(data)

  defp error(data) do
    IO.puts "Impossible to resolve #{clean_name(data)}."
  end

  defp success(data, result) do
    IO.puts "#{clean_name(data)} is #{extract_from_tag(result)}"
  end

  defp clean_name(atom) do
    to_string(atom) |> String.capitalize
  end

  defp extract_from_tag(tag) do
    tag |> elem(2) |> hd
  end

  defp request!(module_directory) do
    HTTPoison.start
    HTTPoison.get! module_directory.remote_url
  end

end
