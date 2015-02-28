
PFont f;

int x1;
int y1;
int x2;
int y2;
int x3;
int y3;


void setup () {
  size (800, 600);
  background (200,130,130);
  smooth ();
  f = createFont ("Verdana Bold", 16, true);
  
  x1 = width/2;
  y1 = height/2;
  x2 = x1;
  y2 = y1;
  x3 = x1;
  y3 = y1;
}

void draw () {
  
  textFont (f, 32);
  fill (255, 235, 215);
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (255, 235, 215);
  text ("created with Processing and Processing.js", 20, 20);
  
  x2 = constrain ((x2-20+(round(random(40)))), -30, width-50);
  y2 = constrain ((y2 - 20 + (round(random(40)))), -30, height-100);
  smooth();
  fill (random (255));
  triangle (x1,y1,x2,y2,x3,y3);
  x3=x2;
  y3=y2;
 
}


