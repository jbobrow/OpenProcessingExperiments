
void setup()
{
  size(700, 1100);
  smooth();
  colorMode(HSB, 100); 
  noLoop();
  rectMode(CENTER);
}


void draw()
{ 
  background (40);
  for (int x=0;x<width; x=x+70)
  {
    for (int y=0; y<height;y=y+110)
    {
      float sw = map(y, 0, height, 10, 30);
      float ldf = map(x+y, 0, 1000, 0, 255);
      drawLogo(x, y, random(1, 5), random(10, 40), random(30,90), random (30, 80), random (1,30), random (1,30));
    }
  }
}
void drawLogo ( float x, float y, float sw, float centerh1, float centerh2, float centerh3, float fill1, float fill2 )
{
  pushMatrix();
  translate(x, y);
  noFill();
  stroke(255, 0, 0);
  strokeWeight(sw);

  fill(fill1);
  rect (35, centerh1, 60, 30);
  noFill();
  rect (35, 55, 65, 105); 
  fill(fill2);
  rect (35, centerh2, 30, 40);
  noFill();
  rect (35, centerh3, 15, 12);

  popMatrix();
}


