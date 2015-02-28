
import processing.video.*;
Movie soundEffect;
// Left side is P1, right side is P2
float x=0;
float y=0;
float vx=2;
float vy=0;
float a=1;
// Ball size
int r=5;
// Racket size
int h=25;
float y1=0;
float y2=0;
float v1=0;
float v2=0;
float a1=0.2;
float a2=0.2;
// Define racket middle
float m=10;
boolean hit=false;
boolean start=false;
PFont f;
// Points
int p1=0;
int p2=0;

boolean gameOver=false;

void setup() {
  size(500, 300);
  x=width/2;
  y=height/2;
  y1=height/2;
  y2=height/2;
  f=loadFont("Monospaced-15.vlw");
  soundEffect=new Movie(this, "Frog.aiff");
}

void draw() {
  background(45, 75, 45);
  textFont(f);
  fill(255);
  textAlign(LEFT);
  text("P1: "+p1, 10, 20);
  textAlign(RIGHT);
  text("P2: "+p2, width-10, 20);
  // Net
  stroke(0);
  rectMode(CENTER);
  for (int i=0; i<=height; i+=6) {
    line(width/2, i, width/2, i+2);
  }
  // gameOver
  fill(255);
  textFont(f);
  textAlign(CENTER);
  if (p1==11) {
    text(" P1 wins! ", 250, 100);
    gameOver=true;
  } 
  if (p2==11) {
    text(" P2 wins! ", 250, 100);
    gameOver=true;
  }
  // Ball
  stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(x, y, 2*r, 2*r);
  // P1 racket
  noStroke();
  rect(0, y1, 10, 2*h);
  // P2 racket
  rect(width, y2, 10, 2*h);

  // Move rackets up and down by pressing w and s (P1) or p and ö (P2)
  if (keyPressed) {
    if (key=='w' || key=='W') {
      v1=v1-a1;
    } 
    if (key=='s' || key=='S') {
      v1=v1+a1;
    } 
    if (key=='p' || key=='P') {
      v2=v2-a2;
    } 
    if (key=='ö' || key=='Ö') {
      v2=v2+a2;
    }
  }

  // Move ball
  if (start) {
    x=x+vx;
    y=y+vy;
    y1=y1+v1;
    y2=y2+v2;
  }
  else {
    v1=0;
    v2=0;
  }

  // Racket hits edge
  if (y1-h<=0) {
    y1=h;
    v1=-v1/4;
  } 
  else if (y1+h>=height) {
    y1=height-h;
    v1=-v1/4;
  }
  if (y2-h<=0) {
    y2=h;
    v2=-v2/4;
  } 
  else if (y2+h>=height) {
    y2=height-h;
    v2=-v2/4;
  }

  // Was it a hit?
  if (y>=y1-h && y<=y1+h && x>-r && x<=r) {
    hit=true;
  }
  else if (y>=y2-h && y<=y2+h && x<width+r && x>=width-r) {
    hit=true;
  } 
  else {
    hit=false;
  }

  // Bounce back when ball hits racket
  if (hit) {
    if (x<0) {
      x=0;
      vy=vy+0.5*v1;
    }
    else if (x>width) {
      x=width;
      vy=vy+0.5*v2;
    }
    vx=-vx;
    soundEffect.stop();
    soundEffect.play();

    // P1 good/bad hit
    if (x<=r) {
      if (y>y1-m && y<y1+m) {
        vx=1.5*vx;
      } 
      else {
        vx=0.9*vx;
      }
    }

    // P2 good/bad hit
    if (x>=width-r) {
      if (y>y2-m && y<y2+m) {
        vx=1.5*vx;
      } 
      else {
        vx=0.9*vx;
      }
    }
  }

  // SERVE
  if (!hit && (x<-100 || x>width+100)) {
    if (x<width/2) {
      p2=p2+1;
      vx=2;
    } 
    else if (x>width/2) {
      p1=p1+1;
      vx=-2;
    } 
    x=width/2;
    y=height/2;
    vy=0;
  }

  // Bounce back when ball hits the edge (y)
  if (y<=0+r || y>=height-r) {
    vy=-vy;
  }

  // Begränsa hastighet till +-5
  vx=constrain(vx, -7, 7);
  vy=constrain(vy, -5, 5);
}

void mousePressed() {
  start=!start;
}



