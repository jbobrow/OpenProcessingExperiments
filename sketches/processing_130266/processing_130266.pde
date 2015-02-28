
SineWave wave1 = new SineWave(250, 300, 10);
SineWave wave2 = new SineWave(350, 150, 5);
SineWave wave3 = new SineWave(50, 350, 2);

void setup() {
  size(300, 300);
}

void draw() {
  fill(255);
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
