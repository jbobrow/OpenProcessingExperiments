
int x = 1;
int y = 1;
PImage g;
PImage h;
void setup()
{
  size(500, 350, P3D);
  frameRate(2);
  h = loadImage("http://www.inkity.com/shirtdesigner/prints/clipArt1/N98A5650.png");
  g = loadImage("http://i1206.photobucket.com/albums/bb441/AMIDEADYET/lacko.png");
}
void draw()
{
  image(g, 0, 0, 600, 400);
  smooth();
  noStroke();
  fill(234, 64, 64);
  while (x <= y) 
  {
    image(h, int(random(500)), int(random(350)), 50, 50);
    x++;
  }
  y = y + y;
}


