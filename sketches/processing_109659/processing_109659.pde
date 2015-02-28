
// Worms
// Levente Sandor, 2013

ArrayList<Worm> worms;
boolean hidePaths = false;

void setup() {
  size(500, 500);
  background(255);
  noFill();

  worms = new ArrayList<Worm>();
  for (int i = 0; i < 50; i++) {
    worms.add(new Worm());
  }
}

void draw() {
  if (hidePaths) {
    background(255);
  }

  for (Worm worm: worms) {
    worm.display();
    worm.advance();
  }
}

void mouseClicked() {
  setup();
}

void keyPressed() {
  if (key == 't' || key == 'T') {
    hidePaths = !hidePaths;
  }
}

class Worm {
  ArrayList<PVector> points;
  float segLen;
  float weight;

  Worm() {
    points = new ArrayList<PVector>();
    segLen = random(.5, 10);
    weight = random(3, 10);
    float x = random(width);
    float y = random(height);
    points.add(new PVector(x, y));
    x = x + segLen * cos(random(TWO_PI));
    y = y + segLen * sin(random(TWO_PI));
    points.add(new PVector(x, y));
    for (int i = 0; i < 10; i++) {
      addPoint();
    }
  }

  void addPoint() {
    PVector p0 = points.get(0);
    PVector p1 = points.get(1);
    float a = atan2(p0.y - p1.y, p0.x - p1.x);
    float x = p0.x + segLen * cos(a + random(-QUARTER_PI, QUARTER_PI));
    float y = p0.y + segLen * sin(a + random(-QUARTER_PI, QUARTER_PI));
    points.add(0, new PVector(x, y));
  }

  void display() {
    for (int i = 0; i < 2; i++) {
      strokeWeight(weight - i * 2);
      stroke(i * 255);      
      beginShape();
      for (PVector p : points) {
        vertex(p.x, p.y);
      }
      endShape();
    }
  }

  void advance() {
    points.remove(points.size() - 1);
    addPoint();
  }
}

