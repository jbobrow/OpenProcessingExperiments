
Timmy timmy;

class Timmy {
  float x, y, vx, vy;
  float ax, ay, w, h;
  PImage sprite;
  boolean grounded = false;
  float speed;

  void update() {
    //position
    x += vx;
    y += vy;

    //velocity
    vx += ax;
    vy += ay;

    if (y > height -h) {
      y = height - h;
      grounded = true;
    }
  }

  void jump() {
    if (grounded ) {
      timmy.vy = -8.5;
      grounded = false;
    }
  }
  void left(){
   timmy.vx = - speed;
  }
  
  void right(){
  timmy.vx = speed; 
  }
  
  void draw() {
    image(sprite, x, y, w, h);
  }
}

void setup() {
  size(800, 500);
  timmy = new Timmy();
  timmy.x  = 100;
  timmy.y  = 50;
  timmy.ay = 0.405;
  timmy.w  = 50;
  timmy.h  = 50;
  timmy.sprite = loadImage("timmy-head-real.png");
  timmy.speed = 8;
  //background = loadImage("");
}

void update() {
  timmy.update ();
}

void draw() {
  background (0);
  update();
  //drawBackground();
  timmy.draw();
}

void keyPressed() {
  if (key== CODED) {
    if (keyCode ==LEFT) {
      timmy.left();
    }
    if (keyCode == RIGHT) {
      timmy.right();
    }
    if (keyCode == UP) {
      timmy.jump();
    }
  }
}


void keyReleased() {
  if (key== CODED) {
    if (keyCode ==LEFT) {
      timmy.vx = 0;
    }
    if (keyCode == RIGHT) {
      timmy.vx = 0;
    }
  }
}

