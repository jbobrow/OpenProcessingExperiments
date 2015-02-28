
float r;
float g;
float b;
float x;
float y;
float t;
float m;

void setup()
{
  size(200,200);
  r=random(0,255);
  g=random(0,255);
  b=random(0,255);
  noStroke();
}

void draw()
{
  translate(width/2,height/2);
  if(m<=150)
  {
     for(t=0;t<=360;t=t+0.05)
     {
      fill(r,g,b);
      ellipse(sin(t)*(m),cos(t)*(m),5,5);
     }
    if(t>=360)
    {
      t=0;
      m=m+2;
     
    }
    r=r+random(-10,10);
    g=g+random(-10,10);
    b=b+random(-10,10);
  }else{
    filter(BLUR,2);
    noLoop();
  }
}

