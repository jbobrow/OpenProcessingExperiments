
boolean x = false;

int a = int(random(600));
int b = int(random(600));
int c = int(random(600));
int d = int(random(600));

int i = int(random(600));
int j = int(random(300));
int k = int(random(600));
int l = int(random(300));
int m = int(random(600));
int n = int(random(300));
int o = int(random(600));
int p = int(random(300));
int mstarx = int(random(600));
int mstary = int(random(300));
int s = int(random(600));
int t = int(random(300));
int u = int(random(600));
int v = int(random(300));

void setup()
{
  size(600, 450);
  strokeWeight(4);
  frameRate(25);
  stroke(255, 255, 217);
}

void draw()
{
  int e = int(random(-100, 100));
  int f = int(random(-100, 100));
  int g = int(random(-100, 100));
  int h = int(random(-100, 100));
  a = a + e;
  b = b + f;
  c = c + g;
  d = d + h;

  if (a > 400)
  {
    x = true;
  } 
  else {
    x = false;
  }

  if (x)
  {
    a = a - 2 * (a - 400);
  }
  if (!x)
  {
  }

  if (b > 400)
  {
    x = true;
  } 
  else {
    x = false;
  }
  if (x)
  {
    b = b - 2 * (b - 400);
  }
  if (!x)
  {
  }

  if (c > 400)
  {
    x = true;
  } 
  else {
    x = false;
  }
  if (x)
  {
    c = c - 2 * (c - 400);
  }
  if (!x)
  {
  }

  if (d > 400)
  {
    x = true;
  } 
  else {
    x = false;
  }
  if (x)
  {
    d = d - 2 * (d - 400);
  }
  if (!x)
  {
  }

  if (a < 0)
  {
    x=true;
  } 
  else {
    x=false;
  }
  if (x)
  {
    a = -a;
  }

  if (b<0)
  {
    x=true;
  } 
  else {
    x=false;
  }
  if (x)
  {
    b=-b;
  }

  if (c<0)
  {
    x=true;
  } 
  else {
    x=false;
  }
  if (x)
  {
    c=-c;
  }

  if (d<0)
  {
    x=true;
  } 
  else {
    x=false;
  }
  if (x)
  {
    d=-d;
  }
  background(0, 0, 50); //navy background
  strokeWeight(0); //no border for the green ground
  stroke(0, 102, 0); //green border for ground
  fill(0, 102, 0); //fill the rectangle to make green ground
  rect(0, 300, 600, 150); //green ground
  noFill(); //cancels the green filling for future convencience

  stroke(255, 255, 217); //make lightning yellow-white
  strokeWeight(4); //give lightning thickness
  line(a, 0, b, 100); //top part of lightning
  line(b, 100, c, 200); //middle part of lightning
  line(c, 200, d, 300); //lower part of lightning

  strokeWeight(3); //make arcs thick enough
  stroke(255, 122, 0); //make arcs orange
  arc(d, 300, random(40, 70), random(20, 50), random(0, TWO_PI), random(0, TWO_PI));
  //make arcs of random heighth, width,position, and length at strike
  arc(d, 300, random(40, 70), random(20, 50), random(0, TWO_PI), random(0, TWO_PI));
  //do it again
  arc(d, 300, random(40, 70), random(20, 50), random(0, TWO_PI), random(0, TWO_PI));
  //and again
  arc(d, 300, random(40, 70), random(20, 50), random(0, TWO_PI), random(0, TWO_PI));
  //again
  arc(d, 300, random(70, 100), random(20, 70), random(0, TWO_PI), random(0, TWO_PI));
  //again, slightly bigger
  arc(d, 300, random(70, 100), random(20, 70), random(0, TWO_PI), random(0, TWO_PI));
  //again

  i=i-1; //moves stars to the left each frame
  k=k-1;
  m=m-1;
  o=o-1;
  mstarx=mstarx-1;
  s=s-1;
  u=u-1;

  if (i<0)
  {
    i=i+600;
  }
  if (k<0)
  {
    k+=600;
  }
  if (m<0)
  {
    m+=600;
  }
  if (o<0)
  {
    o+=600;
  }
  if (mstarx<0);
  {
    mstarx+=600;
  }
  if (s<0)
  {
    s+=600;
  }
  if (u<0)
  {
    u+=600;
  }


  strokeWeight(5); //set size of stars
  stroke(255, 255, 255); //make stars white
  point(i,j);
  point(k,l);
  point(m,n);
  point(o,p);
  point(mstarx,mstary);
  point(s,t); //plots all stars
  point(u,v);
  
  int aa = int(random(600));
  int ab = int(random(600));
  int ac = int(random(600));
  int ad = int(random(600));
  int ae = int(random(600));
  int af = int(random(600));
  int ag = int(random(600));
  int ah = int(random(600));
  int ai = int(random(600));
  int aj = int(random(600));
  int ak = int(random(600));
  int al = int(random(600));
  
  int ba = int(random(-90,320));
  int bb = int(random(-90,320));
  int bc = int(random(-90,320));
  int bd = int(random(-90,320));
  int be = int(random(-90,320));
  int bf = int(random(-90,320));
  int bg = int(random(-90,320));
  int bh = int(random(-90,320));
  int bi = int(random(-90,320));
  int bj = int(random(-90,320));
  int bk = int(random(-90,320));
  int bl = int(random(-90,320));
  
  strokeWeight(2); //make rain 2 pixels thick
  stroke(128,128,230); //make rain blue-grey
  line(aa,ba,aa,ba+90);
  line(ab,bb,ab,bb+90);
  line(ac,bc,ac,bc+90);
  line(ad,bd,ad,bd+90);
  line(ae,be,ae,be+90);
  line(af,bf,af,bf+90);
  line(ag,bg,ag,bg+90);
  line(ah,bh,ah,bh+90);
  line(ai,bi,ai,bi+90);
  line(aj,bj,aj,bj+90);
  line(ak,bk,ak,bk+90);
  line(al,bl,al,bl+90);


}


