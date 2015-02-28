
float x;
float y;
float easing = 0.005;

void setup()  {
  size(640, 360);
  noStroke();
}

void draw()  {
  background(0);
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x+= dx * easing;
  }

  float targetY = mouseY;
  float dy = targetY -y;
  if(abs(dy) > 1)  {
    y += dy * easing;
  }  

  ellipse(x, y, 90, 90);
}  



