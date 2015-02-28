
float v = 0.0;
float inc = 0.1;
int i = 0;

void setup()
{ 
  size(500,100);
  noStroke();
  fill(255);
  noiseSeed(0);
}

void draw()
{
  frameRate(10);
  float n = noise(v) * 70.0;
  smooth();
  rect(i,10+n,3,20);
  v+= inc;
  i++;
  if (i > width)
  {
    i = 0;
    fill(random(255));
  }
}


