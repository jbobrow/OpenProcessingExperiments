
tartStaStStint sz=512;
int rr,gr,br;  // ranges

void setup()
{
  size(sz,sz);
  background(128);
  rr=br=floor(pow(sz*sz,1.0/3));
  gr = (sz*sz)/(rr*br);
  println(rr+" "+gr+" "+br+" "+rr*gr*br+" "+sz*sz);

  int r,g,b,k,nc;
  color [] cc =new color[sz*sz];
  nc=0;
  for(r=0;r<rr;r++)
  {
    for(g=0;g<gr;g++)
    {
      for(b=0;b<br;b++)
      {
        cc[nc] = color(r*256/rr,g*256/gr,b*256/br);
        ++nc;
      }
    }
  }
  for(k=nc-1;k>0;k--)
  {
    int j = floor(random(k));
    color tmp = cc[j];
    cc[j]=cc[k];
    cc[k]=tmp;
  }
  k=0;
  int x,y;
  for(y=0;y<sz;y++)
  {
    for(x=0;x<sz;x++)
    {
      set(x,y,cc[k]);
      ++k;
    }
  }
}

float sadness(color c, int x, int y)
{
  int k = 2;
  int p,q;
  float s=0;
  for(q=-k;q<=k;q++)
  {
    for(p=-k;p<=k;p++)
    {
      if( p==0 && q==0 )
        continue;
      color d = get(x+p,y+q);
      s += dist(red(c),green(c),blue(c),red(d),green(d),blue(d));
    }
  }
  return s;
}

float evalSwap(int x1,int y1, int x2, int y2)
{
  color c1 = get(x1,y1);
  color c2 = get(x2,y2);
  
  // before and after
  float b1 = sadness(c1,x1,y1);
  float b2 = sadness(c2,x2,y2);
  float before =b1+b2;
  float a1 = sadness(c2,x1,y1);
  float a2 = sadness(c1,x2,y2);
  float after =a1+a2;
  return after-before;  // lower is less sad - i.e. better
}

int ns = 40;
float worst=100;
void draw()
{
  int mins=20,maxs=80;
  int bx1=0,by1=0,bx2=0,by2=0;
  float br=0;
  float change=0;
  
  for(int iter=0;iter<500;iter++)
  {
    for(int i=0;i<ns;i++)
    {
      int x1=floor(random(width));
      int y1=floor(random(height));
      int x2=floor(random(width));
      int y2=floor(random(height));
      float r = evalSwap(x1,y1,x2,y2);
      if( i==0 || r<br )
      {
        bx1=x1;
        by1=y1;
        bx2=x2;
        by2=y2;
        br=r;
      }
    }
    
    color tmp = get(bx1,by1);
    set(bx1,by1,get(bx2,by2));
    set(bx2,by2,tmp);

    change+=br;
  }
  if( change>0 && ns==mins )
  {
    ns=maxs;
  }
  if( change>worst )
  {
    worst = change;
    ns = maxs;
  }
  else if( ns>mins)
  {
    --ns;
  }
  println(frameRate+" "+ns+" "+change);  
}


