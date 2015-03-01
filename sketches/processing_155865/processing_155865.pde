
float x;
float y;
float easing = 0.05;
float a;
float b;



void setup() {
  size(600, 900); 
  noStroke();  
}

void draw() { 
  background(0);
  
  fill(mouseX,mouseY,200);
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
    
    
    
    float targetA = mouseX;
  float da = targetX - a;
  if(abs(da) > 1) {
    x += da * easing;
  }
  
  float targetB = mouseY;
  float db = targetY - b;
  if(abs(db) > 1) {
    y += db * easing;
  }
  
  ellipse(x, y, 66, 66);
  }
}



