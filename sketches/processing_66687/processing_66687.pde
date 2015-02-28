
void setup() {
  size(500, 500);
  background(0);
  smooth();
}
void draw() {

  for (int i=0; i<30; i+=2) {
    squarefunction (i, i);
  }
}

void squarefunction (int aa, int bb) {


  if (mouseY>width/2) {
    fill(254, random(255), random(100));
}


  rect(mouseX, mouseY, aa, bb);
  rectMode(CENTER);
  fill(200, 50, random(255));
}


