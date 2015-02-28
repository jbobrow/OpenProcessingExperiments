
int maxpool = 1080;
int pool = maxpool;
Walker [] walkers = new Walker [maxpool];

void add_walker() {
  int count = 0;
  for (int i=0; i<maxpool; i++) {
    if (walkers[i].a <= 0 && count < 2) {
      walkers[i] = new Walker((int)random(300), (int)random(300));
      count++;
    }
  }
}

class Walker {
  int x, y;
  float r, g, b, a;
  
  Walker(int x, int y) {
    this.x = x;
    this.y = y;
    this.r = random(255);
    this.g = random(255);
    this.b = random(255);
    this.a = (int)random(255);
  }

  void update() {
    if (this.a > 0) {
      this.a--;
      this.x += random(3) - 1;
      this.y += random(3) - 1;
      if (this.a == 0) {
        add_walker();
      }
    }
  }
  
  void display() {
    if (this.a > 0) {
      set(this.x, this.y, color(this.r, this.g, this.b, this.a));
    }
  }
}


void setup() {
  size(300, 300);
  for (int i=0; i<maxpool; i++) {
    walkers[i] = new Walker((int)random(300), (int)random(300));
  }
}

void draw() {
  for (int i=0; i<pool; i++) {
    walkers[i].update();
    walkers[i].display();
  }
}

