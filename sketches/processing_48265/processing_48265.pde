
void setup () {
  size(500, 500);
  background(0);
  smooth();
  noLoop();
}

void draw() {
  for (int i=0; i< 150; i++) {
    Bubble(2000-i, (5000-i)*100, int(random(5+(i/1)+20)), int(random((i/1)+20)), 
    int (random(0, height)), int(random(0, width)),int (random (0, 255)));
  }
}


void Bubble(int gray, int weight, float e, float r, int y, int x, int q) {
  stroke(gray);
  strokeWeight(weight);
  fill(0, 120);
  rect(y, x, e, r);
  noFill();
  strokeWeight(e);
  stroke(255, 75);
  bezier(y, x, x, y,x, y, x, y);
  triangle(y,x,y,x,y,x);
}


