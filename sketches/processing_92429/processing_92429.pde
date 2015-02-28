
float noiseScale=0.02;
float t;

void setup() {
  size(500, 230);
  colorMode(HSB, 360, 100, 100);
  smooth();
}

void draw() {
  background(360);
  for (int i = 0; i < 7; i++) {
    for (int x = 0; x < width; x++) {
      float noiseVal = noise(x*noiseScale, t*4*noiseScale);
      stroke(noiseVal*i*50, 40, 100);
      line(x, noiseVal*80+i*30, x, height);
    }
    t+=0.25;
  }
}



