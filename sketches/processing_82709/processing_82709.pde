
import netscape.javascript.*;


float x;
float y;
float easing = 0.05;
PImage bkg;
PImage guy;

void setup() {
  size(500, 400); 
  bkg = loadImage("2.gif");
  guy = loadImage("walkingdude.png");
}

void draw() { 
  background(bkg);
 
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  image(guy, x, y);
}



