

Pie[] pies = new Pie[30];
Power[] powers = new Power[1];
Slow[] slows = new Slow[1];
CBall[] cballs = new CBall[10];
Mouth paddle;

import ddf.minim.*;
Minim minim; 
AudioPlayer player;
AudioSample hurt;
AudioSample power;
AudioSample nextstage;

PImage paddles;
PImage life; 
PImage balls;
PImage slowsI;

PImage initial;

PFont fonts;


int score = 5;
int mode = 1;
int finalCatch = 0;

int change = 250;
int change2 = 20;


int level = 1;

float textY = 0;

float rectX = 15;
float rectY = height;


void setup() {

  noCursor();

  size(1024, 768); 
  minim = new Minim (this);
  hurt = minim.loadSample("hurt2.mp3");
  power = minim.loadSample("Powerup.wav");
  nextstage = minim.loadSample("newstage.wav");
  //hurt.setVolume(6);
  player = minim.loadFile("gamemusic.wav");

  player.loop(); 
  //nextstage.stop();

  fonts = createFont ("Iron.ttf", 38);
  textFont(fonts);

  paddles = loadImage("paddle.png");
  balls = loadImage("Balls2.png");
  life = loadImage("ExtraLife.png");
  slowsI = loadImage("slow.png");
  initial =loadImage("initial_page.png");

  paddle = new Mouth();

  for (int a = 0; a < powers.length; a++) {
    float Px = random(width);
    float Py = random(-500, 50);
    powers[a] = new Power(Px, Py);
  }

  for (int i = 0; i < pies.length; i++) {
    float x = random(width);
    float y = random(-2000);
    pies[i] = new Pie(x, random(-500, 0));
  }

  for (int b = 0; b < cballs.length; b++) {
    float Cx = 0;
    float Cy = random(-height, height);
    cballs[b] = new CBall(Cx, Cy);
  }

  for (int e = 0; e < slows.length; e++) {
    float Sx = random(width);
    float Sy = random(-2000);
    slows[e] = new Slow(Sx, Sy);
  }
}




void draw() {


  background(change2, 158, change);
  //fill(change2, 154, change, 12);
  //rect(0, 0, width, height);

  if (mode == 1) {
    image(initial, 0, 0, width, height);
  }
  else if (mode == 2) {
    playGame();
  }
  else if (mode == 3) {
    textSize(40);
    text("GAME OVER\nPress 'S' to start", width/2, height/2);
    fill(0);
    text("Last Level", width/4, height/2);
    text(level, width/4, 440);
    noFill();
  }
  else if (mode == 4) {
    secondStage();
    playGame();
  }
}

void keyPressed() {
  if (mode == 1) {
    mode = 2;
  } 
  else if (mode == 3) {
    if (key == 's') {

      restartGame();
      mode = 1;
    }
  }
}
class Pie {

  float x = 0;
  float y = 0;
  float speed = random(1.0, 2.0);

  int diameter = 30;
  int radius = diameter/2;

  Pie (float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void eat() {
    y = random(-height, height);
    x = random(-width, width);
  }

  void fall() {
    y += speed;

    if (y > height + diameter) {
      //y = -100;
      y = -60;
      //x = random(50, 450);
      x = random(diameter, width-diameter);
    }
  }

  void display() {
    fill(255);
    image(balls, x, y, diameter, diameter);
    //ellipse(x, y, diameter, diameter);
  }
}



class CBall {

  float Cx = 0;
  float Cy = 0;
  //float angle = 1.0;
  float Cspeed = 10;
  int Cdiameter = 30;
  int Cradius = Cdiameter/2;

  CBall (float tempcX, float tempcY) {
    Cx = tempcX;
    Cy = tempcY;
  }

  void Ceat() {
    Cy = random(-height, height);
    Cx = 0;
  }

  void Cfall() {
    Cx += Cspeed;
    if (Cx > width) {
      Cy += random(-height, height);
      Cx = 0;
    }
    else if (Cy > height) {
      Cy = random(-height, height);
    }
  }

