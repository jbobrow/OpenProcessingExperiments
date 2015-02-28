
boolean gameOver;
Particle[] particles = new Particle[0];
int maxParticles = 900;
TheGrinch[] grinches = new TheGrinch[0];
int score = 0;
int startFrame;

float speed = 2;
PImage grinch;

void setup() {
  size(600, 400);
  grinch = loadImage("grinch.png");
}

void draw() {
  background(0);
  fill(255);
  text("score:" + score, 40, 40);

  if (!gameOver) { 

    updategrinch();
    updateParticles();
    //This is for when the game is more than 1000 frames the game will end
    if (frameCount-startFrame>1000) gameOver = true;
  }

  else {
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
  }

  fill (255);
  ellipse(mouseX, mouseY, 20, 20);
}

void mousePressed() {

  if (!gameOver) {
  }
  for (int i = 0; i<grinches.length; i++) {
    TheGrinch grinch = grinches[i];

    if ((mouseX>grinch.x) && (mouseX<grinch.x + grinch.w) && (mouseY>grinch.y) && (mouseY<grinch.y+grinch.h)) {
      grinch.alive = false;
      grinch.velX = 0;
      score++;
      makeExplosion(grinch.x + (grinch.w/2), grinch.y+(grinch.h/2));
    }
  }
}


void updateParticles() {

    while (particles.length>maxParticles) {
    particles = (Particle[]) subset(particles, 1);
  }

  for (int i=0; i<particles.length; i++) {  
    particles[i].update();
  }
}

void updategrinch() { // This creates the new grinch images

  if (frameCount % 40 == 0) {
    TheGrinch grinch = new TheGrinch();
    grinches = (TheGrinch[]) append(grinches, grinch);
    speed +=0.03;
  }

  if (grinches.length>10) { // if there is more than 10 grinches it will get rid of some

    grinches = (TheGrinch[]) subset(grinches, 1);
  }

  for (int i = 0; i<grinches.length; i++) {
    grinches[i].update();
  }
}

void makeExplosion(float xpos, float ypos) {// this creates the explotion when a snowball is thrown at the grinch

  for (int i = 0; i<100; i++) {
    Particle p = new Particle(xpos, ypos);
    p.yVel = random(-3, 3);
    p.xVel = random(-3, 3);
    p.gravity = 0.2;
    p.fadeSpeed = 0.96;
    p.shrink = 0.96;

    particles = (Particle[]) append(particles, p );
  }
}


class Particle {

  float x;
  float y;
  float xVel;
  float yVel;
  float particleSize;
  float opacity;
  float gravity;
  float fadeSpeed;
  float shrink;

  Particle(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    xVel = random(-5, 5);
    yVel = random(-5, 5);
    particleSize = random(5, 15);

    opacity = 255;
    gravity = 0;
    fadeSpeed = 1;
    shrink =1;
  }

  void update() {
    x+=xVel;
    y+=yVel;
    opacity*=fadeSpeed;
    yVel += gravity;
    particleSize*=shrink;

    noStroke();
    fill(255, opacity);
    ellipse(x, y, particleSize, particleSize);
  }
}

class TheGrinch {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  boolean alive;

  TheGrinch() {

    y = random(0, height*0.8);
    w = 50;
    x = width;
    h = 50;
    velX = -speed;
    velY = 0;
    alive = true;
  } 

  void update() {
    x+=velX;
    y+=velY;

    if (alive) {
    } 
    else {
      velY +=0.3;
    }
    image(grinch, x, y, w, h);
  }
}


