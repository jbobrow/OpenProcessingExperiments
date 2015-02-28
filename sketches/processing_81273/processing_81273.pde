
PFont font;
PImage img;
float x1=200;
float t1=100;
float u1=300;
float s1=150;
float w1=190;


int  q;  // Quant of time
int  k;  // copy of q
 
float y=0;
int nechto = 15;
 
void setup() {
  size(300, 300);
  fill(255);
  textSize(24);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(60);
  img = loadImage("stick.png");
        image(img,0,0);
}
 
void draw() {

  // now produce the second Wave
  q=(q+325)%50;


    text("STICKY",t1, 100);
  t1+=-9.0;
  if  (t1>width){
    t1 += -300;
  }
      text("STICKY",u1, 200);
  u1+=-9.0;
  if  (u1>width){
    u1 += -300;
  }
        text("STICKY",s1, 150);
  s1+=-8.0;
  if  (s1>width){
    s1 += -300;
  }
        text("STICKY",w1, 260);
  w1+=-9.0;
  if  (w1>width){
    w1 += -900;
  }
}


