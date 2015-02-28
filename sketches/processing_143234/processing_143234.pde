
void setup() {
  size(600, 600);
  smooth();
  background(255);
  colorMode(HSB,width);
}

void draw() {
  background(0);
  
  noFill();  
  if (mousePressed) {
    for (int i=20; i<width; i+=10) {
        stroke(i,600,600);
        bezier(i, 0, mouseX, mouseY, pmouseX, pmouseY, i, height);
    }
  }
}

