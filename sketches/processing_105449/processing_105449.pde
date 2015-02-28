
final int s = 40;
final int boxSize = 4;

float backgroundHue = random(360);
float foregroundHue = random(360);
float maxlen;

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(640, 640);
  smooth();
  noStroke();
  frameRate(24);
  
  maxlen = sqrt(pow(width, 2) * pow(height, 2));
}

void draw() {
  background(backgroundHue, s, 100);
  translate(0,0);
  for (int x = 0; x < width; x += boxSize) {
    float powx = pow(x, 2);
    for (int y = 0; y < height; y += boxSize) {
      float len = sqrt(powx * pow(y, 2));
      fill(foregroundHue, s, 100, 100 * len / maxlen);
      rect(0, 0, boxSize, boxSize);
      translate(0, boxSize);
    }
    translate(boxSize, -height);
  }
  backgroundHue = backgroundHue + 1;
  if (360 <= backgroundHue) {
    backgroundHue -= 360;
  }
  foregroundHue = (foregroundHue + 0.3);
  if (360 <= foregroundHue) {
    foregroundHue -= 360;
  }
}


