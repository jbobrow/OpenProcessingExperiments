
//  R.A. Robertson 2009.08 "Tendril Chain" ~ www.rariora.org ~
void setup() {
  size (600, 400);
  background(30, 30, 11);
  noFill();
  stroke (255, 75);
  smooth();
}

void draw() {
  float x = width/2;
  float y = height/2;

  for (int j = 0; j < 15; j++) {

    float seg = 100; // # segments (iterations)
    float d = 20; // diameter
    float dim = d; // reduce proportionally to diameter
    float spaceX = 2 * random(-1, 1); // spacing between segments
    float spaceY = 2 * random(-1, 1);
    float angleX = PI * random(0, 2);
    float angleY = PI * random(0, 2);
    float ampX = (random(1, 4)); // Trig function amplitude. Default = 2.
    float ampY = (random(1, 4));
    float tight = random(.99, 1.001);
    float freqX = random(.01, .1); // Trig function frequency. Default = .08. Range .01 up to .1.
    float freqY = random(.01, .1);

    for (int i=0; i < seg; i++) {

      d = d - (dim/seg); // Reduce diameter proportional to # iterations
      x = x + spaceX;
      y = y + spaceY;
      x = x + sin(angleX) * ampX; // Add values to angle for variation. + 0.4 is a good default.*
      y = y + sin(angleY) * ampY; // Also, add multipliers to amp. > 1 < 2 is a good range.

      angleX = angleX + freqX;
      angleY = angleY + freqY; // Use multiplier on freq for Lissajous effects.

      ampX = ampX * tight; // Tighten or loosen coils. Default .993.
      ampY = ampY * tight;

      ellipse (x, y, d, d);
    }
  }
  noLoop();
}
void mousePressed() {
  background(30, 30, 11);
  loop();
}

