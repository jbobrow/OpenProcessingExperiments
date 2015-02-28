

PFont font;
int x;
int y;

void setup() {
  size(600, 400);
 
  colorMode(HSB);
  
 noCursor();
  font = loadFont("AmericanTypewriter-CondensedLight-55.vlw");
  textFont(font);
}
 
void draw() {
   background(0);
  noStroke();
  smooth();
  x = (x+1) % 150;
  y = (y-1) % 100;
 
  float s = map(second(), 0,60,0,400);
  float m = map(minute(), 0,60,0,400);
  float h = map(hour(), 0,24,0,400);


  fill(x,255,255,50);
  rect (0, 200, s, 400);
  fill(y,255,255,50);
  rect(0, 50, m, 400);
  fill(x,255,255,50);
  rect(400, 0, h, 400);
   
  int a = second();
  int b = minute();
  int c = hour();
 
  String t = nf(c,2) + ":" + nf(b,2) + ":" + nf(a,2) ;
 
fill(0);
  text(t, mouseX, mouseY);
  
}


