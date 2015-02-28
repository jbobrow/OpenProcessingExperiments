


float x;
float y;
float easing = 0.05;

void setup() {
  size(840, 640); 
  colorMode(HSB, height, height, height);
  noStroke();  
}

void draw() { 
  background(127, 255, 212);
  
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
  
  ellipse(x, y, 66, 66);
  ellipse(x, 400, y, 66);
  ellipse(x, 400, 66, y);

    fill(mouseY, height, height);


 }
  


 
