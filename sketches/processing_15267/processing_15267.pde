
float rx=0;
float ry=0;
float m = 0.006;
float x,y =-50;
 PFont font;
 int s1, m1, h1;
void setup() {
  size(600, 600);
  background(255,250,205);
 font = loadFont("Dialog.plain-16.vlw");
}
 
void draw()
{  
  smooth();
  fill(255,250,205,55);
  rect(0,0,width,height);
  fill(255,106,106);
   rx += 0.005;
    ry = sin(rx)*2;
     m += 0.00006;
    y += sin(m)*4;
    x += ry;
    if ((y>600)||(y<-100)){
      y = -95;      
    } else if ((x>600)||(x<-100)){
      x = -95;}   
      ellipse(x,y,2,2);
      ellipse(x-y,y+x,2,2);
  // the time scale
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI* 2) - HALF_PI;
 noFill(); 
   float xy = cos(m) * 230 + 300;
    float yx = sin(m) * 230 + 300;
    float xys = cos(s) * 40 + xy;
    float yxs = sin(s) * 40 + yx;
    float xyh = cos(h) * 120 + 300;
    float yxh = sin(h) * 120 + 300;
    float xyhm = cos(m) * 50 + xyh;
    float yxhm = sin(m) * 50 + yxh;
    float xyhms = cos(s) * 15 + xyhm;
    float yxhms = sin(s) * 15 + yxhm;
    noStroke();
    fill(255,106,106);
    ellipse (xy, yx,25,25);
    ellipse (xys, yxs,9,9);
    ellipse (xyhm, yxhm,9,9);
    ellipse (xyhms, yxhms,5,5);
    ellipse(xyh, yxh,28,28);
    noFill();
    strokeWeight(1);
    stroke(255,106,106);
    ellipse(xyh, yxh,40,40);
      strokeWeight(0.5);
    line(xy, yx,xys, yxs);
    line(xy, yx,300, 300);
    line(300, 300,xyh, yxh);
    line(xyh, yxh, xyhm,yxhm);
    line(xyhms, yxhms, xyhm,yxhm);
    noStroke();
    fill(255,106,106);
    ellipse(300,300,60,60);
    textFont(font);
      fill(255,250,205); 
   }



