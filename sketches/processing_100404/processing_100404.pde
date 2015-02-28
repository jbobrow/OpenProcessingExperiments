
import peasy.*;
import controlP5.*;
import simpleML.*;
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

PeasyCam cam;

List<Umbrella> umbrellaCollection = new ArrayList<Umbrella>();
List<XMLRequest> xmlRequests = new ArrayList<XMLRequest>();

float m = 0;
float r = 1;
float DIMX = 1200;
float DIMY = 1200;
float DIMZ = 1200;

String location;
float floatTemperature;	
float floatHumidity;	
float floatPressure;
float floatWind;

float x, y, z;

int startTime;
int globalIndex = 0;

public void setup() {

  size(1440, 1080, P3D);
  //frameRate(150);
  smooth();

  textFont(loadFont("PFBeauSansPro-Bbook-12.vlw"));
  textAlign(LEFT);
  textMode(SCREEN);
  cam = new PeasyCam(this, 1900);
  
  minim = new Minim(this);
  player = minim.loadFile("Yann Tiersen – First rendez-vous.mp3", 2048);
  player.play();
  player.loop();

  umbrellaCollection.add(createUmbrella(-400, -500, -400, floatTemperature, floatWind, floatPressure, floatHumidity, location, "A"));
  umbrellaCollection.add(createUmbrella(0, -400, -400, floatTemperature, floatWind, floatPressure, floatHumidity, location, "B"));
  umbrellaCollection.add(createUmbrella(400, -300, -400, floatTemperature, floatWind, floatPressure, floatHumidity, location, "C"));
  umbrellaCollection.add(createUmbrella(200, -200, -200, floatTemperature, floatWind, floatPressure, floatHumidity, location, "D"));
  umbrellaCollection.add(createUmbrella(-130, -100, -130, floatTemperature, floatWind, floatPressure, floatHumidity, location, "E"));
  umbrellaCollection.add(createUmbrella(-400, 0, 0, floatTemperature, floatWind, floatPressure, floatHumidity, location, "F"));
  umbrellaCollection.add(createUmbrella(400, 100, 0, floatTemperature, floatWind, floatPressure, floatHumidity, location, "G"));
  umbrellaCollection.add(createUmbrella(130, 200, 130, floatTemperature, floatWind, floatPressure, floatHumidity, location, "H"));
  umbrellaCollection.add(createUmbrella(-200, 300, 200, floatTemperature, floatWind, floatPressure, floatHumidity, location, "I"));
  umbrellaCollection.add(createUmbrella(-400, 400, 400, floatTemperature, floatWind, floatPressure, floatHumidity, location, "J"));
  umbrellaCollection.add(createUmbrella(0, 500, 400, floatTemperature, floatWind, floatPressure, floatHumidity, location, "K"));
  umbrellaCollection.add(createUmbrella(400, 600, 400, floatTemperature, floatWind, floatPressure, floatHumidity, location, "L"));

  for (int i = 1; i < 9; i++) {
    xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/LHXX000" + i + "_c.xml"));
  }

  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/UKXX0033_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/FRXX0076_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/AYXX0010_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/AYXX0007_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/ASXX0112_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/RSXX0116_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/RSXX0122_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/JAXX0085_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/SNXX0006_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/CHXX0008_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/THXX0002_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/KZXX0001_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/RSXX0063_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/ISXX0010_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/EGXX0004_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/GRXX0004_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/SWXX0031_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/BEXX0005_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/ICXX0002_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/ITXX0067_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/BRXX0232_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/VEXX0008_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/USNY0996_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/CUXX0003_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/USCA0638_c.xml"));
  xmlRequests.add(new XMLRequest(this, "http://xml.weather.yahoo.com/forecastrss/MXDF0132_c.xml"));
  requestForecast();
  startTime = millis();
  //camera(500, -100, 500, 100, 100, 100, 1, 0, 1);
}

public Umbrella createUmbrella(float _x, int _y, float _z, float _floatTemperature, float _floatWind, float _floatPressure, float _floatHumidity, String _location, String _type)
{
  return new Umbrella(_x, _y, _z, _floatTemperature, _floatWind, _floatPressure, _floatHumidity, _location, _type);
}

public void draw() {


  PImage img;
  img = loadImage("deepblue.jpg");
  background(15,10,25);
  
//  r = r - 0.01;
//  camera(1400,-50,1400, 0,200,0, 1,0,1);
//     rotateY(r);
//     translate(0,200,0);

  pushMatrix();
  fill(0, 80);
  noStroke();
  translate(0, -DIMY/2, 0);
  rotateX(radians(90));
  rect(-DIMX/2, -DIMZ/2, DIMX, DIMZ); 
  popMatrix();

  pushMatrix();
  fill(255, 30);
  noStroke();
  translate(0, DIMY/2, 0);
  rotateX(radians(90));
  rect(-DIMX/2, -DIMZ/2, DIMX, DIMZ); 
  popMatrix();
  
//      
//      fill(150);
//  String s = "";
//  s += "   " + location + "\n";
//  s += "   Temperature: " + floatTemperature + " C\n";
//  s += "   Humidity: " + floatHumidity + " %\n";
//  s += "   Pressure: " + floatPressure + " mb\n";
//  s += "   Wind speed: " + floatWind + " km/h\n";
//  text(s, x+1000, y+450);
//  
  
  noLights();
  stroke(255, 30);
  noFill();  
  strokeWeight(1);
  box(1200, 1200, 1200);

  int now = millis();
  if (now - startTime > 10000) {
    requestForecast();
    startTime = now;
  }


  for (int i = 0; i < umbrellaCollection.size(); i++) {
    Umbrella umb = (Umbrella) umbrellaCollection.get(i);
    umb.run();

  }
}

//  cam.setActive(false);

public void requestForecast() {
  for (int i = 0; i < xmlRequests.size(); i++) {
    xmlRequests.get(i).makeRequest();
  }
}

public void netEvent(XMLRequest ml) {

  String location = ml.getElementAttributeText("yweather:location", "city");
  String datetime = ml.getElementText("pubDate");
  String temperature = ml.getElementAttributeText("yweather:condition", "temp");
  String humidity = ml.getElementAttributeText("yweather:atmosphere", "humidity");
  String pressure = ml.getElementAttributeText("yweather:atmosphere", "pressure");
  String wind = ml.getElementAttributeText("yweather:wind", "speed");

  floatTemperature = Float.parseFloat(temperature);	
  floatHumidity = Float.parseFloat(humidity);	
  floatPressure = Float.parseFloat(pressure);
  floatWind = Float.parseFloat(wind);

  if (globalIndex >= 12) {
    globalIndex = 0;
  }
  System.out.println(globalIndex);
  umbrellaCollection.get(globalIndex++).setNewForecast(floatTemperature, floatWind, floatPressure, floatHumidity, location);
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}

