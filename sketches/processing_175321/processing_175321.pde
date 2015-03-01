
//Flying Butterflies in the Sky
//Inspired by Levente Sandor's Watercolor --> http://www.openprocessing.org/sketch/110105

ArrayList<Butterfly> butterflies;
float a;
 
void setup() {
  size(500, 500);
  colorMode(RGB);
  butterflies = new ArrayList<Butterfly>();
  for (int i = 0; i < 30; i++) {
    butterflies.add(new Butterfly());
  }
}
 
void draw() {
  background(187+map(noise(1.00+a), 0, 1, -5, 5), 250+map(noise(2.00+a), 0, 1, -5, 5), 224+map(noise(3.00+a), 0, 1, -5, 5));
  for (Butterfly butterfly : butterflies) {
    butterfly.paint();
  }
  a = a + 0.01;
}
 
void mouseClicked() {
  setup();
}
 
class Butterfly {
  float angle;
  int components[];
  float x, y;
  color clr;
 
  Butterfly() {
    angle = random(TWO_PI);
    x = random(width);
    y = random(height);
    clr = color(random(255), random(255), random(255));
    components = new int[2];
    for (int i = 0; i < 2; i++) {
      components[i] = 4;
    }
  }
 
  void paint() {
    float a = 0;
    float r = 0;
    float x1 = x;
    float y1 = y;
    float u = random(0.5, 1);
 
    fill(clr);
    stroke(255);   
 
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
