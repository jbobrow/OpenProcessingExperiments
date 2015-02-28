
//Cole Pierce, CP1, mods 4-5
boolean ismoving=false;
boolean isstarting=true;
int a=0;
int b=40;
int c=0;
int d=40;
int e=0;
int f=40;
int g=0;
int h=40;
int i=0;
int j=40;
int k=0;
int l=0;
int m=0;
int n=0;
int o=0;
int p=0;

void setup()
{
  size(400, 400);
}
void draw()
{
  fill(l, m, n);
  textSize(50);
  text("hit any key ", 60, 200);
  text("to start", 110, 250);
  if (isstarting==true)
  {
    l=int(random(255));
    m=int(random(255));
    n=int(random(255));
  }
    
    if (ismoving==true)
    {
   
      a=a+int(random(-5, 5));
      b=b+int(random(-5, 5));
      c=c+int(random(-5, 5));
      d=d+int(random(-5, 5));
      e=e+int(random(-5, 5));
      f=f+int(random(-5, 5));
      g=g+int(random(-5, 5));
      h=h+int(random(-5, 5));
      i=i+int(random(-5, 5));
      j=j+int(random(-5, 5));
      k=k+int(random(-25, 25));
     
      o=int(random(20,150));
      fill(196-k, 20+k, 216-k);
      stroke(196-k, 20+k, 216-k);
      frameRate(o);
      smooth();
      background(0);
      ellipse(200+a, 200+b, 30, 30);
      fill(0);
      stroke(0);
      strokeWeight(3);
      ellipse(195+a, 200+b, 5, 5);
      ellipse(205+a, 200+b, 5, 5);
      line(195+a, 210+b, 205+a, 210+b);
      fill(196-k, 20+k, 216-k);
      stroke(196-k, 20+k, 216-k);
      line(200+a, 217+b, 200+a, 225+b);

      fill(255-k, 0+k, 0+k);
      stroke(255-k, 0+k, 0+k);
      ellipse(200+c, 200+d, 30, 30);
      fill(0);
      stroke(0);
      strokeWeight(3);
      ellipse(195+c, 200+d, 5, 5);
      ellipse(205+c, 200+d, 5, 5);
      line(195+c, 210+d, 205+c, 210+d);
      fill(255-k, 0+k, 0+k);
      stroke(255-k, 0+k, 0+k);
      line(200+c, 217+d, 200+c, 225+d);

      fill(0+k, 255-k, 0+k);
      stroke(0+k, 255-k, 0+k);
      ellipse(200+e, 200+f, 30, 30);
      fill(0);
      stroke(0);
      strokeWeight(3);
      ellipse(195+e, 200+f, 5, 5);
      ellipse(205+e, 200+f, 5, 5);
      line(195+e, 210+f, 205+e, 210+f);
      fill(0+k, 255-k, 0+k);
      stroke(0+k, 255-k, 0+k);
      line(200+e, 217+f, 200+e, 225+f);

      fill(0+k, 0+k, 255-k);
      stroke(0+k, 0+k, 255-k);
      ellipse(200+g, 200+h, 30, 30);
      fill(0);
      stroke(0);
      strokeWeight(3);
      ellipse(195+g, 200+h, 5, 5);
      ellipse(205+g, 200+h, 5, 5);
      line(195+g, 210+h, 205+g, 210+h);
      fill(0+k, 0+k, 255-k);
      stroke(0+k, 0+k, 255-k);
      line(200+g, 217+h, 200+g, 225+h);

      fill(216-k, 141-k, 20+k);
      stroke(216-k, 141-k, 20+k);
      ellipse(200+i, 200+j, 30, 30);
      fill(0);
      stroke(0);
      strokeWeight(3);
      ellipse(195+i, 200+j, 5, 5);
      ellipse(205+i, 200+j, 5, 5);
      line(195+i, 210+j, 205+i, 210+j);
      fill(216-k, 141-k, 20+k);
      stroke(216-k, 141-k, 20+k);
      line(200+i, 217+j, 200+i, 225+j);
    }
  }
  void keyPressed()
  {
    ismoving=!ismoving;
  }
