
  int x = 1;

void setup() {
  size(500, 500);
  noFill();
  smooth();
  strokeWeight(3);
  background(255);
  stroke(0);
}

void draw() {
  background(255);
  for (int z = x % 14; z < 1000; z += 12) {
    ellipse(width/2,height/2,z,z);
  }
  x++;
}



