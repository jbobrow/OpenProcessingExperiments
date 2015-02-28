
float x;
float y;
float easing = 0.30;

void setup() {
  size(640, 360); 
  noStroke();  
}

void draw() { 
  //background(#0F41F2);
  fill(#0F41F2,130);
  rect(0,0,width,height);
  
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
  fill (0);
  ellipse(x, y, 20, 20);
}



