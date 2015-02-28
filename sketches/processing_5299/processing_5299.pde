


PFont f;

WaveGrabber wg;

void setup() {
  size(200,200);
  
  // Make a WeatherGrabber object
  wg = new WaveGrabber();
  // Tell it to request the weather
  wg.requestWave();
  
  f = createFont( "Georgia" ,16,true);
}

void draw() {
  background(255);
  textFont(f);
  fill(0);
  
  // Get the values to display
  String r = wg.getWave();
  //println("wave: " + r);
  text(r,10,90);
}

