
void setup() {
  size(1000,500);
  smooth();
  background(255);
}

//polygon creator
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

noFill();
  for(int i = 0; i < 25; i++) {
    for(int j = 0; j < 25; j++) { 
      polygon(6,random(j * 30),random (i * 20),random(100));
      noLoop();
    }
  }
}



