
Frog frogA;
Frog frogB;
Fly flyA;
Fly flyB;
Fly flyC;
Fly flyD;
Fly flyE;
Foot foot;
int FR = 60;
float time = 0;
PImage imgFrog;
PImage imgFly;
PImage imgFoot;
PImage imgSwamp;

void setup() {
  size (400,400);
  frogA = new Frog(random(50,width-50),random(50,height-50),6,2,1);
  frogB = new Frog(random(50,width-50),random(50,height-50),-6,2,1);
  flyA = new Fly(random(50,width-50),random(50,250),random(6,12),2);
  flyB = new Fly(random(50,width-50),random(50,250),random(6,12),2);
  flyC = new Fly(random(50,width-50),random(50,250),random(6,12),2);
  flyD = new Fly(random(50,width-50),random(50,250),random(6,12),2);
  flyE = new Fly(random(50,width-50),random(50,250),random(6,12),2);
  foot = new Foot(random(0,300),-400,20);
  frogA.dead = false;
  frogB.dead = false;
  flyA.dead = false;
  flyB.dead = false;
  flyC.dead = false;
  flyD.dead = false;
  flyE.dead = false;
  imgFrog = loadImage("frog2.png");
  imgFly = loadImage("fly2.png");
  imgFoot = loadImage("foot.png");
  imgSwamp = loadImage("swamp.png");
  frameRate(FR);
}

void draw() {
  imageMode(CORNER);
  image(imgSwamp,0,0);
  frogA.move();
  frogA.draw();
  frogB.move();
  frogB.draw();
  flyA.move();
  flyA.draw();
  flyB.move();
  flyB.draw();
  flyC.move();
  flyC.draw();
  flyD.move();
  flyD.draw();
  flyE.move();
  flyE.draw();
  foot.move();
  foot.draw();
  if (time > (FR*5)) {
    frogA.dead = true;
  }
  time += 1;
}



class Frog {
  float x;
  float y;
  float hspeed;
  float vspeed;
  float gravity;
  boolean dead;
  boolean old;
  
  Frog (float X, float Y, float Hspeed, float Vspeed, float Gravity) {
    x=X;
    y=Y;
    hspeed=Hspeed;
    vspeed=Vspeed;
    gravity=Gravity;
  }
  void draw() {
    if (dead == false) {
      imageMode(CENTER);
      image(imgFrog,x,y);
    }
    if (x + 10 > foot.x && x - 10 < foot.x + 100){
      if (y + 10 > foot.y && y - 10 < foot.y + 400){
        dead = true;
      }
    }
  }
  void move() {
    if (x > width || x < 0) {
      hspeed = -hspeed;
    }
    if (y > height) {
      vspeed = random(-25,-15);
    }
    vspeed += gravity;
    x += hspeed;
    y += vspeed;
  }
}



class Fly {
  float x;
  float y;
  float hspeed;
  float vspeed;
  boolean dead;
  
  Fly (float X, float Y, float Hspeed, float Vspeed) {
    x=X;
    y=Y;
    hspeed=Hspeed;
    vspeed=Vspeed;
  }
  void draw() {
    if (dead == false) {
      imageMode(CENTER);
      image(imgFly,x,y);
    }
    if ((dist(x,y,frogA.x,frogA.y) < 20 && frogA.dead == false) || (dist(x,y,frogB.x,frogB.y) < 20 && frogB.dead == false)) {
      dead = true;
    }
  }
  void move() {
    if (x > width || x < 0) {
      hspeed = -hspeed;
    }
    if (y < 150) {
      vspeed += 1;
    }
    if (y > 150) {
      vspeed -= 1;
    }
    x += hspeed;
    y += vspeed;
  }
}



class Foot {
  float x;
  float y;
  float hspeed;
  float vspeed;
  float gravity;
  
  Foot (float X, float Y, float Vspeed) {
    x=X;
    y=Y;
    vspeed=Vspeed;
  }
  void draw() {
    imageMode(CORNER);
    image(imgFoot,x,y);
  }
  void move() {
    if (y > 0) {
      vspeed = -vspeed;
    }
    if (y < -400) {
      vspeed = -vspeed;
      x = random(0,300);
    }
    if (time > (FR*6)) {
      y += vspeed;
    }
  }
}


