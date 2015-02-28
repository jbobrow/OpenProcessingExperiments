
void setup() {
  size(500, 500);
  colorMode(HSB);
  smooth();
  noStroke();
  background(0);
  noLoop();
}

void draw() {
  translate(200, 200);
  float d = 1.5;
  float v0 = 20;
  for (int i = 0; i < 144 ; i += int(random(3))) {
    float h = random(20);
    float s = random(102);
    for (float t = 0.0; t < 100.0; t += 0.05) {
      fill(h, 102 + s, 255, 255 - t*10);
      ellipse(v0*t*cos(i*PI/72), 0.5*t*t+v0*t*sin(i*PI/72) , d-t/50, d-t/50);
    } 
  }
}

