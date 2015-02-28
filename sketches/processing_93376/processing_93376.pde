
void setup() {
  size(500,500);
  smooth();
  background(255);
}

void draw() {
   variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) {
  if (mousePressed == true) {
    float speed = abs(x-px) + abs(y-py);
    float shape = int(random (0, 100));
    float weight = int(random (0, 10));
    stroke(speed);
    ellipse(x, y, speed+shape, speed+shape);  
    strokeWeight(weight);
  }  
}


