
ArrayList connectors = new ArrayList();

void setup() {
  size(640, 640);
  stroke(125, 50);
  for (int i = 0; i < 20; i++) {
    if (random(0, 1) < 0.5) {
      connectors.add(new Connector(new PVector(random(0, width), -1), new PVector(random(0, width), height+1)));
    } else {
      connectors.add(new Connector(new PVector(-1, random(height)), new PVector(width+1, random(height))));
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < connectors.size (); i++) {
    Connector c = (Connector) connectors.get(i);
    c.draw();
    c.boundaries();
    for (int q = 0; q < connectors.size (); q++) {
      Connector c2 = (Connector) connectors.get(q);
      fill(0, 150, 255);
      if (c.calcIntersect(c2) != null) {
        ellipse(c.calcIntersect(c2).x, c.calcIntersect(c2).y, 3, 3);
      }
    }
  }
}

class Connector {
  PVector start;
  PVector end;

  PVector sVel;
  PVector eVel;

  Connector(PVector startLoc, PVector endLoc) {
    this.start = startLoc;
    this.end = endLoc;

    sVel = new PVector(random(-1, 1), random(-1, 1));
    eVel = new PVector(random(-1, 1), random(-1, 1));
  }

  void draw() {
    start.add(sVel);
    end.add(eVel);
    line(start.x, start.y, end.x, end.y);
  }

  /* Code used from Jerome Herr's sketch "intersect" */
  PVector calcIntersect(Connector c1) {
    float a = end.y - start.y;
    float b = start.x - end.x;
    float c = a * start.x + b * start.y;

    float a2 = c1.end.y - c1.start.y;
    float b2 = c1.start.x - c1.end.x;
    float c2 = a2 * c1.start.x + b2 * c1.start.y;

    float den = a * b2 - a2 * b;
    if (den == 0) return null;
    return new PVector((b2 * c - b * c2) / den, (a * c2 - a2 * c) / den);
  }

  void boundaries() {
    if (start.x <= 0) sVel.x *= -1;
    if (start.x >= width) sVel.x *= -1;
    if (start.y <= 0) sVel.y *= -1;
    if (start.y >= height) sVel.y *= -1;

    if (end.x <= 0) eVel.x *= -1;
    if (end.x >= width) eVel.x *= -1;
    if (end.y <= 0) eVel.y *= -1;
    if (end.y >= height) eVel.y *= -1;
  }
}



