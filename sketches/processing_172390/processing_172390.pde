
/* @pjs font="AkzidenzGroteskBE-BoldIt.ttf"; */

PFont font;
float angle=0.0;

void setup() {
  size(600,400);
  font = createFont("AkzidenzGroteskBE-BoldIt",48); 
  textFont(font);
  noStroke();
}

void draw() {
  fill(204, 24);
  rect(0, 0, width, height);
  fill(0);
 angle+=0.02;
 pushMatrix();
 translate(300,200);
 scale((cos(angle/2.0)+1.2)*2);
 rotate(angle); 
  text("dizzy", random(-300, 300), random(-200, 200));
  popMatrix();
}



