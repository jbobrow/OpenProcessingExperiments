
void setup() {
  size(100, 100);
  rectMode(CENTER);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(frameCount*PI/60);
  rect(0, 0, width/2, height/2);
}

