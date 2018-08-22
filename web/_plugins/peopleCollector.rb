module Jekyll
  class PeopleCollector < Generator
    priority :highest

    def generate(site)
      base = "#{site.source}/_data"
      people = Array.new
      Dir["#{base}/people/*.json"].sort_by{ |f| File.basename( f , ".json" ) }.each do | f |
        people << JSON.parse( File.read( f ) )
      end
      site.data["people"] = people
    end
  end
end