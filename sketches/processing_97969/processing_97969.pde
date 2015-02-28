
float x;
float y;
float easing = 1;

void setup() {
  size(400, 400); 
  noStroke();  
}

void draw() { 
  background(#87A96B);
  
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
  
  ellipse(x, y, 50, 50);
}



