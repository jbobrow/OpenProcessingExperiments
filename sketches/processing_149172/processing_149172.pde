
PImage spider;
PImage wasp;
PImage fly;
PImage tombstone;
PImage background;
int spiderLimit = 9, spiders = 9;
int waspLimit = 2, wasps = 2;
int flyLimit = 4, flies = 9;

void setup() {
  size(700, 700);
  smooth();
  noStroke();
  spider = loadImage("spider.png");
  wasp = loadImage("wasp.png");
  fly = loadImage("fly.png");
  tombstone = loadImage("tombstone.png");
  background = loadImage("hauntedBackground.png");
  
  for (int i = 0; i < spiderLimit; i++) {
    spider[i] = new Spider(random(600), random(600), random(10), random(10));
  }
  for (int i = 0; i < flyLimit; i++) {
    fly[i] = new Fly(random(600), random(600), random(10), random(10));
  }
  for (int i = 0; i < waspLimit; i++) {
    wasp[i] = new Wasp(random(600), random(600), random(10), random(10));
  }
}

void draw() {
  image(background, 0, 0);
  
  // Creating spider images and movement
  for (int i = 0; i < spiderLimit; i++) {
    spider[i].create();
    spider[i].crawl();
  }
  
  // Creating fly images and movement
  for (int i = 0; i < flyLimit; i++) {
    fly[i].create();
    fly[i].buzz();
  }
  
  // Creating wasp images and movement
  for (int i = 0; i < waspLimit; i++) {
    wasp[i].create();
    wasp[i].move();
  }
}
class Fly {
  float x, y, xSpeed, ySpeed;
  boolean dead = false;

  Fly (float xpos, float ypos, float XSpeed, float YSpeed) {
    x = xpos;
    y = ypos;
    xSpeed = XSpeed;
    ySpeed = YSpeed;
  }

  void create() {
    if (dead == false)
      image(fly, x, y);

    for (int i = 0; i < spiderLimit; i++) {
      if ((dist(x, y, spider[i].x, spider[i].y) < 15 && spider[i].dead == false)) {
        dead = true;
      }
    }
    for (int i = 0; i < waspLimit; i++) {
      if ((dist(x, y, wasp[i].x, wasp[i].y) < 30 && wasp[i].dead == false)) {
        dead = true;
      }
    }
  }

  void buzz() {
    if (y >= 600 || y <= -30) {
      ySpeed = -ySpeed;
    }

    if (x >= 600 || x <= -30) {
      xSpeed = -xSpeed;
    }
    x += xSpeed;
    y += ySpeed;
  }
}

class Spider {
  float x, y, xSpeed, ySpeed;
  boolean dead = false;

  Spider (float xpos, float ypos, float XSpeed, float YSpeed) {
    x = xpos;
    y = ypos;
    xSpeed = XSpeed;
    ySpeed = YSpeed;
  }

  void create() {
    if (dead == false) {
      image(spider, x, y);
    }
    for (int i = 0; i < waspLimit; i++) {
      if ((dist(x, y, wasp[i].x, wasp[i].y) < 30 && wasp[i].dead == false)) {
        dead = true;
      }
    }
  }

  void crawl() {
    if (y >= 600 || y <= -30) {
      ySpeed = -ySpeed;
    }

    if (x >= 600 || x <= -30) {
      xSpeed = -xSpeed;
    }
    x += xSpeed;
    y += ySpeed;
  }
}

class Wasp {
  float x, y, xSpeed, ySpeed;
  boolean dead = false;

  Wasp (float xpos, float ypos, float XSpeed, float YSpeed) {
    x = xpos;
    y = ypos;
    xSpeed = XSpeed;
    ySpeed = YSpeed;
  }

  void create() {
    if (dead == false)
      image(wasp, x, y);

    float time = millis()/1000;
    if (time > 30) {
      dead = true;
    }
  }

  void move() {
    if (y >= 600 || y <= -30) {
      ySpeed = -ySpeed;
    }

    if (x >= 600 || x <= -30) {
      xSpeed = -xSpeed;
    }
    x += xSpeed;
    y += ySpeed;
  }
}



