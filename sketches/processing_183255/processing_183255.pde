
/*This app is built directly for processing and requires the apwidgets library to work*/

int temperature = 0;
String weather = "";
String zip = "UKXX0052";
String city = "";
int windspeed = 0;
int code = 0;

import apwidgets.*;

APMediaPlayer sunny;
APMediaPlayer windy;
APMediaPlayer rainy;
APMediaPlayer snowy;
APMediaPlayer cold;


void setup() {
  findWeather();
  background(0);
  println("Location: " + city + "   Temperature: " + temperature + "   Forecast: " + weather + "   Wind Speed: " + windspeed + "     Code: " + code);
 
 sunny = new APMediaPlayer(this);
 sunny.setMediaFile("sunny.mp3");
 sunny.setVolume(1.0, 1.0);
 windy = new APMediaPlayer(this);
 windy.setMediaFile("windy.mp3");
 windy.setVolume(1.0, 1.0);
 rainy = new APMediaPlayer(this);
 rainy.setMediaFile("rainy.mp3");
 rainy.setVolume(1.0, 1.0);
 snowy = new APMediaPlayer(this);
 snowy.setMediaFile("snowy.mp3");
 snowy.setVolume(1.0, 1.0);
 cold = new APMediaPlayer(this);
 cold.setMediaFile("cold.mp3");
 cold.setVolume(1.0, 1.0);
  
}

void findWeather(){
  String url = "http://xml.weather.yahoo.com/forecastrss?p=" + zip;
  XML xml = loadXML(url);
  XML location = xml.getChild("channel/yweather:location");
  city = location.getString("city");
  XML wind = xml.getChild("channel/yweather:wind");
  windspeed = wind.getInt("speed");
  temperature = wind.getInt("chill");
  XML condition = xml.getChild("channel/item/yweather:condition");
  weather = condition.getString("text");
  code = condition.getInt("code");
}


void draw(){
  playTemperature(); 
  playWeather();  
}


void playTemperature(){
  if(temperature < 60 && temperature > 30) {
    cold.start();
  }
  /*if (temperature =< 30){
    freezing.play();
  }
  if (temperature => 60 && temperature < 80) {
    warm.play();
  }
  if(temperature => 80) {
    hot.play();
  } */
}



void playWeather(){  
  if(code == 32){
    sunny.start();
  }  
  if(code == 33){
    sunny.start();
  }
  if(code == 34){
    sunny.start();
  }
   if(code == 30){
    sunny.start();
  }
  
  
  if(code == 9){
    rainy.start();
  }  
  if(code == 11){
    rainy.start();
  }  
  if(code == 12){
    rainy.start();
  }  
  if(code == 40){
    rainy.start();
  }

  
  if(code == 24){
  windy.start();
  }  
  if(code == 23){
  windy.start();
  }
  
  if(code == 13){
  snowy.start();
  }
  if(code == 14){
  snowy.start();
  }
  if(code == 15){
  snowy.start();
  }
  if(code == 16){
  snowy.start();
  }
  if(code == 41){
  snowy.start();
  }
  if(code == 42){
  snowy.start();
  }
  if(code == 43){
  snowy.start();
  }
  if(code == 46){
  snowy.start();
  }
}
  
  public void onDestroy() {

  super.onDestroy(); 
  if(sunny!=null) { 
    sunny.release(); 
  }
  if(windy!=null) { 
    windy.release(); 
  }
  if(rainy!=null) { 
    rainy.release(); 
  }
  if(snowy!=null) { 
    snowy.release(); 
  }
  if(cold!=null) { 
    cold.release(); 
  }
  
}


