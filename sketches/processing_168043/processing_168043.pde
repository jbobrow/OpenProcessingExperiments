

float time = 0;

void setup() {
  size(800, 800);
}

void draw() {
  background(random(100));
  fill(200,200,200);
   
  float x = 0;

  while (x < width) {
    line(x, 600 + 50 * noise(x / 210, time), x, height);
    x = x + 1;
  }

  time = time + 0.08;
}







