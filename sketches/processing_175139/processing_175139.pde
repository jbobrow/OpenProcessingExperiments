
// Watercolor
// Levente Sandor, 2013

ArrayList<Brush> brushes; 

void setup() {
  size(600, 500);
  background(255);
  brushes = new ArrayList<Brush>();
  for (int i = 0; i < 50; i++) {
    brushes.add(new Brush());
  }
}

void draw() {
  for (Brush brush : brushes) {
    brush.paint();
  }
}

void mouseClicked() {
  setup();
}

class Brush {
  float angle;
  int components[];
  float x, y;
  color clr;

  Brush() {
    angle = random(TWO_PI);
    x = random(width);
    y = random(height);
    clr = color(random(155), random(255), random(255), 5);
    components = new int[2];
    for (int i = 0; i < 2; i++) {
      components[i] = int(random(1, 5));
    }
  }

  void paint() {
    float a = 0;
    float r = 0;
    float x1 = x;
    float y1 = y;
    float u = random(0.5, 1);

    fill(clr);
    noStroke();    

    beginShape();
    while (a < TWO_PI) {
      vertex(x1, y1); 
      float v = random(0.85, 1);
      x1 = x + r * cos(angle + a) * u * v;
      y1 = y + r * sin(angle + a) * u * v;
      a += PI / 180;
      for (int i = 0; i < 2; i++) {
        r += sin(a * components[i]);
      }
    }
    endShape(CLOSE);

    if (x < 0 || x > width ||y < 0 || y > height) {
      angle += HALF_PI;
    }

    x += 2 * cos(angle);
    y += 2 * sin(angle); 
    angle += random(-0.15, 0.15);
  }
}
