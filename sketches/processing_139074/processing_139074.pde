
int num = 50;

void setup() {
  size(500, 500);
}

void draw() {
  fill(200, 10);
  noStroke();
  rect(0, 0, width, height);

  float ox = width*.5;
  float oy = height*.5;

  for (int i=0; i<num; i++) {
    float radius = random(width/5, width*.75);
    noFill();
    stroke(0);
    arc(ox, oy, radius, radius, PI/2, PI/2+random(PI));
  }
}

