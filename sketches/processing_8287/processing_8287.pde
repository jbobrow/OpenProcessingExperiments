
//sandclock by chewiehuang@yahoo.com.tw

void setup()
{
  size(200,200);
  noStroke();
  colorMode(RGB,255);
  ellipseMode(CORNER);
  smooth();
}
void draw()
{
  int hr = hour();
  int a = hr*100/24;
  int b = hr*10/24;
  int mi = minute();
  int c = mi*100/60;
  int d = mi*10/60;
  int se = second();
  float e = se*100/60;
  float f = se*10/60;
 
  background(0);
  fill(100,200,100,50);  ellipse(-100,85,400,400);
  fill(50,100,200,40);  ellipse(-100,-285,400,400);
  fill(0,0,0);  triangle(40,0,60,0,50,100);
  fill(0,0,0);  triangle(40,200,60,200,50,100);
  fill(0,0,0);  triangle(90,0,110,0,100,100);
  fill(0,0,0);  triangle(90,200,110,200,100,100);
  fill(0,0,0);  triangle(140,0,160,0,150,100);
  fill(0,0,0);  triangle(140,200,160,200,150,100);//background

  fill(255,0,0);  quad(60,0,40,0,40+b,a,60-b,a);
  fill(255,0,0);  triangle(50,100,40+b,200-a,60-b,200-a);
  fill(255,191,0);  quad(110,0,90,0,90+f,e,110-f,e);
  fill(255,191,0);  triangle(100,100,90+f,200-e,110-f,200-e);
  fill(0,195,78);  quad(160,0,140,0,140+d,c,160-d,c);
  fill(0,195,78);  triangle(150,100,140+d,200-c,160-d,200-c);
}


// schien
// nice result; need to utilize loop and better variable control

