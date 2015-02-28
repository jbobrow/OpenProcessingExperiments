
//Sarah C CP1 16/17, 100RandomShapes
PImage g;
void setup()
{
  size(400,400);
  frameRate(6);
  g = loadImage("GirlWithEarring.png");
}

void draw()
{
  background(21,5,5);
  tint(255,255,255,110);
  image(g, 20,20,320,383);
  fill(103,17,17,70);
  rect(0,0,400,400);
  int r = 1;
  noStroke();
  fill(int(random(150,255)),int(random(30,70)),int(random(60,105)),100);  
  while (r <= 100)
  {
    ellipse(int(random(400)),int(random(400)),int(random(40)),int(random(40)));
    r++;
  }
}


