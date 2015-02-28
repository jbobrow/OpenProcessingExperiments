
import com.onformative.yahooweather.*;

YahooWeather weather;
int updateIntervallMillis = 30000; 


void setup() {
  size(700, 300);
  fill(0);
  //textFont(createFont(»Arial«, 14));
  // 638242= the WOEID of Berlin
  // use this site to find out about your WOEID : http://sigizmund.info/woeidinfo/
  weather = new YahooWeather(this, 638242, "c", updateIntervallMillis);
}

void draw() {
  weather.update();
  background(255);
  text("City: "+weather.getCityName()+"; Region: "+weather.getRegionName()+"; Country: "+weather.getCountryName()+"; Last updated: "+weather.getLastUpdated(), 20, 20);
  text("Lon: "+weather.getLongitude()+" Lat: "+weather.getLatitude(), 20, 40);
  text("WindTemp: "+weather.getWindTemperature()+" WindSpeed: "+weather.getWindSpeed()+" WindDirection: "+weather.getWindDirection(), 20, 60);
  text("Humidity: "+weather.getHumidity()+" Visibility: "+weather.getVisibleDistance()+" pressure: "+weather.getPressure()+" rising: "+weather.getRising(), 20, 80);
  text("Sunrise: "+weather.getSunrise()+" Sunset: "+weather.getSunset(), 20, 100);
}



public void keyPressed() {
  if (key == 'q') {
    weather.setWOEID(638242);
  }
  if (key == 'r') {
    weather.setWOEID(44418);
  }
  if (key == 'w') {
    weather.setTempertureUnit("c");
  }
  if (key == 'e') {
    weather.setTempertureUnit("f");
  }
}


