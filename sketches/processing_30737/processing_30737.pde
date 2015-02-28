
void setup() {
  size(400, 400);
  smooth();
  noFill();
  strokeWeight(8);
  stroke(21, 129, 38);
  bezier(200, 230, 400, 200, -300, 400, 400, 400);
}

void draw() {
  int w = int(random(400));
  int x = int(random(400));
  int y = int(random(400));
  int z = int(random(400));
  if (dist(200, 250, w, x)<=220 && dist(200, 250, y, z)<=220) {
    noStroke();
    fill(237, 98, x, y/2);
    bezier(200, 250, 10, -140, y, z, 200, 200);
  }
}
