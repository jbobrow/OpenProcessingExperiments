
float w,h,a,t, f,u,n;
float bw,bh;
void setup()
{
  size(400,400,P2D);
  w=200;
  h=200;
  bw=width/w;
  bh=height/h;
  f=400;
  noStroke();
}

void draw()
{
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      //float m = 100*sin(t*i*j);
      float m = abs(200*sin(i*.05+t)-j*bh);
      float l = abs(200*cos(i*.07+a)-(j-50)*bh);
      u=map(m,0,f,0,128)+map(l,0,300,0,127);
      fill(map((int)map(u,0,255,0,n),0,n,0,255));
      rect(i*bw,j*bh,bw,bh);
    }
  }
  t+=.05;
  a+=.5*sin(t)+.25;
  f=400+noise(t*.01)*360-400;
  n=-50*cos(t*.1)+51;
}

