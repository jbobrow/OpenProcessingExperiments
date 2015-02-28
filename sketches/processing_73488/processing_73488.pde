
float a1=0.0, d1=22, r1, x10, x11, x12, y10, y11, y12;
float a2=PI, d2=30, r2, x20, x21, x22, y20, y21, y22;
PImage img;

float re1=255, gr1=0, bl1=0;
float re2=255, gr2=255, bl2=255;
  
void setup() {
  background(0);
  size(600, 600);
  x10=x20=width/2;
  y10=y20=height/2;
  smooth();
  colorMode(RGB, 100);
  frameRate(40);
  img = loadImage("boo.png");

}
  
void draw() {

  spiral2();

  spiral1();
  
  image(img, x10-90, y10-100);
}

void spiral1() {
  
  fill(re1, gr1, bl1, 10);
  rect(0, 0, width, height);
  stroke(re1, gr1, bl1);
  r1=height/160;
   
  for(int i=0; i<d1*10; i++) {
    x11=x10+r1*cos(a1+TWO_PI*i/d1);
    y11=y10+r1*sin(a1+TWO_PI*i/d1);
    r1+=2;
    x12=x10+r1*cos(a1+TWO_PI*(i+1)/d1);
    y12=y10+r1*sin(a1+TWO_PI*(i+1)/d1);
      line(x11, y11, x12, y12);
  }
  a1+=TWO_PI/d1/7;

}

void spiral2() {
  
  fill(0, 0, 0, 4);
  rect(0, 0, width, height);
  stroke(re2, gr2, bl2);
  r2=height/164;
   
  for(int i=0; i<d2*10; i++) {
    x21=x20+r2*cos(a2+TWO_PI*i/d2);
    y21=y20+r2*sin(a2+TWO_PI*i/d2);
    r2+=2;
    x22=x20+r1*cos(a2+TWO_PI*(i+1)/d2);
    y22=y20+r1*sin(a2+TWO_PI*(i+1)/d2);
      line(x21, y21, x22, y22);
  }
  a2+=TWO_PI/d2/7;

}


