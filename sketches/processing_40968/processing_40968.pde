
Bug [] bug = new Bug[20];


PImage a;

void setup() {
  size(200, 200);

  for (int b =0 ; b < bug.length;b++) {
    bug[b]= new Bug();
  }
}

void draw() {
  background (loadImage("web.jpg"));

  for (int b = 0; b < bug.length;b++) {
    bug[b].update();
    bug[b].display();
  }
}

class Bug {

  float x = random(50, 150);
  float y = random(50, 150);
  color c = color(int(random(255)));
  float speed = random(0, 5);

  Bug() {
  }

  void update() {
    x= x + random(-1, 1);
    y= y + random(-1, 1);
    speed = speed;
  }

  void display() {
    fill(c);
    ellipse(x, y, 5, 8);
  }
}


