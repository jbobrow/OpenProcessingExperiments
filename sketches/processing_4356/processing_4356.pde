
void setup()
{
  size(530,530);
  noStroke();
  background(255);
}

float g=0,j,i,r=200,m=275,n,t=0;
void draw()
{
  smooth();
  beginShape();
  fill(65+g*300%160,0,0);
  for(i=0;i<2*PI;i+=PI/64)
  {
    j=(i>6.2)?0:i;
    n=r+(r/240*55+20)*noise(j,g,t);
    vertex(m+n*cos(j),m+n*sin(j));
  }
  endShape();
  r-=.15;
  if(r<0)noLoop();
  g+=.01;
}

void mousePressed()
{
  background(255);
  r=200;
  g=0;
  t=millis();
  loop();
}

