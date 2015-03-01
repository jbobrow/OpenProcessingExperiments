
AllCreatures [] all = new AllCreatures [10];


void setup() {
  size(1000, 800);
  smooth();


  for (int i = 0; i < all.length; i++) {
    float xposAll = width/2;
    float yposAll = height/2;
    all [i] = new AllCreatures (xposAll + i, yposAll);
  }

  for (int i = 0; i < all.length; i++) {
    all[i].prime();
  }
}

void draw() {
  background(103, 104, 137);

  for (int i = 0; i < all.length; i++) {
    all[i].update();
  }
}

Creature [] guy = new Creature [100];

class AllCreatures {

  float xposAll;
  float yposAll;

  float x;

  AllCreatures(float _xposAll, float _yposAll) {
    xposAll = _xposAll;
    yposAll = _yposAll;
  }


  void prime() {

    for (int i = 0; i < guy.length; i++) {
      float r = i;
      float  xpos = x;
      float x = map(xpos, 0, width, 400, 500);
      float ypos = height/2;
      guy[i] = new Creature(x, ypos, r*(random(1, 2)));
    }
  }

  void update() {
    for (int i = 0; i < guy.length; i++) {
      guy[i].updateCreature();
    }
  }
}

class Creature {

  float xpos;
  float ypos;
  float r;
  float speed = 10;
  int direction = 1;
  float x;

  Creature (float _xpos, float _ypos, float _r) {
    xpos = _xpos;
    ypos = _ypos;    
    r = _r;
  }

  void updateCreature() {
    move();
    display();
  }


  void display() {

    fill(255, 25);
    noStroke();
    for (int i = 0; i < guy.length; i++) {
      ellipse (x + ((i*100)), ypos, r/10, r/10);
    }
  }

  void move() {
    xpos += (random(-speed, speed) * -direction); 
    ypos += (random(-speed, speed) * direction);
  }
}

