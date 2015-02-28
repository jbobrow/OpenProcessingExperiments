
// Interference
// Levente Sandor, 2013


ArrayList<Wave> waves = new ArrayList<Wave>();
int n;

void setup() {
  size(500, 300);

  waves.clear();

  for (int i=0; i < random(2, 10); i++) {
    waves.add(new Wave(random(0.1), 0.1, random(TWO_PI)));
  }

  n = waves.size();
}

void draw() {
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      set(x, y, interference(x, y));
    }
  }

  showInfo();

  for (int i = 0; i < n; i++) {
    waves.get(i).update();
  }
}


void showInfo() {
  stroke(0, 0);
  fill(0, 200);
  rect(10, 10, 165, 35);
  fill(255);
  textSize(15);
  text("Number of waves: " + str(n), 15, 25);
  text("(click to restart)", 15, 40);
}

color interference(int x, int y) {
  float c = 0;

  for (int i = 0; i < n; i++) {
    c += waves.get(i).amplitude(x, y);
  }

  return color(map(c / n, -1, 1, 0, 255));
}


class Wave {
  float wavelength;
  float offset;
  float offsetInc;
  float direction;

  Wave(float wavelength, float offsetInc, float direction) {
    this.wavelength = wavelength;
    this.offset = 0;
    this.offsetInc = offsetInc;
    this.direction = direction;
  } 

  float amplitude(float x, float y) {
    float ax = cos(this.direction);
    float ay = sin(this.direction);

    return sin(this.wavelength * (ax * x + ay * y) + this.offset);
  }

  void update() {
    this.offset += this.offsetInc;
  }
}


void mouseClicked() {
  setup();
}

