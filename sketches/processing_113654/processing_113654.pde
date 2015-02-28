
/* 
@pjs preload="kyle-small.jpg,kyle-mask-small.png"; 
*/


PImage spokane;
PImage kyle;
PImage mask;

float h = 0; // hue
float a = 0; // alpha

float s = 1; // spaz range
float sd = 0; // spaz distance
float sx, sy; // spaz x,y

void setup() {
  size(500, 500);
  colorMode(HSB);
  spokane = loadImage("kyle-small.jpg");
  kyle = loadImage("kyle-small.jpg");
  mask = loadImage("kyle-mask-small.png");
  kyle.mask(mask);
  
  cursor(HAND);

  image(spokane, 0, 0, width, height);
}

void draw() {
  //tint(255, 111);
  noTint();
  image(spokane, 0, 0, width, height);
  
  sd = dist(mouseX, mouseY, 260, 375);
  s = map(sd, 0, height, 11, 1);

  h += s*4;
  if(h>255) h=0;
  a = map(sd, 0, height, 255, 0);
  tint(h, 128, 255, a);
  
  sx = random(-s, s);
  sy = random(-s, s);
  image(kyle, sx, sy, width, height);
  
  println(mouseX+" "+mouseY);
}



