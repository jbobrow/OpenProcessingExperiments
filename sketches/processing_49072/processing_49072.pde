


int circleX = 0;

void setup () {
  
  size (300,300);
  smooth();
  
  
}

void draw () {
  
  background (255,200,200);
  ellipse (mouseX, mouseY,circleX,circleX);
  
  circleX = circleX +1;
  
}

