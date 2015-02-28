
float x = 100;
float y = 100;
float a = 0.0;
  float s = 0.0;

void setup() {
  size(500, 400);
  background(0);
}
void draw() {
int r = int(random(50));
  a = a + 0;
  s = cos(a)*1;
  scale(s); 
  fill(255, 0, 0);
  x = mouseX - (cos(1) * 0);
  y = mouseY - (sin(1) * 0);
  stroke(random(255), random(255), random(255));
  ellipse(x, y, random(50), random(50));
}
