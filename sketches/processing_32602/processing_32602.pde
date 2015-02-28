

void setup() {
  size(1000, 500);
  smooth();
  background(50);
}

void polygon(int n, float cx, float cy, float r)
{
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)), 
    cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}

void draw() {
  fill(255, random(40));
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) { 
      polygon(6, random(j * 100), random (i * 100), random(100));
      stroke(255, random(90));
      noLoop();
    }
  }
}


