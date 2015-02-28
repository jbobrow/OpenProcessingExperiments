
float x = 0;
float speed = 10;
PImage kyubey;
PImage triforce;
PImage dragon;
boolean alreadyBlurred = false;

void setup()
{
  size(450,400);
  frameRate(30);
  kyubey = requestImage("kyubey.jpg");
  triforce = requestImage("triforce2.png");
  dragon = requestImage("dragon.JPG");
}

void draw()
{
  if (kyubey.width > 0)
  {

  kyubey.filter(ERODE);
  alreadyBlurred = true;

  image(kyubey,0,0,width,height);
  }
  
  if (triforce.width > 0)
  {
    image(triforce,0,230, 125, 125);
  }
  
  if (dragon.width > 0)
  {
    image(dragon,371,225,158/2,300/2);
  }

int a = 0;
while(a < width)

{
  stroke(#F0D824);
  line(a, 0, a, height);
  a += 30;
}

for (int b = 0; b <height; b += 30)
{
  stroke(255,0,0);
  line(0,b,width,b);
}
stroke (#30E042);
strokeWeight(4);
float x = 70;
float y = 250;
while (x < width)
{
  float xx = x + random(5);
  float yy = y + random(-2, 2);
  line(x,y,xx,yy);
  x = xx;
  y = yy;
}
}


