

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
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) { 
      polygon(6, random(j * 40), random (i * 40), random(100));
       fill(0,random(255),random(255), random(40));
       rotate(PI/random(4));
      stroke(255, random(90));
      noLoop();
    }
  }
}


