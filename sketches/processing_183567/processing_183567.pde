
void setup() {
  size(400, 100);
  colorMode(HSB);
}
void draw() {
  loadPixels();
  for(int x=0; x<width; x++) {
    for(int y=0; y<height; y++) {
      float f = frameCount / 50.0;
      float k = 1 + 0.5*sin(f*0.1);
      float n = 20 *
        sin(f + sin(k*y/99.0)*k*x/161.0 - k*y/323.0) *
        sin(-f*0.8 - k*x/249.0 + sin(k*x/79.0)*k*y/118.0);
      pixels[x + y*width] = color(128 + 128 * sin(n), 255, 255);
    }
  }
  updatePixels();
}
