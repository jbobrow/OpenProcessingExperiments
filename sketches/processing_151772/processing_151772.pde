
PImage img = null;

/* @pjs preload="fuzzyFarbe.jpg"; */

void setup()
{
  size (600, 600);
  smooth();
  img = loadImage ("fuzzyFarbe.jpg");

  background (#57385c);
}

void draw ()
{

  int x = (int) random (0, img.width);
  int y = (int) random (0, img.height);

  color c = img.get (x, y);
  float d = random (1, 20);;

  fill (c);
  noStroke();

  ellipse (x, y, d, d);
}

void mousePressed() {
  background (#57385c);
}



