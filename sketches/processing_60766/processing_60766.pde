
void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {

  fill(255, 0, 0);
  noStroke();
  rectMode(CENTER);
  for (int i=0 ;i<=400; i=i+20) {
    rotate(15);
    for (int j=0 ;j<=400; j=j+20) {
      fill(i, j, 0);
      rect(i, j, 10, 10);
    }
  }
}


