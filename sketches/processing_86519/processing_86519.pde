
import com.onformative.yahooweather.*;

YahooWeather weather;
int updateIntervallMillis = 30000; 

PVector[] windParticles = new PVector[1000];

void setup() {
  size(400, 400);
  weather = new YahooWeather(this, 638242, "c", updateIntervallMillis);

  for (int i=0; i<windParticles.length; i++) {
    windParticles[i] = new PVector(random(width), random(height));
  }

  noStroke();
}

void draw() {
  weather.update();
  background(120);
  fill(255, 30);
  drawWind();
  fill(255);
  text("City: "+weather.getCityName(), 10, 20);
  text("Weather: "+weather.getWeatherCondition(), 10, 40);
  text("WindDirection: "+weather.getWindDirection(), 10, 60);
  text("WindSpeed: "+weather.getWindSpeed()+"km/h", 10, 80);
}

void drawWind() {
  int size = 4;

  for (int i=0; i<windParticles.length; i++) {
    windParticles[i].add(getNormalizedPVector(weather.getWindDirection()));

    if (windParticles[i].x<0)windParticles[i].x=width;
    if (windParticles[i].x>width)windParticles[i].x=0;
    if (windParticles[i].y<0)windParticles[i].y=height;
    if (windParticles[i].y>height)windParticles[i].y=0;
    fill(255, 30);
    ellipse(windParticles[i].x, windParticles[i].y, size, size);
  }
}

/**
 * transforming the wind direction of yahoo into a normalizes vector 
*/
PVector getNormalizedPVector(int direction) {
  int numPoints = 360;
  float angle = TWO_PI/(float)numPoints;
  direction = 360-direction;
  direction += 180;
  return new PVector(sin(angle*direction), cos(angle*direction));
}

public void keyPressed() {
  if (key == 'q') {
    weather.setWOEID(638242);
  }
  if (key == 'r') {
    weather.setWOEID(44418);
  }
}

