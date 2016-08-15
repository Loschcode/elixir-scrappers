require IEx

defmodule Scrapper.Iafd do

    @remote_url "http://www.iafd.com/person.rme/perfid=avaalvarez/gender=f/ava-alvarez.htm"
    @datas_selector "#home .biodata"

    def remote_url do
      @remote_url
    end

    #
    # def process do
    #   request! |> process_response
    # end
    #
    # defp process_response(response) do
    #   for data <- @datas_list do
    #     response
    #     |> fetch_tags
    #     |> select_tag(data)
    #     |> process_result(data)
    #   end
    # end
    #
    # defp process_result(result, data) when is_tuple(result), do: success(data, result)
    # defp process_result(_, data), do: error(data)
    #
    # defp error(data) do
    #   IO.puts "Impossible to resolve #{clean_name(data)}."
    # end
    #
    # defp success(data, result) do
    #   IO.puts "#{clean_name(data)} is #{extract_from_tag(result)}"
    # end
    #
    # defp select_tag(list, :ethnicity), do: hd(list)
    # defp select_tag(list, :nationality), do: Enum.at(list, 1)
    # defp select_tag(list, :hair), do: Enum.at(list, 2)
    # defp select_tag(list, :height), do: Enum.at(list, 3)
    # defp select_tag(list, :weight), do: Enum.at(list, 4)
    # defp select_tag(list, :mensurations), do: Enum.at(list, 2)
    # defp select_tag(_list, _), do: IO.puts "I don't know what you're talking about"
    #
    # defp fetch_tags(response) do
    #   Floki.find(response.body, @datas_selector)
    # end
    #
    # defp clean_name(atom) do
    #   to_string(atom) |> String.capitalize
    # end
    #
    # defp extract_from_tag(tag) do
    #   tag |> elem(2) |> hd
    # end
    #
    # defp request! do
    #   HTTPoison.start
    #   HTTPoison.get! @remote_url
    # end

end
