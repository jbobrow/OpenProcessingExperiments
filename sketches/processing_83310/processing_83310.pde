
final float PHI = 1.61803398874989484820;
int counter;

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0; i < 2100; i++) {
    float x = cos(PHI * i) * (i / 5) + width / 2;
    float y = sin(PHI * i) * (i / 5) + height / 2;
    float r = i / 500.0 + 1;
    r += sin(radians(counter + i)) * 5;   
    r = abs(r);
    ellipse(x, y, r, r);
  } 
  counter += 2;
}

