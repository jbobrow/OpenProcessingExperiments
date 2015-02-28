
/**
Pebble Simulator created by Sabrina Azad
ITEC 3450 
Professor: Dr. Lutz

This program has a button which can be clicked within the watch to display 
the current running time and the weather of the city of Lawrenceville. 
**/
PImage img; 
import com.onformative.yahooweather.*;
YahooWeather weather;
int updateIntervallMillis = 30000; 

void setup()
{
  background(255);
  size(400, 400);
  img = loadImage("Pebble-Watch.png");
  weather = new YahooWeather(this, 12770530, "f", updateIntervallMillis);
}

void draw()
{
  weather.update(); 
  image(img, 40, 20);
  fill(0);
  rect(120, 100, 140, 180); 


  {
    if (mousePressed) {
      fill(255);
      int m=minute(), s=second(), h=hour();
      textSize(25); 
      text(h, 140, 130);
      text(m, 175, 130);
      text(s, 215, 130);
    } 
    else {
      fill(178, 34, 34);
    }
    rect(175, 250, 25, 25);
  }


  {
    if (mousePressed) {
      fill(255); 
      textSize(15); 
      text(weather.getCityName(), 150, 170);
      text("Temp:" +weather.getWindTemperature()+"F", 150, 190);
    } 
    else {
      fill(178, 34, 34);
    }
  }
}



