
/* @pjs preload="sanic.jpg, explosion.jpg"; */

PImage myimage;
PImage myimage2;
PImage myimage3;

void setup()
{
  size(500,500);
  
  myimage = requestImage("Pokeball.png");
  myimage2 = loadImage("sanic.jpg");
  myimage3 = loadImage("explosion.jpg");
  myimage2.filter(THRESHOLD);
  myimage.filter(GRAY);
}

void draw()
{
  if (myimage.width > 0)
  {
  image(myimage,0,0,500,500);
}
image(myimage2, 0, 0, 200, 200);
image(myimage3, 300, 0, 200, 200);

for (int x = 0; x< width; x += 20)
{
  stroke(0,255,0);
  line(x,0,x,height);
}
for (int y = 0; y< height; y += 20)
{
  stroke(255,0,0);
  line(0, y, width, y);
}
for (int doge=0; doge<200; doge++)
{
  float r = random(50);
  stroke(r*5);
  line(200, doge, 200+r, doge);
}
for (int sanic=0; sanic<200; sanic++)
{
  float t = random(-50);
  stroke(t*5);
  line(300, sanic, 300+t, sanic);
}
}


