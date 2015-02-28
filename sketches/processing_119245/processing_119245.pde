
import com.onformative.yahooweather.*;
int[] data;
int updateIntervallMillis = 30000; 
int counter;
YahooWeather weather;

void setup() {

  size(500, 500);
  String[] stuff = loadStrings("123.txt");
  data = int(split(stuff[0], ',' ));
  weather = new YahooWeather(this, 12589335, "c", updateIntervallMillis);
  noStroke();
  counter = 0;
}

void draw() {
  weather.update();
  drawbackground();

  fill(255);  
  textFont(createFont("courier", 24));
  text("City: "+weather.getCityName(), 30, 45);
  
  fill(255);
  textFont(createFont("courier", 18));
  text("Temp: "+weather.getTemperature()+" c",30,40+60);
  text("Weather: "+weather.getWeatherCondition(), 30, 60+60);
  text("WindDirection: "+weather.getWindDirection(), 30, 80+60);
  text("WindSpeed: "+weather.getWindSpeed()+"km/h", 30, 100+60);
  text("Sunrise Time: "+weather.getSunrise(),30, 120+60);
  text("Sunset Time: "+weather.getSunset(), 30, 140+60);
}

void drawbackground() {

  if (weather.getTemperature()>=10 ){
  background((weather.getTemperature())*19,(weather.getTemperature())*9,120);}
  
  if (weather.getTemperature()<10){
  background(120,120,(weather.getTemperature())*19);}

}

void keyPressed() {
   weather.setWOEID(data[counter]);
    counter++;
    if (counter == 6){
      counter = 0;
    }
}


