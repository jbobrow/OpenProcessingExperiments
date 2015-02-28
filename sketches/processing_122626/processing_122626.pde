
float _mouseX ;

void setup() {
  size(800, 800);
  noFill();
  smooth();
}

void draw() {
  background(0);
  stroke(random(10,50),50,140);
  for (int i=width; i>0; i-=5) {
    ellipse(width/2, height/2, i, i);
    _mouseX = map(mouseX, 0, width, 0, 5);
    strokeWeight(_mouseX);
  }
}

