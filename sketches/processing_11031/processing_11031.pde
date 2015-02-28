
/*
* Color Cycling by Christophe Guebert
* 8-bits images animated by cycling the color palette
* Move the mouse horizontally to blend between images
* 
* Art by Mark Ferrari
* Idea from Joseph Hackaby
*/

CyclingImage[] images;
boolean showFPS=false;

void setup()
{
  size(640, 480);
  images = new CyclingImage[3];
  images[0] = new CyclingImage("D2.gz");
  images[1] = new CyclingImage("D1.gz");
  images[2] = new CyclingImage("D3.gz");
}

void draw()
{
  // Choosing images to be displayed
  float f = constrain(mouseX / (float) width, 0, 1);
  f *= images.length - 1;
  int index = floor(f);
  f -= index;
  f = 3*f*f - 2*f*f*f; // smoother interpolation
  
  float t = millis() / 1000.0 / 280; // arbitrary coefficient for speed
  images[index].update(t);
  images[index].display();
  
  tint(color(255, f*255));  // using "tint" to go from one image to the next
  images[index+1].update(t);
  images[index+1].display();
  tint(color(255));
  
  if(showFPS) text(frameRate, 0, 10);
}

void keyPressed()
{
  if(key == 'f' || key == 'F')
    showFPS = !showFPS;
}