  void Cdisplay() {
    //fill(255);
    //colorMode(HSB);
    tint(255, random(255), random(255));
    image(balls, Cx, Cy, Cdiameter, Cdiameter);
    noTint();
    //colorMode(RGB);
    //ellipse(Cx, Cy, Cdiameter, Cdiameter);
  }
}

class DBall {

  float Dx = 0;
  float Dy = 0;
  //float angle = 1.0;
  float Dspeed = 10;
  int Ddiameter = 30;
  int Dradius = Ddiameter/2;

  DBall (float tempcX, float tempcY) {
    Dx = tempcX;
    Dy = tempcY;
  }

  void Deat() {
    Dy = random(-height, height);
    Dx = 0;
  }

  void Dfall() {
    Dx += Dspeed;
    if (Dx > width) {
      Dy += random(-height, height);
      Dx = 0;
    }
    else if (Dy > height) {
      Dy = random(-height, height);
    }
  }

  void Ddisplay() {
    //fill(255);
    //colorMode(HSB);
    tint(255, random(255), random(255));
    image(balls, Dx, Dy, Ddiameter, Ddiameter);
    noTint();
    //colorMode(RGB);
    //ellipse(Cx, Cy, Cdiameter, Cdiameter);
  }
}

void secondStage() {

  textAlign(CENTER);
  fill(255, 0, 0);
  text("new stage", width/2, textY);
  textY = textY + 3;
  noFill();
  textAlign(LEFT);

  for (int b = 0; b < cballs.length; b++) {
    cballs[b].Cdisplay();
    cballs[b].Cfall();

    boolean hit = rectCircleIntersect(paddle.x, paddle.y, paddle.w, paddle.h, 
    cballs[b].Cx, cballs[b].Cy, cballs[b].Cradius);
    if (hit == true) {
      score --;
      cballs[b].Ceat();
      hurt.trigger();
    }
  }
  nextstage.trigger();

  if (textY > 95) {
    nextstage.stop();
  }
}




void playGame() {

  // score keeper
  fill(255);
  textSize(40);
  text("lives", 10, 50);
  text(score, 10, 80);

  text("level", width -100, 50);
  text(level, width - 100, 80);

  // paddle functions 
  paddle.follow();
  paddle.display();

  if (paddle.y < 0) {
    for (int i = 0; i < pies.length; i++) {
      pies[i].speed += .5;
    }
    paddle.y = height - 20;
    level ++;
    change -= 10;
  }
  else if (change < 10) {
    change = 250;
  }

  else if (paddle.x < 0) {
    paddle.x = width-20;
  }
  if (paddle.x > width) {
    paddle.x = 20;
  }

  // starts a new stage with balls on the x axis



  // if you touch balls loses life, triggers sound
  for (int i = 0; i < pies.length; i++) {
    pies[i].display();
    pies[i].fall(); 

    boolean hit = rectCircleIntersect(paddle.x, paddle.y, paddle.w, paddle.h, 
    pies[i].x, pies[i].y, pies[i].radius);
    if (hit == true) {
      pies[i].eat();
      if (paddle.y < 700) {
        score--; // Add one
        hurt.trigger();
      }
    }
  }

  if (score < finalCatch) {
    mode = 3;
  }
  else if (level > 15) {
    mode = 4;
  }

  // gets you an extra life 

  for (int a = 0; a < powers.length; a++) {
    powers[a].display();
    powers[a].fall();
    //powers[a].offscreen();

    if (rectRectIntersect(paddle.x, paddle.y, paddle.x+paddle.w, paddle.y+paddle.h, powers[a].Px, 
    powers[a].Py, powers[a].Px+powers[a].Pw, powers[a].Py+powers[a].Ph) == true) {
      powers[a].touch();
      power.trigger();
      score++;
    }
    else if (powers[a].Py > height) {
      powers[a].Py = random(-2000); 
      powers[a].Px = random(-width, width-20);
    }
  }

  //slows downs balls
  for (int e = 0; e < slows.length; e++) {
    slows[e].displaySlow();
    slows[e].fallSlow();

    if (rectRectIntersect(paddle.x, paddle.y, paddle.x+paddle.w, paddle.y+paddle.h, slows[e].Sx, 
    slows[e].Sy, slows[e].Sx+slows[e].Sw, slows[e].Sy+slows[e].Sh) == true) {
      slows[e].touchSlow();
      power.trigger();
      for (int i = 0; i < pies.length; i++) {
        pies[i].speed -= random(1, 4);

        if (pies[i].speed < 0) {
          pies[i].speed = 0;
        }
        if (level == 16) {
          pies[i].speed = 0;
        }
      }
    }

    else if (slows[e].Sy > height) {
      slows[e].Sy = random(-2000); 
      slows[e].Sx = random(-width, width-20);
    }
  }
}



class Mouth {

