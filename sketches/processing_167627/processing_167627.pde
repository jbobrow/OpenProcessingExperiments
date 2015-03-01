
/* @pjs font = "Dialog-48.vlw"; */

PFont font;
float x1 = 0;
float x2 = 100;


void setup (){
  size (300, 100);
  font  = loadFont ("Dialog-48.vlw");
  textFont (font);
  fill (172, 247, 212);
  
}

void draw (){
  background (10, 142, 79);
  text ("Motion", x1, 50);
  text ("Motion", x2, 100);
  x1 += 2.0;
  if (x1 > 300) { x1 -= 300; }
  x2 -= 0.5;
  if (x2 < -300) { x2 = 300; }
  
}

  




