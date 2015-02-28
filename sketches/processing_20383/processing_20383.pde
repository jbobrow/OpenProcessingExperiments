
PFont font;
PImage statue;
PImage skull;

float mappedS;

int s;
int m;
int h;

void setup() {
  size (640, 480);
  smooth();
  font = loadFont("Long.vlw");
  statue = loadImage("statue.jpg");
  skull = loadImage("skull.jpg");
}

void draw() {
  tint(255,255);
  image (statue,0,0);
  
  s=second();
  m=minute();
  h=hour()%12;
  
  float mappedS = map(s, 60, 0, 255, 0);
  tint (255,mappedS);
  image (skull, 0,0);
  
  
  textFont(font);
  fill(72,63,34,150);
  text((h + ":" + m + ":" + s), 19,450);
  
}
  
  
  
  

