
// Alex French
// a scrolling shooter inspired by Defender and Geometry Wars
// features parallax scrolling

building b[] = new building[40];
PImage bg;
PImage buildings[] = new PImage[4];

void setup()
{
  int i;
  size(500, 500, P3D);
  frameRate(60);
  // create buildings
  for (i = 0; i < 40; i++) {
    b[i] = new building();
  }
  // create building layers
  //for (i=0; i < 
  // create bg gradient
  bg = createImage(500, 500, RGB);
  for (i = 0; i < bg.pixels.length; i++) {
    bg.pixels[i] = color(0, 0, map(i / bg.width, 0, 500, 0, 100));
  }
}

void draw()
{
  background(255);
  image(bg, 0, 0);
  int i, j;
  for (i = 0; i < 4; i++) {
    for (j = 10*i; j < 10*i+10; j++) {
      b[j].show(i);
      b[j].update(40+i*5);
    }
  }
}

class building
{
  int height, width;
  float xpos, ypos;
  building ()
  {
    height = (int)random(10, 250);
    width = (int)random(10, 100);
    xpos = random(5000);
    ypos = 500-height/2;
  }
  void show(int depth)
  {
    if (xpos < 5000) {
      noStroke();
      fill(64+(depth*32));
      rect((int)map(xpos, 0, 5000, 0, 500), (int)ypos, width, height);
    }
  }
  void update(int parallax)
  {
    xpos = xpos-parallax;
    if (xpos < 0-width*10) {
      xpos = 5000+(int)random(5000);
    }
  }
}

