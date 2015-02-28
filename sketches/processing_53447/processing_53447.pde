
//copyright benjamin corwin 2012
float c;
void setup()
{
  size(400,400);
  background(250);
  smooth();
}
void draw()
{
  c = c + .01;
  float x = 10;
  while (x < width)
  {
    stroke(0);
    strokeWeight(sq(2*cos(c)));
    line(x,0,x,height);
    line(0,x,width,x);
    x = x + 10;
    squRandom();
  }
}

void squRandom()
{
  color c1 = color(255*cos(c), 255-cos(c)*255, cos(.1*c)*255);
  stroke(c1);
  noFill();
  frameRate(30);
  float x = random(0,width);
  float y = random(0,height);
  rect(x,y, 10,10);
  
}

