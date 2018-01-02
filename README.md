Quick demo for potential automation of concessions during an NBA game

The app scrapes the nba api for game information and current quarter. The alcohol category automatically flips to false when the quarter has reached 4 or the game has finished.

The Welcome Page lists today's NBA games. 

![alt text](https://raw.githubusercontent.com/bother7/concessions_demo/master/app/assets/images/demo.png)

git clone
bundle install
rails db:create
rails db:migrate
rails s