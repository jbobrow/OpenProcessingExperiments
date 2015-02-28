
float y;
int x = 0;
float noisevalue;
float t = 0;

void setup() {
  size(500, 500);
}

void draw() {
  smooth();
  
  noisevalue = noise(t);
  y = map(noisevalue, 0, 1, -50, 50);
  
  fill(255);
  ellipse(x, y+250, 1, 1);
  
  x += 1;
  t += 0.01;
}
