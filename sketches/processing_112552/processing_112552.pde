
float x;
float y;
float easing = 0.1;

void setup() {
  size(500, 500); 
  stroke(0,0,0);
  strokeWeight(2); 
}

void draw() { 
  background(51,120,94);
  
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
  
  ellipse(x, y, 70, 70);
}


