
// Automatic Doodler
// Levente Sandor, 2013

ArrayList<PVector> points;
float x0, y0, x, y, angle;
final float step = 3;
final float minDist = step / 2;
final float maxDist = 30;

void setup() {
  size(900, 400);
  background(255);
  stroke(0, 3);
  smooth();

  points = new ArrayList<PVector>();
  x0 = random(width);
  y0 = 0;
  angle = random(TWO_PI);
}

void draw() {
  x = (width + x0 + step * cos(angle)) % width;
  y = (height + y0 + step * sin(angle)) % height;
  PVector pt = new PVector(x, y);

  for (PVector p : points) {
    if (pt.dist(p) < minDist) { 
      pt = points.size() > 500 ? points.get(int(random(500))) : new PVector(random(width), 0);
      break;
    }
  }

  for (PVector p : points) {
    if (pt.dist(p) < maxDist) { 
      line(p.x, p.y, pt.x, pt.y);
    }
  }

  points.add(0, pt);
  x0 = pt.x;
  y0 = pt.y;
  angle += random(-0.2, 0.2);

}

void mouseClicked() {
  setup();
}
