
final int NUMSTARS = 1000;

Star[] s;

void setup() {
  size(640, 640);
  s = new Star[NUMSTARS];
  for (int i = 0; i < NUMSTARS; i ++)
    s[i] = new Star();
}

void draw() {
  background(0);
  for (int i = 0; i < NUMSTARS; i ++)
    s[i].draw();
}

class Star {
  PVector pos, target, direction, velocity;
  float size, limit;
  Star() {
    size = random(2, 6);
    if (size >= 2 && size < 4) {
      limit = random(0.1, 0.5);
    }
    else limit = random(0.5, 1);
    direction = new PVector(0, 0);
    pos = new PVector(random(-50, -100), random(0, 640));
    target = new PVector(700, pos.y);
    velocity = new PVector(0, 0);
  }

  void draw() {
    direction = PVector.sub(target, pos);
    float separation = direction.mag();
    float distance = separation;
    direction.normalize();
    direction.mult(0.5);
    PVector acceleration = direction;

    velocity.add(acceleration);
    velocity.limit(limit);
    pos.add(velocity);
    fill(pos.x-100, 0, PVector.dist(target,pos));
    ellipse(pos.x, pos.y, size, size);
    if (pos.x > 690) {
      direction = new PVector(0, 0);
      pos = new PVector(random(-50, -100), random(0, 640));
      target = new PVector(700, pos.y);
      velocity = new PVector(0, 0);
    }
  }
}



