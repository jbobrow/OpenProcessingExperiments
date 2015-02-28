
/* @pjs preload="Portrait.jpg, BR.jpg"; */

//I attempted a animation through a simple ellipse but
//would not show up on image.
//float x = 540;
//float y = 360;
//float radius = 15;
//float speedX = 2.0;
//float speedY = 1.4;
//int directionX = 1;
//int directionY = -1;

PImage myimage;
PImage myimage2;
PImage myimage3;

void setup()
{
  size(1080,720);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  myimage = loadImage("Portrait.jpg");
  myimage2 = loadImage("BR.jpg");
  myimage3 = loadImage("GGLTFFTY.png");
}

void draw()
{
  //ellipse(500, 300, radius, radius);
  //color(0,0,0);
  //x += speedX * directionX;
  //if ((x > width-radius) || (x < radius))
  //{
  //  directionX = -directionX;
  //}
  //y += speedY * directionY;
  //if ((y > height-radius) || (y < radius))
  //{
    //directionY = -directionY;
  //}
  tint(#0EFF03);
  image(myimage, 0, 0, width, height);
  filter(POSTERIZE, 3); 
  

stroke(255);
strokeWeight(5);
float ly = 600.0;
float lx = 0.0;
while (lx < width)
  {
    float nextX = lx + random(1080);
    float nextY = ly + random(300);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);
 

if (mouseX > 980)
if (mouseY > 650)
  {
  noTint();
  image(myimage2, 0, 0, width, height);
  filter(INVERT);
  }
if (mouseX < 75)
if (mouseY < 50)
  {
  noTint();
  image(myimage3, 0, 0, width, height);
  filter(INVERT);
  }
}


