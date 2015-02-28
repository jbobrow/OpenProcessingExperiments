
//MAIN SETUP

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  frameRate(120);
}


//ZEICHNEN

void draw() {

  background(200);

  for (int i = 0; i < 200; i = i+10) {
    for (int j = 0; j < i; j = j +10) {
      stroke(200);
      strokeWeight(3);
      rectMode(CENTER);
      rect(j+50, i+60, 10, 10);
    }
  }
}
