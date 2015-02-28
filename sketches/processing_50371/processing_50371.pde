
static final float PHI = (sqrt(5) - 1) / 2;

static final int R = 160;   // Radius of disc
static final int N = 12;    // Number of rings
static final int T = 2000;  // Period of cycle (in milliseconds)

color chroma(float p) {
  return color(0xff * sq(sin(p * PI)),
               0xff * sq(sin((p + 1.0/3.0) * PI)),
               0xff * sq(sin((p + 2.0/3.0) * PI)));
}

void setup() {
  int s = int(2 * R * sqrt(2));
  size(s, s);
  noStroke();
  smooth();
}

void draw() {
  background(0xff);
  for (int k = N; k > 0; k--) {
    float d = 2 * R * sqrt(float(k) / N);
    fill(chroma(k * PHI + float(millis()) / T));
    ellipse(width / 2, height / 2, d, d);
  }
}

