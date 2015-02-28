


float wave[] = new float[480];  // hard-coded to width before size() is called.


void setup() {
  size(480, 320);
  smooth();

  // Initialize values inside wave[] to 0
  for (int i = 0; i < wave.length; i++) {
    wave[i] = 0;
  }
}



void draw() {
  background(100);
  stroke(255);

  // Center the coordinate grid vertically
  translate(0, height/2);

  generateSine();
  shapeWave();
  drawWave();
}



void generateSine() {
  float a = PI;                                            // Ramp positively
  float freq = map(mouseX, 0, width, TWO_PI/500.0, PI);   // TWO_PI = 360 degrees
  float depth = 50;

  for (int i = 0; i < wave.length; i++) {
    wave[i] = sin(a) * depth;
    a += freq;
  }
}



void shapeWave() {
  float yOffset = map(mouseY, height, 0, 100, -100);   // Y-offset in pixels
  for (int i = 0; i < wave.length; i++) {
    if (wave[i] > 0) {
      wave[i] = wave[i] + yOffset;
    }
  }
}



void drawWave() {
  for (int i = 0; i < width -1 ; i++) {     // width - 1 because we're referring to [i] + 1 when drawing the line.
    line(i, wave[i], i + 1, wave[i +1]);
  }
}