  int x = width/2;
  int y = height - 20;
  int w = 20;
  int h = 10;

  Mouth() {
  }

  void follow() {

    if (keyPressed) {
      if (key==CODED) {
        if (keyCode == LEFT) {
          x=x-8;
        }
        if (keyCode == RIGHT) {
          x=x+8;
        }
        if (keyCode == UP) {
          y=y-8;
        }
      }
    }
  }
  /*if (keyCode == DOWN) {
   y=y+5;
   }*/



  void display() {
    fill(255, 0, 0);
    noStroke();
    rect(x, y, w, h);
    //image(paddles, x, y, w, h);
    textSize(30);
    text(score, x-5, y-4);
  }
}


class Power {

  float Px = random(100);
  float Py = 0;
  float Pspeed = 1.0;
  int Pw = 30;
  int Ph = 30;


  Power (float tempPX, float tempPY) {
    Px = tempPX;
    Py = tempPY;
  }

  void fall() {
    Py += Pspeed;
    if (Py > height + Pw) {
      //y = -100;
      Py = -Pw;
      //x = random(50, 450);
      Px = random(Pw, width-Pw);
    }
  }

  void touch() {

    Px= random(Pw, width-Pw);
    Py = random(-400, 400);
  }

  void offscreen() {
    if (Py > 768) {
      Py = random(-1000);
    }
  }

  void display() {
    fill(0, 197, 255);
    image(life, Px, Py, Pw, Ph);
    //println(Px);
  }
}




class Slow {

  float Sx = random(-400, 400);
  float Sy = 0;
  float Sspeed = 1.0;
  int Sw = 40;
  int Sh = 20;


  Slow (float tempSX, float tempSY) {
    Sx = tempSX;
    Sy = tempSY;
  }

  void fallSlow() {
    Sy += Sspeed;
    if (Sy > height + Sw) {
      //y = -100;
      Sy = -Sw;
      //x = random(50, 450);
      Sx = random(Sw, width-Sw);
    }
  }

  void touchSlow() {

    Sx= random(20, width-20);
    Sy = random(-8000, 400);
  }

  void offscreenSlow() {
    if (Sy > 768) {
      Sy = random(-800, -400);
    }
  }

  void displaySlow() {
    fill(0, 197, 255);
    image(slowsI, Sx, Sy, Sw, Sh);
    //println(Px);
  }
}



void restartGame() {
  // Reset the score
  score = 5;
  level = 1;
  change = 255;
  // Set pies off screen 
  for (int i = 0; i < pies.length; i++) {
    
    pies[i].eat();
    pies[i].display();
    pies[i].fall(); 
    pies[i].speed = random(1.0, 3.0);
  }
  for (int a = 0; a < powers.length; a++) {
    powers[a].touch();
  }
  
   for (int e = 0; e < slows.length; e++) {
    slows[e ].touchSlow();
  }
  
  paddle.y = height - 20;
}


boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);

  if (circleDistanceX > (rw/2 + cr)) { 
    return false;
  }
  if (circleDistanceY > (rh/2 + cr)) { 
    return false;
  }
  if (circleDistanceX <= rw/2) { 
    return true;
  }
  if (circleDistanceY <= rh/2) { 
    return true;
  }

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}


boolean rectRectIntersect(float left, float top, float right, float bottom, 
float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



