
float x=80,y=0;
float sx=1,sy=1;
void setup()
{
 size(200,200);
}

void mousePressed()
{
 x=random(0,200);
 y=random(0,200);
}

void draw()
{

 background(0);
 if (x>90 && x<110 && y>90 && y<110)
 {
   fill(255);
   rectMode(CENTER);
   rect(100,100,10,10);
 }
 else
 {
   rectMode(CENTER);
   fill(0,200,50);
   rect(x,y,20,20);
   fill(200,150,0);
   ellipse(x-5,y-5,4,4);
   ellipse(x+5,y-5,4,4);
   fill(50,100,255);
   triangle(x,y+5,x-5,y+10,x+5,y+10);
 }
 if (x>200||x<0)
 {
  sx=sx*-1;
 }
 else if (y>200||y<0)
 {
  sy=sy*-1;
 }
 x=x+sx;
 y=y+sy;
}
