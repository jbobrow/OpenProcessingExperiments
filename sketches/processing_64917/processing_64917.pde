
/*
Note: If your internet connection went down, 
 or googles service is inconsistent the methods
 will either return 999 or »N/A« depending on if
 the return value of the method is a int/float or a String.
 
 More information about the Google Weather Library can be found and downloaded at:
 http://www.onformative.com/lab/google-weather-library-for-processing/
 */

import googleweather.threads.*;
import googleweather.*;

//background colour
color b = color(213, 223, 205);
color bd = color(205, 219, 193, 30);
//blue colour info
color bs = color(0, 0, 255, 1);
color bf = color(0, 255, 0, 1);
//red colour info
color rs = color(255, 0, 0, 1);
color rf = color(127, 255, 255, 1);

GoogleWeather weatherWgtn;
GoogleWeather weatherMdrd;

String cityNameNZ = "Wellington";
String cityNameSpain = "Madrid";

int updateInterval = 10;

int saveNo = 1;

int tempWgtn;
int tempMdrd;

int humidityWgtn;
int humidityMdrd;

float windSpeedWgtn;
float windSpeedMdrd;

int windDirectionWgtn;
int windDirectionMdrd;

void setup() {
  size(1350, 600);
  background(b);
  noStroke();
  noFill();  

  weatherWgtn = new GoogleWeather(this, cityNameNZ, updateInterval);
  weatherMdrd = new GoogleWeather(this, cityNameSpain, updateInterval);

  settingUp(random(100, width-100), random(100, height-100));
}

void tempDisplay(GoogleWeather w, int t, int d, color s, color f) {
  for (int i=0; i<t;i++) {
    float angle = radians(i*d);
    pushMatrix();
    rotate(angle);
    fill(s);
    stroke(b, 2);
    strokeWeight(0.01);
    ellipse(0, 0, t, 1);
    fill(f);
    ellipse(0, 0, t, 1);
    popMatrix();
  }
}

void humidityDisplay(GoogleWeather w, int h, int d, color s, color f) {
  for (int i =0; i<h;i++) {
    float angle = radians(i*d+2);
    rotate(radians(10));
    pushMatrix();
    rotate(angle);
    noStroke();
    fill(s);
    triangle(-h, -h, -h, 50, 50, -h);
    fill(f);
    triangle(-h, -h, -h, 50, 50, -h);
    popMatrix();
  }
}

void windSpeedDisplay(GoogleWeather w, float ws) {
  pushMatrix();
  noFill();
  stroke(bd);
  strokeWeight(1);
  ellipse(0, 0, ws, ws);
  popMatrix();
}

void settingUp(float ranX, float ranY) {
  tempWgtn = weatherWgtn.getTemperatureInCelsius();
  tempMdrd = weatherMdrd.getTemperatureInCelsius();

  humidityWgtn = weatherWgtn.getHumidityInPercent();
  humidityMdrd = weatherMdrd.getHumidityInPercent();

  windSpeedWgtn = weatherWgtn.getWindSpeedInKMH();
  windSpeedMdrd = weatherMdrd.getWindSpeedInKMH();

  windDirectionWgtn = weatherWgtn.getWindDirectionDegree();
  windDirectionMdrd = weatherMdrd.getWindDirectionDegree();

  pushMatrix();
  translate(ranX, ranY);
  //scale(2.5, 2.5);
  humidityDisplay(weatherWgtn, humidityWgtn, windDirectionWgtn, bs, bf);
  humidityDisplay(weatherMdrd, humidityMdrd, windDirectionMdrd, rf, rs);
  popMatrix();

  pushMatrix();
  translate(ranX, ranY);
  scale(5, 5);
  tempDisplay(weatherWgtn, tempWgtn, windDirectionWgtn, bs, bf);
  tempDisplay(weatherMdrd, tempMdrd, windDirectionMdrd, rf, rs);
  popMatrix();

  pushMatrix();
  translate(ranX, ranY);
  scale(5, 5);
  windSpeedDisplay(weatherWgtn, windSpeedWgtn);
  windSpeedDisplay(weatherMdrd, windSpeedMdrd);
  popMatrix();

  screenshot();
}

void screenshot() {
  String d = str(day());
  String h = str(hour());
  String m = str(minute());
  String s = str(second());
  String v = str(saveNo);
  String filenamePNG = "P Madrid And Wellington " + v + " " + d + " "+ h + " " + m + " " + s+".png";
  save(filenamePNG);
  String filenameTiff = "T Madrid And Wellington " + v + " " + d + " " + h + " "+ m + " " + s+".tif";
  save(filenameTiff);
  saveNo++;
}

void draw() {
  weatherWgtn.update();
  weatherMdrd.update();
  if (tempWgtn != weatherWgtn.getTemperatureInCelsius() || tempMdrd != weatherMdrd.getTemperatureInCelsius() || humidityWgtn != weatherWgtn.getHumidityInPercent()|| humidityMdrd != weatherMdrd.getHumidityInPercent()||windSpeedWgtn != weatherWgtn.getWindSpeedInKMH()|| windSpeedMdrd != weatherMdrd.getWindSpeedInKMH()||windDirectionWgtn != weatherWgtn.getWindDirectionDegree()|| windDirectionMdrd != weatherMdrd.getWindDirectionDegree()) { 
    int opacity = 20;
    fill(b, opacity);
    noStroke();
    rect(0, 0, width, height);
    settingUp(random(width), random(height));
  }
}


