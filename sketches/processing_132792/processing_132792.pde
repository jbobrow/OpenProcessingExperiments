
void setup() {
  size(1280, 720);
  background(0);
  int polyCount = 100;
  int sideCount = 0;
  float radius = 0.0;
  float rotation = 0.0;
  noStroke();
  
  for (int i=0; i<polyCount; i++) {
    sideCount = int(random(3, 8));
    radius = random(100, 200);
    rotation = random(TWO_PI);
    pushMatrix();
    translate(random(width), random(height));
    rotate(rotation);
    polygon(sideCount, radius);
    popMatrix();
  }
}
void polygon (int sideCount, float radius)
{
  float theta = 0.0;
  float x = 0.0;
  float y = 0.0;
  
  beginShape ();
  for (int i=0; i<sideCount; i++) {
    x = cos(theta)*radius;
    y = sin(theta)*radius;
    vertex(x,y);
    theta += TWO_PI/sideCount;
    stroke(random(0,255), random(0,255), random(0,255), 50);
    fill(random(0,255), random(0,255), random(0,255), random(40,100));
    
  }
  endShape(CLOSE);
} //end polygon


