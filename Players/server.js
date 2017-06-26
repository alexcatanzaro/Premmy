
var express = require('express');
var fs = require('fs');
const request = require('request');
var cheerio = require('cheerio');
var app = express();


app.get('/scrape', function(req, res){

  //All the web scraping magic will happen here

  url = 'https://www.whoscored.com/Players/80767/Show/Philippe-Coutinho';

  request(url, function(error, response, html){
    if(!error){
      let $ = cheerio.load(html);

      let tournament, minsPlayed, goal, assistTotal, yellowCard, redCard, shotsPerGame, passSuccess, aerialWonPerGame, manOfTheMatch;
      let jsonPlayer = {tournament: "", minsPlayed : "", goal : "", assistTotal : "", yellowCard : "", redCard : "", shotsPerGame : "", passSuccess : "", aerialWonPerGame : "", manOfTheMatch : ""};

      $('#player-table-statistics-body').filter(function(){

        playerData = $(this);

        tournament = playerData.children('.tournament').text();
        minsPlayed = playerData.children('.minsPlayed').text();
        goal = playerData.children('.goal').text();

        jsonPlayer.tournament = tournament;
        jsonPlayer.minsPlayed = minsPlayed;
        jsonPlayer.goal = goal;
      })

      fs.writeFile('output.txt', JSON.stringify(jsonPlayer, null, 4), function(err){console.log('file has been written')})
      res.send('Check your console!')
    }else{
      console.log(error);
    }
  })

});

app.listen('8081')

console.log('Magic happens on port 8081');

exports = module.exports = app;
