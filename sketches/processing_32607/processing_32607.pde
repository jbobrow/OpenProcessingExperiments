

void setup() {
  size(1000, 500);
  smooth();
  background(255);
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
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) { 
      polygon(6, random(j * 20), random (i * 20), random(100));
       fill(random(255),0,random(255), random(40));
      stroke(255, random(90));
      polygon(5, random(j * 200), random (i * 200), 55);
      noLoop();
    }
  }
}


