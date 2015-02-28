
PImage[] yoshiWalk;
PImage[] yoshiSpit;
PImage[] goomba;
PImage[] turtle;
PImage[] spiker;
PImage[] shell;
PImage[] fish;
int backx = 0;
PImage backg, backg2;
PImage fBall, fBall2;
int fRate = 20;
int fBallX, fBallY;
int fBallX2, fBallY2;
boolean fireball = false;
boolean fireball2 = false;
BadGuys[] badGuys;
Yoshi[] yoshi;

void setup() {
  size(500, 500);
  yoshiWalk = new PImage[8];
  yoshiSpit = new PImage[4];
  goomba = new PImage[2];
  turtle = new PImage[2];
  spiker = new PImage[2];
  shell = new PImage[2];
  fish = new PImage[2];
  badGuys = new BadGuys[50];
  yoshi = new Yoshi[1];

  for (int i = 0; i < badGuys.length; i++) {
    badGuys[i] = new BadGuys(random(0, 500), random(0, 400));
  }
  for (int i = 0; i < yoshi.length; i++) {
    yoshi[i] = new Yoshi(150, 353);
  }

  for (int i = 0; i < yoshiWalk.length; i++) {
    yoshiWalk[i] = loadImage("YoshiWalk"+ (i+1) + ".png");
  }
  for (int i = 0; i < yoshiSpit.length; i++) {
    yoshiSpit[i] = loadImage("YoshiTongue"+ (i+1) + ".png");
  }
  for (int i = 0; i < goomba.length; i++) {
    goomba[i] = loadImage("Goomba"+ (i+1) + ".png");
  }
  for (int i = 0; i < turtle.length; i++) {
    turtle[i] = loadImage("Turtle"+ (i+1) + ".png");
  }
  for (int i = 0; i < spiker.length; i++) {
    spiker[i] = loadImage("Spike"+ (i+1) + ".png");
  }
  for (int i = 0; i < shell.length; i++) {
    shell[i] = loadImage("Shell"+ (i+1) + ".png");
  }
  for (int i = 0; i < fish.length; i++) {
    fish[i] = loadImage("Fish"+ (i+1) + ".png");
  }

  backg = loadImage("MarioTheme.png");
  backg2 = loadImage("MarioTheme.png");
  fBall = loadImage("Fireball.png");
  fBall2 = loadImage("Fireball.png");
}

void draw() {
  if (backx ==-800) {
    backx = 0;
  }
  image(backg, backx, 0, 800, 500);
  image(backg2, backx + 800, 0, 800, 500);
  backx-=2.5;

  for (int i = 0; i < badGuys.length; i++) {
    badGuys[i].update();
  }
  for (int i = 0; i < yoshi.length; i++) {
    yoshi[i].update();
  }

  if (fireball == true) { //Fireball action
    image(fBall, fBallX, fBallY, 15, 15);
    fBallX += 10;
    if (fBallX >= width) {
      fireball = false;
      fBallX += 0;
    }
  }

  if (fireball2 == true) { //Fireball action
    image(fBall2, fBallX2, fBallY2, 15, 15);
    fBallX2 += 10;
    if (fBallX2 >= width) {
      fireball2 = false;
      fBallX2 += 0;
    }
  }
}

class Yoshi {
  float x;
  float y;
  int counter2;
  int spitFrame;
  int walkFrame;
  int speedFrame;
  boolean spitting = false;

  Yoshi(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    speedFrame = 10;
  }
  void update() {
    if (counter2%speedFrame == 0) {
      walkFrame++;
    }
    if (walkFrame > 7) walkFrame = 0;
    if (counter2%300 == 0) {
      spitting = false;
    }
    if (spitting == true) {
      if (spitFrame > 3) { 
        spitFrame = 0;
      }
      image(yoshiSpit[spitFrame], x, y, 60, 70);
    }
    if (spitting == false) {
      counter2 += 0;
      image(yoshiWalk[walkFrame], x, y, 60, 70);
    }
  }
  void mousePressed() {
    if (spitting == false) {
      spitting = true;
    }
    if (fireball == true && fireball2 == false) { 
      fireball2 = true;
      fBallX2 = int(x + 60);
      fBallY2 = int(y + 15);
    }
    if (fireball == false) { 
      fireball = true;
      fBallX = 150;
      fBallX = int(x + 60);
      fBallY = int(y + 15);
    }
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        x+=2;
      }
      if (keyCode == LEFT) {
        x-=2;
      }
      if (keyCode == UP) {
        y-=4;
      }
      if (keyCode == DOWN) {
        y+=4;
      }
    }
    counter2++;
  }
}

class BadGuys {
  float xRan;
  float yRan;
  float destinX;
  float destinY;
  int frame;
  int counter;
  int speedFrame;
  int badGuyPick;

  BadGuys(float xpos, float ypos) {
    xRan = xpos;
    yRan = ypos;
    destinX = xRan;
    destinY = yRan;
    speedFrame = int(random(2, 9));
    badGuyPick = int(random(5));
  }
  void update() {

    if (counter%60 == 0) {
      destinX = int(random(0, 500));
    }
    if (counter%60 == 0) {
      destinY = int(random(0, 400));
    }
    xRan += (destinX - xRan) * 0.01;
    yRan += (destinY - yRan) * 0.01;
    if (counter%speedFrame == 0) {
      frame++;
    }
    if (frame > 1) frame = 0;

    if (badGuyPick == 0) {
      image(goomba[frame], xRan, yRan, 35, 35);
    }
    if (badGuyPick == 1) {
      image(turtle[frame], xRan, yRan, 35, 35);
    }
    if (badGuyPick == 2) {
      image(spiker[frame], xRan, yRan, 35, 35);
    }
    if (badGuyPick == 3) {
      image(shell[frame], xRan, yRan, 35, 35);
    }
    if (badGuyPick == 4) {
      image(fish[frame], xRan, yRan, 35, 35);
    }
    counter++;
  }
}


