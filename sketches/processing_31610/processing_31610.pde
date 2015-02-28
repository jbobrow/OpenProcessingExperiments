
/* henderson[###] */

float time;

void setup() {
  size(470, 360);
  smooth();
}

void draw() {
  background(255);
  loadPixels();
  for (int i=1; i<width-1; i++) {
    for (int j=1; j<height-1; j++) {
      pixels[j*width+i] = color(sineWave(255, i*j, 10, sineWave(155, i*j, 10, time)));
    }
  }
  updatePixels();
  time+=0.001;
}

float sineWave(float a, float t, float freq, float phase) {
  float sine = (a*(sin(radians(freq*t)+phase)));
  sine = map(sine, -a, a, 0, a);
  return sine;
}


