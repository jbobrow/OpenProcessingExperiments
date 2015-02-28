
// Created by Nikki Liao
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP

void setup() { 
  size(712, 450); 
  smooth ();
  scale(0.9);
  rectMode(CORNERS);
  PImage house=loadImage ("SE.jpg");
  image (house, 0, 0);
  stroke(80);
  frameRate(1);
} 

void draw() {
  
  strokeWeight (1);
  fill (250, 50);
  rect (0, 0, width, height);
  int x = width/10; 
  int y = height/4; 

  float blkW2 = 500; 
  float blkH2 = random (300, 340); 

  float locC = random (-100, 200);
  float locD = random (-100, 100);

  float colorB = random (9);
  if (colorB < 3) {
    fill (255, 50);
  } 
  else if (colorB >= 3 && colorB <6) {
    fill (255, 5);
  }
  else {
    fill (255, 99);
  }

  rect (x+locC, y+locD-5, x+blkW2+locC, y+blkH2+locD-5);

  float blkW = random (100, 120); 
  float blkH = 320; 

  float locA = random (100, 500);
  float locB = random (-200, 200);

  float colorA = random (2);
  if (colorA < 1) {
    fill (255, 255, 255);
  } 
  else if (colorA >1) {
    fill (255, 255, 0);
  }
  rect (x+locA, y+locB, x+blkW+locA, y+blkH+locB);
  
  strokeWeight(4);
  line (x+locA+85, y+locB+20, x+locA+85, y+locB+320);

  strokeWeight(1);
  float blkW3 = random (120, 140); 
  float blkH3 = 90; 

  float locE = random (50, 400);
  float locF = random (20, 50);

  float colorC = random (9);
  if (colorC < 3) {
    fill (0, 0, 255);
  } 
  else if (colorC >= 3 && colorC <6) {
    fill (255, 0, 0);
  }
  else {
    fill (255, 255, 0);
  }
  rect (x+locE, y+locF+150, x+blkW3+locE, y+blkH3+locF+150);

  strokeWeight(2);
  line (x+locE+110, y+locF+150+10, x+locE+200, y+locF+150+10);
  line (x+locE+110, y+locF+150+30, x+locE+200, y+locF+150+30);

  strokeWeight(1);
  float blkW4 = random (180, 250); 
  float blkH4 = 60; 

  float locG = random (50, 500);
  float locH = random (-250, 10);

  float colorD = random (9);
  if (colorD < 3) {
    fill (0, 0, 255);
  } 
  else if (colorD >= 3 && colorD <6) {
    fill (255, 255, 0);
  }
  else {
    fill (255, 0, 0);
  }
  rect (x+locG-25, y+locH+250, x+blkW4+locG-25, y+blkH4+locH+250);

  strokeWeight (1);
  float blkW5 = random (40, 60); 
  float blkH5 = random(80, 100);

  float locI = random (-450, 10);
  float locJ = random (50, 100);

  float colorE = random (9);
  if (colorE < 3) {
    fill (0, 0, 255);
  } 
  else if (colorE >= 3 && colorE <6) {
    fill (255, 255, 0);
  }
  else {
    fill (255, 0, 0);
  }

  rect (x+locI+500, y+locJ, x+blkW5+locI+500, y+blkH5+locJ); 
}


void mousePressed() {
  noLoop();
  redraw();
}


