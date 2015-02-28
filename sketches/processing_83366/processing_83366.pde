
float ratio = 1.5;
int counter;

void setup() {
  size(600, 600);
  noStroke();
  textSize(32);
}

void draw() {
  ratio += 0.0001;
  background(0);
  text(ratio, 10, 30); 
  for (int i = 0; i < 2100; i++) {
    float x = cos(ratio * i) * (i / 5) + width / 2;
    float y = sin(ratio * i) * (i / 5) + height / 2;
    float r = i / 500.0 + 1;
    r += sin(radians(counter + i)) * 5;   
    r = abs(r);
    ellipse(x, y, r, r);
  } 
  counter += 2;
}
