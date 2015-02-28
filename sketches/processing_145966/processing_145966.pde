
/* @pjs preload="couch.png, katie.png, dan.png,tear.png,sadmouth.png,hammer.png,welcome.png"; */

float x = 100;
int t = 0;
int speed = 150;
float y = 250;
float headspeed = .5;
float hitbox = 25;
float hitboxy = 40;
int hit = 4;
PImage couch;
PImage katie;
PImage dan;
PImage tear;
PImage sadmouth;
PImage hammer;
PImage welcome;
PFont font;
boolean mouseOver = false;
int who = 0;
float tearY = 250;
boolean restart = false;

void setup() {

  size(500, 500);
  rectMode(CENTER);
  imageMode(CENTER);
  couch = loadImage("couch.png");
  katie = loadImage("katie.png");
  dan = loadImage("dan.png");
  tear = loadImage("tear.png");
  sadmouth = loadImage("sadmouth.png");
  hammer = loadImage("hammer.png");
  welcome = loadImage("welcome.png");
  font = loadFont("Arial-BoldMT-48.vlw");
}

void draw() {

  background(0);
  textFont(font, 30);
  t = t+1;
  if (t>speed) {
    x = random(100, 400);
    t = 0;
    y = 250;
    who = int(random(3));
  }

  if (mouseX < x+hitbox && mouseX >x-hitbox && mouseY<y+hitboxy+20&&mouseY>y-hitboxy+20) {
    mouseOver = true;
    //    rect(x, y, hitbox*2, hitboxy*2);
  }
  else {
    mouseOver = false;
  }
  head(x);
  image(couch, width/2, height/2+120, 500, 500);
  hammer(mouseX);
  text(hit, 50, 50);

  if (hit==3) {
    endGame();
  }
  if (hit==4) {
    begin();
  }
}

void hammer(float x) {
  image(hammer, mouseX-150, mouseY+200, 200, 400);
  stroke(255);
  line(mouseX+10, mouseY, mouseX-10, mouseY);
  line(mouseX, mouseY+10, mouseX, mouseY-10);
}

void head(float x) {
  y = y-headspeed;
  if (who == 0) {
    image(katie, x, y+60, 80, 160);
    //katie.resize(80, 160);
  } 
  else {
    image(dan, x, y+40, 40, 110);
  }
}

void mouseReleased() {
  if (mouseOver && who==0) {
    hit = hit+1;
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    t = 2000;
  }
}

void endGame() {
  tearY = tearY + 1;
  background(0);
  textFont(font, 12);
  text("It's okay, you're okay, don't tell mom!", 10, height/2);
  text("HAPPY BIRTHDAY KATIE!", 10, 400);
  text("PRESS ANY KEY TO REPLAY", 10, 450);
  image(katie, 300, 300, 150, 250);
  image(sadmouth, 307, 262, 90, 60);
  image(tear, 284, tearY, 30, 30);

  if (tearY>300) {
    tearY = 250;
  }
  if (keyPressed) {
    hit=4;
  }
}

void begin() {
  background(0);
  textFont(font, 16);
  image(welcome, width/2+10, height/2+10, 450, 450);
  frameRate(100);
  if (keyPressed) {
    hit=0;
  }
}



