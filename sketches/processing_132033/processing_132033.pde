
// For Loop

void setup() {
  size(480, 480);
  smooth();
  noStroke();
  rectMode(CENTER);
  background(40, 140, 140);
}


void draw() {

  for (int i = 5; i < width; i += 5) {
    fill(i*2,i/2,i);
    rect(i, height/2, 2, i);
  }
}



