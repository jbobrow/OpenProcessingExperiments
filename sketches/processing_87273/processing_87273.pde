
float v = 0.0;
float inc = 0.1;
int i = 0;
int t = 0;
float a1,a2,a3;
float b1,b2,b3;

void setup()
{ 
  size(255,200);
  background(255);
  noStroke();
  a1 = random(255);
  a2 = random(255);
  a3 = random(255);
  fill(a1,a2,a3); 
  noiseSeed(0);
}

void draw()
{
  frameRate(random(5,40));
  float n = noise(v) * 70.0;
  smooth();
  fill(a1,a2,a3,t);
  rect(i,50+n,3,20);
  v+= inc;
  i++;
  t++;
 
  if (i > width)
  {
    i = 0;
    t = 0;
    b1 = random(255);
    b2 = random(255);
    b3 = random(255);
    a1 = b1;
    a2 = b2;
    a3 = b3;
    background(255);
  }
}


