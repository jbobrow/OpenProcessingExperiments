
Curve[] c = new Curve[10];
int zmax = 100,hue = 0;
void setup()
{
  size(600, 600);
  smooth();
  frameRate(60);
  colorMode(HSB,360,100,100);
  for (int i=0;i<c.length;i++)
  {
    c[i] = new Curve();
    c[i].z = random(0,pow(sqrt(width*width + height*height)*zmax,1/3));
  }
}

void draw()
{
  background(30);
  hue++;
  hue = hue > 360 ? 0 : hue;
  translate(width/2, height/2);
  stroke(0,0,100);
  noFill();
  for (int i=0;i<c.length;i++)
  {
    if (c[i] != null)
      c[i].render();
  }
}

class Curve
{
  float t,sp,z=0,rs,ro=0,h,s,v;
  int n;
  
  Curve()
  {
    randomize();
  }
  
  void randomize()
  {
    z = 1;
    ro = 0;
    t = random(2,10);
    sp = random(0.1,0.3);
    rs = random(-0.05,0.05);
    n = (int) random(2,10);
    v = random(0,100);
    s = 100;
    h = hue;
  }
  
  void render()
  {
   // sp -= 0.0001;
    z += sp;
    ro += rs;
      stroke(h,s,v);
      strokeWeight((t*z)/20);
      for(int i=0;i<n;i++)
      {
        arc(0, 0, (z*z*z)/zmax+5, (z*z*z)/zmax+5, TWO_PI/n*i + ro,  TWO_PI/n*(i+0.5) + ro);
      }
    if ((z*z*z)/zmax > sqrt(width*width + height*height))
      randomize();
  }
}
