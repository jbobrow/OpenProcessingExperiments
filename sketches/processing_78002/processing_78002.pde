
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
  float SPEED = 1;
  float ch;
  float r;
  float t;
  float theta;
  float range1 = 150;
  float range2;
  PVector vector;
  PVector momentum;
  
  Dot() {
    float pm1 = (random(1)> 0.5)? 1: -1;
    float pm2 = (random(1)> 0.5)? 1: -1;
    float x_spd = pm1 * random(SPEED/10, SPEED);
    float y_spd = pm2 * random(SPEED/10, SPEED);
    range2 = random(range1);
    theta = random(TWO_PI);
    t = random(TWO_PI);
    ch = random(360);
    r = random(1, 15);
    vector = new PVector(range2*cos(theta), range2*sin(theta));
    momentum = new PVector(x_spd,y_spd);
  }

  Dot display() {
    for (int i = 0; i < 5;i++) {
      strokeWeight(r-(r/5*i));
      stroke(ch, 50+i*5, 100, 10 * abs(sin(t)));
      point(vector.x, vector.y);
    }
    return this;
  }
  Dot move() {
    vector.add(momentum);
    t += 0.05;
    vector.limit(range1);//@+
    //if (vector.mag() > range1) {
    //  momentum.mult(-1);
    //}
    return this;
  }
}
