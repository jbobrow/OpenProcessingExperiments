
PImage img;
PImage rocket;
int x = -100;
int y = 400;
int dirY = 1;
int dirX = 1;
int imgwidth = 200;
int imgheight = 200;
void setup () {
  size(500,500);
  img = loadImage("http://danielnikolovski.com/bluesky.jpg");
  rocket = loadImage("http://danielnikolovski.com/rocket.png");
}

void draw () {
  image(img,0,0);
  image(rocket, x, y, imgwidth, imgheight);
  
  y = y - dirY;
  if (y < 0) dirY = -1;

  x = x + dirX;  
  if (x > width - imgwidth) dirX = -1;
}
