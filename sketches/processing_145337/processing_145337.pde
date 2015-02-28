
int xv = 0;
int yv = 0;
int xv2 = 600;
int yv2 = 600;
int wv = 10;
int hv = 10;
int count = 0;
int siz;
int e_count=0;

void setup()
{
  size(600,600);
  frameRate(60);
}

void draw()
{
  
siz = width/4;
    colorMode(HSB, 460, 100, 100);
    noStroke();
    ellipseMode(RADIUS);
    rectMode(RADIUS);
  
   if (count <= 300) 
   {
     float hue = random(0,900);
     fill(hue, 100, 100);
     ellipse(xv,yv,wv,hv);
     ellipse(xv2,yv2,wv,hv);
     ellipse(xv,yv2,wv,hv);
     ellipse(xv2,yv,wv,hv);
     xv2--; yv2--;
     xv++; yv++; wv++; hv++;
     count++;
   }
   if (count > 300 && count <= 500)
   {
         for (int x = 0; x <= width; x+=siz) 
    {
        Gradient(width,height);
        count++;
    }
   }
   if (count > 500 && count <1200)
   {
   strokeWeight(random(10));
   stroke(random(0,255),random(0,255),random(0,255));
   line(300,300,random(0,600),random(0,600));
   count ++;
   }
   if (count >= 1200 && count <= 2000)
   {
     float hue = random(0,600);
     fill(hue, 100, 100);
     rect(xv,yv2, xv, yv2);
     xv2--;xv++;yv2--;
     count++;
   }
}
   void Gradient(float s, float t){
  int radius = 1024;
  float h = random(0, 600);
  for (int r = radius; r > 0; --r) {
    fill(h, 100, 400);
    ellipse(300, 300, r, r);
    h = (h + 1) % 360;
  }
  }


