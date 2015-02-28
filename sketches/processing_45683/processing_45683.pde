
void setup() {
  size (500,500);
  background(0);
  smooth();
  noStroke();
  fill (150,30);
}

void draw() {
    rect (random(width),random(height),random(10,50),random(10,100));
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

void keyPressed() {
  background(0);
}

