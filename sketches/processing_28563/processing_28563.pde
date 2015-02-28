
PImage [] yoshiWalk;
PImage [] yoshiSpit;
PImage[] goomba;
PImage[] turtle;
PImage[] spiker;
PImage[] shell;
PImage[] fish;
float[] xRan;
float[] yRan;
int walkFrame = 0;
int spitFrame = 0;
int goombaFrame = 0;
int turtleFrame = 0;
int shellFrame = 0;
int spikerFrame = 0;
int fishFrame = 0;
int backx = 0;
int yoshX = 150;
int yoshY = 353;
PImage backg;
PImage backg2;
PImage fBall;
PImage fBall2;
int fRate = 20;
int fBallX, fBallY;
int fBallX2, fBallY2;
boolean spitting = false;
boolean fireball = false;
boolean fireball2 = false;
boolean walkingLeft = false;
boolean walkingRight = false;
int counter = 0;
int counter2 = 0;
float destinX, destinY, destinX1, destinX2, destinX3, destinX4, destinX5, destinY2, destinY3, destinY4, destinY5;

void setup() {
  size(500, 500);

  yoshiWalk = new PImage[8];
  for (int i = 0; i < yoshiWalk.length; i++) {
    yoshiWalk[i] = loadImage("YoshiWalk"+ (i+1) + ".png");
  }
  yoshiSpit = new PImage[4];
  for (int i = 0; i < yoshiSpit.length; i++) {
    yoshiSpit[i] = loadImage("YoshiTongue"+ (i+1) + ".png");
  }
  goomba = new PImage[2];
  for (int i = 0; i < goomba.length; i++) {
    goomba[i] = loadImage("Goomba"+ (i+1) + ".png");
  }
  turtle = new PImage[2];
  for (int i = 0; i < turtle.length; i++) {
    turtle[i] = loadImage("Turtle"+ (i+1) + ".png");
  }
  spiker = new PImage[2];
  for (int i = 0; i < spiker.length; i++) {
    spiker[i] = loadImage("Spike"+ (i+1) + ".png");
  }
  shell = new PImage[2];
  for (int i = 0; i < shell.length; i++) {
    shell[i] = loadImage("Shell"+ (i+1) + ".png");
  }
  fish = new PImage[2];
  for (int i = 0; i < fish.length; i++) {
    fish[i] = loadImage("Fish"+ (i+1) + ".png");
  }

  xRan = new float[5];
  for (int i = 0; i < xRan.length; i++) {
    xRan[i] = random(0, 500);
  }
  yRan = new float[5];
  for (int i = 0; i < yRan.length; i++) {
    yRan[i] = random(0, 400);
  }

  backg = loadImage("MarioTheme.png");
  backg2 = loadImage("MarioTheme.png");
  fBall = loadImage("Fireball.png");
  fBall2 = loadImage("Fireball.png");
}

void draw() {
  if (walkFrame > 7) walkFrame = 0;
  if (spitFrame >3) spitFrame = 0;
  if (goombaFrame >1) goombaFrame = 0;
  if (turtleFrame >1) turtleFrame = 0;
  if (spikerFrame >1) spikerFrame = 0;
  if (shellFrame >1) shellFrame = 0;
  if (fishFrame >1) fishFrame = 0;
  if (spitFrame > 3) spitFrame = 0;

  image(backg, backx, 0, 800, 500);
  image(backg2, backx + 800, 0, 800, 500);
  if (spitting == false) {
    counter2 += 0;
    image(yoshiWalk[walkFrame], yoshX, yoshY, 60, 70);
  }

  /*if (walking == false) {
   image(yoshiSpit[spitFrame], yoshX, yoshY, 60, 70);
   }*/

  image(goomba[goombaFrame], xRan[0], yRan[0], 35, 35);
  image(turtle[turtleFrame], xRan[1], yRan[1], 35, 35);
  image(spiker[spikerFrame], xRan[2], yRan[2], 35, 35);
  image(shell[shellFrame], xRan[3], yRan[3], 35, 35);
  image(fish[fishFrame], xRan[4], yRan[4], 35, 35);

  if (counter%3 == 0) {
    walkFrame++;
    backx-=2.5;
  }
  if (counter%9 == 0) {
    goombaFrame++;
    turtleFrame++;
    spikerFrame++;
    shellFrame++;
    fishFrame++;
  }
  if (counter2%3 == 0) {
    spitFrame++;
  }
  if (counter2%300 == 0) {
    spitting = false;
  }
  if (spitting == true) {
    if (spitFrame > 3) { 
      spitFrame = 0;
    }
    image(yoshiSpit[spitFrame], yoshX, yoshY, 60, 70);
    counter2++;
  }
  if (backx ==-800) {
    backx = 0;
  }
  /*if (counter%20 == 0) {
   walking = true;
   }*/

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
  counter++;

  if (counter%60 == 0) {
    destinX = int(random(0, 500));
  }
  xRan[0] += (destinX - xRan[0]) * 0.01;

  if (counter%60 == 0) {
    destinY = int(random(0, 400));
  }
  yRan[0] += (destinY - yRan[0]) * 0.01;

  if (counter%60 == 0) {
    destinX2 = int(random(0, 500));
  }
  xRan[1] += (destinX2 - xRan[1]) * 0.01;

  if (counter%60 == 0) {
    destinY2 = int(random(0, 400));
  }
  yRan[1] += (destinY2 - yRan[1]) * 0.01;

  if (counter%60 == 0) {
    destinX3 = int(random(0, 500));
  }
  xRan[2] += (destinX3 - xRan[2]) * 0.01;

  if (counter%60 == 0) {
    destinY3 = int(random(0, 400));
  }
  yRan[2] += (destinY3 - yRan[2]) * 0.01;

  if (counter%60 == 0) {
    destinX4 = int(random(0, 500));
  }
  xRan[3] += (destinX4 - xRan[3]) * 0.01;

  if (counter%60 == 0) {
    destinY4 = int(random(0, 400));
  }
  yRan[3] += (destinY4 - yRan[3]) * 0.01;

  if (counter%60 == 0) {
    destinX5 = int(random(0, 500));
  }
  xRan[4] += (destinX5 - xRan[4]) * 0.01;

  if (counter%60 == 0) {
    destinY5 = int(random(0, 400));
  }
  yRan[4] += (destinY5 - yRan[4]) * 0.01;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      yoshX+=2;
    }
    if (keyCode == LEFT) {
      yoshX-=2;
    }
    if (keyCode == UP) {
      yoshY-=4;
    }
    if (keyCode == DOWN) {
      yoshY+=4;
    }
  }
  /*if(keyCode == 32 ){
   if (fireball == true && fireball2 == false) { 
   fireball2 = true;
   fBallX2 = yoshX + 60;
   fBallY2 = yoshY + 15;
   }
   if (fireball == false) { 
   fireball = true;
   fBallX = 150;
   fBallX = yoshX + 60;
   fBallY = yoshY + 15;
   }
   }*/
}

void mousePressed() {
  // walking = false;
  // if (spitFrame > 3) spitFrame = 0;
  if (spitting == false) {
    spitting = true;
  }
  //image(yoshiSpit[spitFrame], yoshX, yoshY, 60, 70);
  if (fireball == true && fireball2 == false) { 
    fireball2 = true;
    fBallX2 = yoshX + 60;
    fBallY2 = yoshY + 15;
  }
  if (fireball == false) { 
    fireball = true;
    fBallX = 150;
    fBallX = yoshX + 60;
    fBallY = yoshY + 15;
  }
}


