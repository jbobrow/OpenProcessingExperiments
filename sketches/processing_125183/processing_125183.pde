
int numDots = 200;

PVector[] v1 = new PVector[numDots];
PVector[] size = new PVector[numDots];

void setup () {
  size(400,400);

  for (int i = 0; i < numDots; i++) {
    v1[i] = new PVector(random(width), random(height));
    size[i] = new PVector(random(1, 20), random(1, 20));

  }

  noLoop();
  smooth();
}

void draw () {
  background(0);
  for (int i = 0; i < numDots; i++) {
  
  fill(0);
  noStroke();
  ellipse(v1[i].x, v1[i].y, size[i].x, size[i].y);
  
  }
}
