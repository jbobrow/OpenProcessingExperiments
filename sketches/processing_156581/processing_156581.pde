
ArrayList<Ring> rings;

void setup() {
  size(500,500);
  
  rings = new ArrayList<Ring>();
  int r = 10;
  for(int i = 0; i < r; i++) {
    int n = 3 * (i + 1);
    int diameter = 15 + (25 * i);
    float speed = 0.004 * (r - i);
    rings.add(new Ring(n, diameter, speed));
  }
}

void draw() {
  background(255);
  
  for(Ring ring : rings) {
    ring.display();
  }
}
class Ring {
  int n, diameter;
  float speed, angle, inc, centerX, centerY;
  Ring(int n, int diameter, float speed) {
    this.n = n;
    this.diameter = diameter;
    this.speed = speed;
    
    this.angle = 0.0;
    this.inc = radians(360.0/n);
    this.centerX = width/2;
    this.centerY = height/2;
  }
  
  void display() {
    fill(0);
    float a = 0;
    for(int i = 0; i < n; i++) {
      float x = centerX + cos(angle + a) * diameter;
      float y = centerY + sin(angle + a) * diameter;
      ellipse(x, y, 10, 10);
      a += inc;
    }
    
    angle += speed;
  }
}


