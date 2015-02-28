
PImage steal;
PImage good;
PImage bow;

void setup()
{
size (600,600);
steal = loadImage("steal.jpg");
good = loadImage("good.png");
bow = loadImage("bow.png");
frameRate(12);
}


void draw()
{
  if (steal.width > 0)
  {
    image(steal, 0,0, width, height);
    image(good, 450,450, 150, 150);
    bow.filter(ERODE);
    image(bow, 0,500,100,100);
  }
  int x = 0;
  while ( x < width)
  {
    stroke(#003916);
    strokeWeight(2);
    line(x,0,x,height);
    x += 45;
  }
  int y = 0;
  while (y < height)
  {
    line(0,y,width,y);
    y += 45;
  }
  
  
  float xx = 80;
  float yy = 550;
  float nextX = xx;
  float nextY = yy;
  stroke(#FFE30D);
  strokeWeight(10);
  while (xx < 600)
  {
    xx += 50;
    yy += random(-50,50);
    line(nextX,nextY,xx,yy);
    nextX = xx;
    nextY = yy;
  }
  
 
}


