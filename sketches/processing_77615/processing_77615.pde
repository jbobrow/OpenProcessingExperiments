
int MAX_DOTS = 500;
ArrayList<Dot> dots = new ArrayList<Dot>();

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  for (int i = 0; i < MAX_DOTS;i++) {
    dots.add(new Dot());
  }
}

void draw() {
  //background(0);
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);

  pushMatrix();
  translate(width/2, height/2);
  for (Dot dot :dots) {
    dot.move().display();
  }
  popMatrix();
}
class Dot {
  float x_spd, y_spd;
  float spd= 1;
  float ch;
  float r;
  float t;
  float pm1, pm2;
  float theta;
  float range1 = 150;
  float range2;
  float x;
  float y;

  Dot() {
    pm1 = (random(1)> 0.5)? 1:  -1;
    pm2 = (random(1)> 0.5)? 1: -1;
    x_spd = pm1 * random(spd/10, spd);
    y_spd = pm2 * random(spd/10, spd);
    t = random(TWO_PI);
    ch = random(360);
    r = random(1, 15);
    theta = random(TWO_PI);
    range2 = random(range1);
    x = range2*cos(theta);
    y = range2*sin(theta);
  }

  Dot display() {
    for (int i = 0; i < 5;i++) {
      strokeWeight(r-(r/5*i));
      stroke(ch, 50+i*5, 100, 10 * abs(sin(t)));
      point(x, y);
    }
    return this;
  }
  Dot move() {
    x += x_spd;
    y += y_spd;
    t += 0.05;
    if (mag(x, y) > range1) {
      x_spd *= -1;
      y_spd *= -1;
    }
    return this;
  }
}
