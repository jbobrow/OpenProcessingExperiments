
//Dan-Tran Cong-Huyen, Ticklish Penguin, CP1 16/17
int x = 10;
int y = 9;
int v = 5;
int d = 4;
int w = 7;
int e = 6;
void setup()
{
  size(400,400);
  noStroke();
  background(73,219,191);
}
void draw()
{
 size(400,400);
 noStroke();
 background(73,219,191);
 fill(133,73,219);
 ellipse(200+x,200+y,120,120);
 x = x + int(random(-4,4));
 y = y + int(random(-7,7));
 if(x < 0)
 {
   x = x - int(random(-4,4));
 }
 if(x > 300)
 {
   x = x - int(random(0,4));
 }
 if( y > 300)
 {
   y = y - int(random(-7,7));
 }
 if( y < 0)
 {
   y = y - int(random(-7,7));
 }
 fill(17,131,62);
 ellipse(100+v,100+d,70,70);
 v = v + int(random(-4.5,4.5));
 d = d + int(random(-8,8));
 if(v > 400)
 {
   v = v - int(random(0,4.5));
 }
 if(v < 0)
 {
   v = v - int(random(-8,8));
 }
 if( d > 400)
 {
   d = d - int(random(0,8));
 }
 if( d < 0)
 {
   d = d - int(random(-8,8));
 }
 fill(102,106,106);
 ellipse(200+w,300+e,50,50);
 w = w + int(random(-3.5,3.5));
 e = e + int(random(-6,6));
 if( w > 150)
 {
   w = w - int(random(0,3.5));
 }
 if(w < 0)
 {
   w = w - int(random(-7,7));
 }
 if(e > 400)
 {
   e = e - int(random(0,6));
 }
 if(e < 0)
 {
   e = e - int(random(-6,6));
 }
}
