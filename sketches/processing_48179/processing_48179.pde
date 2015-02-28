
int g = 0;

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(204);
  noStroke();
  fill(140, 160, 255);
  ellipse(100, 100, 30, 30);
  ellipse(200, 200, 30, 30);
  
  if (mousePressed) {
    if (mouseButton == RIGHT) {
      ellipse(150, 150, g, g);
      g=g + 5;
      
    } else if (mouseButton == LEFT) {
      ellipse(100, 200, 30, 30);
      ellipse(200, 100, 30, 30);
    }
  }
}

