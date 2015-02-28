
void setup() {
  size (800, 500);
  frameRate(4);
  colorMode(RGB);
  background (0, 0, 0);
  smooth();
}

void draw() {
  for (int i=10; i < height; i+=10) { 
    stroke (255, 255, 255);
    if (mouseY > height/2) {
      stroke(random(255), random(255), random(255));
    } 
    else {
      stroke (0, 0, 0);
    } 
    if (mouseX > width/2) {
      strokeWeight(random (1, 4));
    } 
    else {
      strokeWeight (1);
    }
    line(0, i, 800, i);
  }
}


