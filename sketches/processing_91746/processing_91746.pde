

int circ = 200;
float n = 0.0;
float incr = 0.01;

void setup() {
  size(1280, 768);
  smooth();
  background(10, 10, 10);
  stroke(255, 255, 255, 100);
}

void draw() {

  if (mousePressed==true) {
    if (circ > 0 && circ < 10) {
      circ = 1;
    }
    circ--;
    fill(noise(n)*255, noise(n)*255, 0, 20);
    ellipse(mouseX, mouseY, noise(n)*circ, noise(n)*circ);
    n+=incr;
  }

  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      background(10, 10, 10);
    }
  }
}

void mouseReleased() {
  if (circ<40) {
    circ=200;
  }
}


