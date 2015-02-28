
PFont font;
float t=0;
float d=0;
float vel=1;
float acc=0;
int s=0;
int m=0;
int h=0;
int x=30;
int y;

void setup() {
  size(200,150,P2D);
  fill(100);
  y=height/2;
  font = loadFont("FreeSans-48.vlw");
  textFont(font, 32);
}

void draw() {
  background(240);
  
  // Show clock
  printTime(h,x,y,true);
  printTime(m,x+50,y,true);
  printTime(s,x+100,y,false);

  //Compute time flow using perlin noise. Constants have been hand-tuned to get desired behaviour
  acc=(0.2*noise(t)-0.1);
  t+=0.003;
  vel+=acc;
  vel=max(0.05,vel);
  vel=min(5,vel);
  d=d+vel;

  //Constrain hours, minutes and seconds between conventional ranges
  if (d>9) {
    d=0;
    s++;
  }
  if (s>59) {
    s=0;
    m++;
  }
  if (m>59) {
    m=0;
    h++;
  }
  if (h>23) {
    h=0;
  }
}

void printTime(int unit, int x, int y, boolean colon) {
  if (unit<10) text("0"+unit,x,y);
  else text(unit,x,y);

  if (colon) text(":",x+37,y);
}


