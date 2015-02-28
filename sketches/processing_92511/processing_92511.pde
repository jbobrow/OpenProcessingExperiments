
Seal player;
Ball ballA;
Ball ballB;
PImage imgSeal;
PImage imgBall;
PImage imgCircus;

void setup() {
  size (600,600);
  imgSeal = loadImage("Seal.png");
  imgBall = loadImage("Ball.PNG");
  imgCircus = loadImage("Circus.png");
  player = new Seal(200,300,0,0,.3);
  ballA = new Ball (400,300,random(-5,5),-5,.1);
  ballB = new Ball (200,300,random(-5,5),-15,.1);
}

void draw() {
  imageMode(CORNER);
  image(imgCircus,0,0,width,height);
  player.move();
  player.draw();
  player.keyPressed();
  player.keyReleased();
  ballA.move();
  ballA.draw();
  ballB.move();
  ballB.draw();
}



class Seal {
  float x;
  float y;
  float hspeed;
  float vspeed;
  float gravity;
   
  Seal (float X, float Y, float Hspeed, float Vspeed, float Gravity) {
    x=X;
    y=Y;
    hspeed=Hspeed;
    vspeed=Vspeed;
    gravity=Gravity;
  }
  void draw() {
    imageMode(CENTER);
    image(imgSeal,x,y,90,90);
  }
  void move() {
    if (y > height - 45) {
      vspeed = 0;
      y = height - 45;
      gravity = 0;
    }
    if (x > width - 45) {
      hspeed = 0;
      x = width - 45;
    }
    if (x < 30) {
      hspeed = 0;
      x = 30;
    }
    vspeed += gravity;
    x += hspeed;
    y += vspeed;
  }
  void keyPressed() {
    if (keyPressed == true) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          hspeed = -8;
        }
        if (keyCode == RIGHT) {
          hspeed = 8;
        }
        if (y == height - 45) {
          if  (keyCode == UP) {
            vspeed = -10;
            gravity = .3;
          }
        }
      }
    }
  }
  void keyReleased() {
    if (keyPressed == false) {
      if (key == CODED) {
        if (keyCode == LEFT || keyCode == RIGHT) {
          hspeed = 0;
        }
      }
    }
  }
}

class Ball {
  float x;
  float y;
  float hspeed;
  float vspeed;
  float gravity;
  float rot;
   
  Ball (float X, float Y, float Hspeed, float Vspeed, float Gravity) {
    x=X;
    y=Y;
    hspeed=Hspeed;
    vspeed=Vspeed;
    gravity=Gravity;
    rot=random(0,4);
  }
  void draw(){
    pushMatrix();
    translate(x,y);
    rotate(rot);
    imageMode(CENTER);
    image(imgBall,0,0,30,30);
    popMatrix();
    rot += .1;
    if (dist(x,y,player.x,player.y) < 45) {
      vspeed = random(-10,-5);
      hspeed += random(-5,5);
    }
  }
  void move(){
    if (x > width - 30) {
      hspeed = -hspeed;
      x = width - 30;
    }
    if (x < 30) {
      hspeed = -hspeed;
      x = 30;
    }
    if (y > height + 30) {
      y = -30;
    }
    if (vspeed > 10) {
      vspeed = 10;
    }
    if (vspeed < -8) {
      vspeed = -8;
    }
    if (hspeed > 5) {
      hspeed = 5;
    }
    if (hspeed < -5) {
      hspeed = -5;
    }
    vspeed += gravity;
    x += hspeed;
    y += vspeed;
  }
}



