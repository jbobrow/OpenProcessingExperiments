
/* @pjs font = "AltoPro-Thin-48.vlw"; */

PFont font;
float angle = 0.0;
float speed = 0.05;
float radius = 30.0;
float sx = 2.0;
float sy = 2.0;

void setup (){
  size (300, 300);
  noStroke ();
  smooth ();
  font  = loadFont ("AltoPro-Thin-48.vlw");
  textFont (font);
  
}

void draw (){
  fill (0,4);
  rect (0, 0, width, height);
  angle += speed;
  float sinval = sin (angle);
  float cosval = cos (angle);
  float x = 50 + (cosval * radius);
  float y = 50 + (sinval * radius);
  fill (255, 10);
  text ("quietly", mouseX, mouseY);
  
}




