
int circleSize = 0;

void setup() {
  size (400, 400);
  smooth();  
  
}

void draw(){
  background (150, 255, 50);
  fill (10, 10, 255);
  ellipse (mouseX, mouseY, circleSize, circleSize); 
  
  circleSize = circleSize + 1;
  
}

void mousePressed() {
  fill (255, 10, 10);
  ellipse (mouseX, mouseY, circleSize, circleSize); 
  circleSize = circleSize - 50;
  
}
