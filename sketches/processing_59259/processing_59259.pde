

StopWatchTimer watch;
PImage compass;

void setup()
{
  size(400, 386);
  
  frameRate(30);
  compass = loadImage("compass.jpg");
  
  watch = new StopWatchTimer();
  watch.start();
}

void draw ()
{
  background(compass);
  time();
}

void time() 
{
  PFont font;
  font = loadFont("VinerHandITC-20.vlw"); 
  textFont(font, 20);
  //textAlign(CENTER);

  fill(0,0,0); 
  text(second(), 233, 195); 
  text(":", 213, 195);
  text(minute(), 193, 195);
  text(":", 173, 195);
  text(hour(), 153, 195);
}

