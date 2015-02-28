
float x;
float y;
float easing = 0.05;

void setup() {
  size(840, 860); 
  fill(170,152,15);
  
}

void draw() { 
  background(170,31,15);
  
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
  }



