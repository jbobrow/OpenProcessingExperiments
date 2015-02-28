
/* @pjs preload="Seal.png, Ball.PNG, Circus.png, Obstacle.png, Star.png"; */
Seal player;
Ball ballA;
Ball ballB;
Obstacle obstA;
Obstacle obstB;
Obstacle obstC;
Star starA;
Star starB;
Star starC;
Star starD;
Star starE;
Star starF;
PImage imgSeal;
PImage imgBall;
PImage imgCircus;
PImage imgObstacle;
PImage imgStar;

int score = 0;
float lives = 3;

void setup() {
  size (600,600);
  imgSeal = loadImage("Seal.png");
  imgBall = loadImage("Ball.PNG");
  imgCircus = loadImage("Circus.png");
  imgObstacle = loadImage("Obstacle.png");
  imgStar = loadImage("Star.png");
  player = new Seal(300,570,0,0,.3);
  ballA = new Ball (400,300,0,-10,.1);
  ballB = new Ball (200,300,0,-5,.1);
  obstA = new Obstacle (300,100,0);
  obstB = new Obstacle (300,300,0);
  starA = new Star (100,250,4);
  starB = new Star (300,250,0);
  starC = new Star (500,250,-4);
  starD = new Star (100,150,4);
  starE = new Star (300,150,0);
  starF = new Star (500,150,-4);  
}

void draw() {
  if (lives > 0) {
    imageMode(CORNER);
    image(imgCircus,0,0,width,height);
    player.move();
    player.draw();
    obstA.move();
    obstA.draw();
    obstB.move();
    obstB.draw();
    starA.move();
    starA.draw();
    starB.move();
    starB.draw();
    starC.move();
    starC.draw();
    starD.move();
    starD.draw();
    starE.move();
    starE.draw();
    starF.move();
    starF.draw();
    ballA.move();
    ballA.draw();
    ballB.move();
    ballB.draw();
    if (lives == 3) {
      imageMode(CENTER);
      image(imgBall,75,15,30,30);
    }
    if (lives > 1) {
      imageMode(CENTER);
      image(imgBall,45,15,30,30);
    }
    if (lives > 0) {
      imageMode(CENTER);
      image(imgBall,15,15,30,30);
    }
    fill(255);
    textAlign(RIGHT);
    textSize(20);
    text(score,600,20);
  } else {
    textAlign(CENTER);
    textSize(60);
    text("GAME OVER",300,200);
    textSize(30);
    text("SCORE:",300,300);
    textSize(30);
    text(score,300,350);
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.hspeed = -8;
    }
    if (keyCode == RIGHT) {
      player.hspeed = 8;
    }
    if  (keyCode == UP) {
      if (player.y == height - 45) {
        player.vspeed = -10;
        player.gravity = .3;
      }
    }
  }
}
void keyReleased() {
  player.hspeed = 0;
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
    rot=0;
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
      hspeed = (x - player.x)/8;
    }
    if (dist(x,y,obstA.x,obstA.y) < 35) {
      if (x <= obstA.x) {
        if (hspeed > 0) {
          hspeed = -hspeed;
        }
      } else {
        if (hspeed <= 0){
          hspeed = -hspeed;
        }
      }
      if (y <= obstA.y) {
        if (vspeed > 0) {
          vspeed = -vspeed;
        }
      } else {
        if (vspeed <= 0){
          vspeed = -vspeed;
        }
      }
    }
    if (dist(x,y,obstB.x,obstB.y) < 35) {
      if (x <= obstB.x) {
        if (hspeed > 0) {
          hspeed = -hspeed;
        }
      } else {
        if (hspeed <= 0){
          hspeed = -hspeed;
        }
      }
      if (y <= obstB.y) {
        if (vspeed > 0) {
          vspeed = -vspeed;
        }
      } else {
        if (vspeed <= 0){
          vspeed = -vspeed;
        }
      }
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
      lives -= 1;
      noStroke();
      fill(250,0,0,120);
      rectMode(CORNER);
      rect(0,0,600,600);
    }
    if (vspeed > 3) {
      vspeed = 3;
    }
    if (vspeed < -8) {
      vspeed = -8;
    }
    if (hspeed > 3) {
      hspeed = 3;
    }
    if (hspeed < -3) {
      hspeed = -3;
    }
    vspeed += gravity;
    x += hspeed;
    y += vspeed;
  }
}

class Obstacle {
  float x;
  float y;
  float hspeed;
  
  Obstacle (float X,float Y,float Hspeed) {
    x=X;
    y=Y;
    hspeed=Hspeed;
  }
  void draw() {
    imageMode(CENTER);
    image(imgObstacle,x,y,40,40);
  }
  void move() {
    x += hspeed;
    if (x < -20) {
      x = width + 20;
    }
    if (x > width + 20) {
      x = -20;
    }
  }
}

class Star {
  float x;
  float y;
  float hspeed;
  float rot = 0;
  
  Star (float X,float Y,float Hspeed) {
    x=X;
    y=Y;
    hspeed=Hspeed;
  }
  void draw() {
    pushMatrix();
    translate(x,y);
    rotate(rot);
    imageMode(CENTER);
    image(imgStar,0,0,20,20);
    popMatrix();
    rot += .2;
    if ((dist (x,y,ballA.x,ballA.y) < 25) || (dist (x,y,ballB.x,ballB.y) < 25)) {
      x = int(random(1,10))*50;
      score += 50;
    }
  }
  void move() {
    x += hspeed;
    if (x < -10) {
      x = width + 10;
    }
    if (x > width + 10) {
      x = -10;
    }
  }
}
