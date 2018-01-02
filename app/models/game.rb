class Game < ApplicationRecord
  belongs_to :stadium, optional: true
  
  
  def self.today
    d = DateTime.now
    current_day = d.strftime("%m/%d/%y")
    url = URI("http://stats.nba.com/stats/scoreboard/?GameDate=#{current_day}&LeagueID=00&DayOffset=0")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'max-age=0'
    request["host"] = 'stats.nba.com'
    request["connection"] = "keep-alive"
    request["accept-encoding"] = "Accepflate, sdch"
    request['accept-language'] = 'he-IL,he;q=0.8,en-US;q=0.6,en;q=0.4'
    request['user-agent'] =  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36'
    response = http.request(request)
    body = JSON.parse(response.read_body)
    arr = []
    body["resultSets"][0]["rowSet"].map do |game|
      name = game[5].split("/")[1].insert(3, " vs. ")
      one = Game.find_or_create_by(name: name, start_time: game[4])
      one.current_period = game[9]
      one.date = current_day
      if one.current_period == "4" || one.current_period == "5"
        one.alcohol = false
      else 
        one.alcohol = true
      end
      one.save
      arr.push << one
    end
    arr
  end
  
  private

  
end
