

PImage img;  


void setup() {
  size(500,500);
  img = loadImage("plate.png");
    strokeWeight(20.0);
  stroke(255, 100);
}

void draw() {
  background(0);
  image(img,0,0); 
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}
  
void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}




  




