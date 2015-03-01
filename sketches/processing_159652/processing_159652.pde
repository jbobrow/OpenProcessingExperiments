

Star[] stars = new Star[150];
PImage hoopiter;
void setup() {
  size(400, 600);
  imageMode(CENTER);
  hoopiter = loadImage("hoopiter.png");
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star(int(random(0, width)), (random(0, height)), (random(0.5, 2)), int(random(1, 6)));
  }
}


void draw() {
  background(0);
  for (int i=0; i<stars.length; i++) {
    stars[i].scroll();
    stars[i].mass();
    stars[i].display();
  }
}

class Star {
  int x;
  float y;
  float speed;
  int size;

  Star(int tempx, float tempy, float tempspeed, int tempsize) {
    x = tempx;
    y = tempy;
    speed = tempspeed;
    size = tempsize;
  }

  void mass() {
    if (size < 2) {
      speed = 0.5;
    }  
    if (size < 4 && size > 2) {
      speed = 1.5;
    }
    if (size < 6 && size > 4) {
      speed = 2;
    }
  }

  void scroll() {
    y = y+ speed;
    if (y > height) {
      y = 0;
      x = int(random(0, width));
      speed = (random(0.5, 2));
      size = int(random(1, 6));
    }
  }

  void display() {
    ellipseMode(CENTER);
    fill(255);
    ellipse(x, y, size, size);
  }
}

