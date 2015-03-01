
void setup()
{
  size(1000, 1000);
  background(0);
}

void draw()
{
  translate(500, 500);
  float k=0.86602540378;
  for (float r=500; r>0; r/=2) {
    fill(0, 0);
    strokeWeight(2);
    stroke(random(255),random(255),0,random(255));
    ellipse(0, 0, r, r);
    triangle(0, -r, -k*r, r/2, k*r, r/2);
    triangle(0, r, -k*r, -r/2, k*r, -r/2);
  }
}
