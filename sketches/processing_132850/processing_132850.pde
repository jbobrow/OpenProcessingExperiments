
// Global variables
int X = 500;
int Y = 500;

float g = -10.0;
float tstep = 0.1;

ArrayList<Particle> particles;

class Particle {
  float x, y;
  float x0, y0;
  float v_x, v_y;
  float a_y;
  float r;
  float t;
  int hue;

  Particle(float x0, float y0, float v_x, float v_y) {
    this.x0 = x0;
    this.y0 = y0;
    this.v_x = v_x;
    this.v_y = v_y;
    r = 1.0;
    t = 0.0;
    hue = int(100.0 * random(1.0));
  }

  void update() {
    x = x0 + v_x * t;
    y = y0 + v_y * t + 0.5 * g * pow(t,2);
    a_y = v_y + g * t;

    t = t + tstep;
  }

  void draw() {
    stroke(0, 0, 0);
    fill(0, 0, 100);
    ellipse(int(x), Y - int(y), int(r), int(r));
  }
}

class Star extends Particle {

  Star(float x0, float y0, float v_x, float v_y, int hue) {
    super(x0, y0, v_x, v_y);
    this.hue = hue;
    r = 3.0;
  }

  void update() {
    super.update();
    if (t > 5.0) {
      particles.remove(this);
    }
  }

  /* rewrite draw to vary brightness based on time... */
  void draw() {
    stroke(0, 0, 0);
    fill(hue, 100, 100 * cos(t/5.0 * HALF_PI));
    ellipse(int(x), Y - int(y), int(r), int(r));
  }
}

class Shell extends Particle {

  Shell() {
    // TODO: can't seem to use local variables?
    super(X * random(1.0), 0.0, 5.0, 75.0 + random(1.0) * 20.0);
    r = 3.0;
  }

  void update() {
    super.update();

    if (a_y < 0 /* t > 11.0 */) {
      float base = random(1.0) * 5.0;
      for (float angle = 0.0; angle < TWO_PI; angle = angle + TWO_PI/32) {
        float v_x = 20.0 * cos(angle) + base + random(1.0) * 2.0;
        float v_y = 20.0 * sin(angle) + base + random(1.0) * 2.0;

        Star star = new Star(this.x, this.y, v_x, v_y, this.hue);
        particles.add(star);
      }

      float type = random(1.0);
      if (type < 0.1) {         // smiley
        for (float angle = PI * 5.0/4.0; angle < PI * 7.0/4.0; angle = angle + TWO_PI/32) {
          float v_x = 10.0 * cos(angle) + base + random(1.0) * 2.0;
          float v_y = 10.0 * sin(angle) + base + random(1.0) * 2.0;

          Star star = new Star(this.x, this.y, v_x, v_y, this.hue);
          particles.add(star);
        }

        for (float angle = PI * 1.0/4.0; angle <= PI * 3.0/4.0; angle = angle + PI/2.0) {
          float v_x = 10.0 * cos(angle) + base + random(1.0) * 2.0;
          float v_y = 10.0 * sin(angle) + base + random(1.0) * 2.0;

          Star star = new Star(this.x, this.y, v_x, v_y, this.hue);
          particles.add(star);
        }
      } else if (type < 0.2) {  // ringed planet
        for (float angle = 0.0; angle < TWO_PI; angle = angle + TWO_PI/32) {
          float v_x = 40.0 * cos(angle) + base + random(1.0) * 2.0;
          float v_y = 10.0 * sin(angle) + base + random(1.0) * 2.0;

          Star star = new Star(this.x, this.y, v_x, v_y, this.hue);
          particles.add(star);
        }
      }

      particles.remove(this);
      Shell shell = new Shell();
      particles.add(shell);
    }
  }
}

void setup() {
  size(X, Y);
  colorMode(HSB, 100);
  strokeWeight(1);
  frameRate(30);

  particles = new ArrayList<Particle>();

  while (particles.size() < 10) {
    Shell shell = new Shell();
    particles.add(shell);
  }
}

// Main draw loop
void draw() {
  ArrayList<Particle> update;

  background(0, 0, 0);  // black

  update = new ArrayList<Particle>();
  for (int i = particles.size() - 1; i >= 0; --i) {
    Particle particle = particles.get(i);
    update.add(particle);
  }
  for (int i = update.size() - 1; i >= 0; --i) {
    Particle particle = update.get(i);

    particle.update();
    particle.draw();
  }
  update.clear();
}

