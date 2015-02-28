
SineWave wave1 = new SineWave(30, 300, 20);
SineWave wave2 = new SineWave(450, 50, 15);
SineWave wave3 = new SineWave(9, 150, 12);
 
void setup() {
  size(200, 900);
  background(0,240,158);
}
 
void draw() {
  fill(30,211,198);
  noStroke();
  rect(0, 0, width, height);
  noFill();
  stroke(0);
  for (int y = 0; y < height; y += 5) {
    beginShape();
    for (int x = 0; x <= width; x += 5) {
      float a = (wave1.amplitude(x, y) + wave2.amplitude(x, y) + wave3.amplitude(x, y)) * 2;
      vertex(x, y + a);
    }
    endShape();
  }
}
 
class SineWave {
  float cx;
  float cy;
  float wavelength;
   
  SineWave(float cx, float cy, float wavelength) {
    this.cx = cx;
    this.cy = cy;
    this.wavelength = wavelength;
  }
   
  float amplitude(float x, float y) {
    float dx = x - this.cx;
    float dy = y - this.cy;
    return sin((sqrt(dx * dx + dy * dy) - frameCount) / this.wavelength);
 
  }
}

