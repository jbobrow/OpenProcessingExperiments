

PImage img;
void setup()
{
  size(500, 764);
  img = loadImage("spongebob4.png");
 
  frameRate(10);
}
void draw()
{
  background(img);
  stroke (255, 255, 255);
  strokeWeight(3);
  fill(255, 255, 255, 90);

  float x = 0;
  int i = 1;
  
  while (i<=100)
  {
    ellipse (random(501), random(764), x,x);
    i=i+1;
    x= (random(10,40));

  }
}


