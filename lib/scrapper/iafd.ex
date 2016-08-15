require IEx

defmodule Scrapper.Iafd do

    @remote_url "http://www.iafd.com/person.rme/perfid=avaalvarez/gender=f/ava-alvarez.htm"
    @datas_selector "#home .biodata"

    def remote_url, do: @remote_url

    def extract_from_tag({:error, error}), do: {:error, error}
    def extract_from_tag({:ok, tag}), do: tag |> elem(2) |> hd

    def select_tag(list, :ethnicity), do: {:ok, hd(list)}
    def select_tag(list, :nationality), do: {:ok, Enum.at(list, 1)}
    def select_tag(list, :hair), do: {:ok, Enum.at(list, 2)}
    def select_tag(list, :height), do: {:ok, Enum.at(list, 3)}
    def select_tag(list, :weight), do: {:ok, Enum.at(list, 4)}
    def select_tag(list, :mensurations), do: {:ok, Enum.at(list, 2)}
    def select_tag(_list, _), do: {:error, "Data not recognized"}

    def fetch_tags(response) do
      Floki.find(response.body, @datas_selector)
    end

end
