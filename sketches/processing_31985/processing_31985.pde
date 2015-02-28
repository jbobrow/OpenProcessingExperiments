
void setup() {
  size(500,500);
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


  for(int i = 0; i < 25; i++) {
    for(int j = 0; j < 25; j++) { 
      polygon(6,random(j * 20),random (i * 20),100);
      fill(0,random(255),random(255),20);
      rotate(PI/random(3)); 
      polygon(4,random(j*2),random(i*2),20);
      stroke(random(255),random(100 * 10));
      noLoop();
    }
  }
}


