
/**
  Ampelmann is the walk/don't walk figure used on
  traffic lights in Berlin, Germany.

  This program makes a little Ampelmann figure
  walk back and forth on the screen. Click the
  traffic light to start, slow, and stop the man.
*/

Ampelmann theMan;
TrafficLight theLight;
void setup( )
{
  size(256, 256);
  smooth();
  
  theLight = new TrafficLight(200, 40); 
  theMan = new Ampelmann(27.5, 128, 1, theLight);
  theMan.changeState();
}

void draw()
{
  background(255);
  noStroke();
  
  theLight.display();
  theMan.display();
  theMan.move();
}

void mousePressed()
{
  int lightArea;
  lightArea = theLight.mouseHit(mouseX, mouseY);
  theLight.change(lightArea);
  theMan.changeState();
}


