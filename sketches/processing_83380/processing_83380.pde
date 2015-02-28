
// Summer Myung
// Final
// December, 13, 2012

PImage img;
PImage img2;
PImage img3;

void setup ()
{
  background(255, 249, 232 );
  size (800, 550);

  
  img = loadImage("HOW.png");
  img2 = loadImage("What.png");
  img3 = loadImage("Activity.png");
}

void draw() {
  fill(0);
  image(img, 1, 1);
  image(img2, 10, 100);
  image(img3, 10, 160);
}


