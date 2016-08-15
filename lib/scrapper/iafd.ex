require IEx

defmodule Scrapper.Iafd do

    @remote_url "http://www.iafd.com/person.rme/perfid=avaalvarez/gender=f/ava-alvarez.htm"
    @datas_selector "#home .biodata"

    def remote_url do
      @remote_url
    end

    def select_tag(list, :ethnicity), do: hd(list)
    def select_tag(list, :nationality), do: Enum.at(list, 1)
    def select_tag(list, :hair), do: Enum.at(list, 2)
    def select_tag(list, :height), do: Enum.at(list, 3)
    def select_tag(list, :weight), do: Enum.at(list, 4)
    def select_tag(list, :mensurations), do: Enum.at(list, 2)
    def select_tag(_list, _), do: IO.puts "I don't know what you're talking about"

    def fetch_tags(response) do
      Floki.find(response.body, @datas_selector)
    end
    
end
