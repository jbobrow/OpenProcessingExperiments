
//  Maya Tanaka
//  Desma 28 Interactivity
//  2010/11/16
//  Project05 v1.2

//  Image Declaration---------------------------------
PShape foreground;
PShape streetlights;
PShape city;
PShape light01;
PShape light02;
PShape light03;
PShape light04;
PShape light05;
PShape light06;
PShape light07;
PShape light08;
PShape light09;
PShape light10;
PShape light11;
PShape light12;
PShape light13;
PShape light14;
PShape light15;
PShape light16;
PShape light17;
PShape light18;
PShape light19;
PShape light20;
PShape light21;
PShape light22;
PShape light23;
PShape light24;
PShape light25;
PShape light26;
PShape light27;
PShape light28;
PShape light29;
PShape light30;
PShape light31;
PImage foregroundPng;

//  Variable Declaration------------------------------
int starSize, starX, starY;

//  Setup---------------------------------------------
void setup () {
  size (640,480);
  smooth ();

  foregroundPng = loadImage ("foreground.png");
  foreground = loadShape ("foreground.svg");
  city = loadShape ("city.svg");
  streetlights = loadShape ("lights.svg");
  light01 = loadShape ("light01.svg");
  light02 = loadShape ("light02.svg");
  light03 = loadShape ("light03.svg");
  light04 = loadShape ("light04.svg");
  light05 = loadShape ("light05.svg");
  light06 = loadShape ("light06.svg");
  light07 = loadShape ("light07.svg");
  light08 = loadShape ("light08.svg");
  light09 = loadShape ("light09.svg");
  light10 = loadShape ("light10.svg");
  light11 = loadShape ("light11.svg");
  light12 = loadShape ("light12.svg");
  light13 = loadShape ("light13.svg");
  light14 = loadShape ("light14.svg");
  light15 = loadShape ("light15.svg");
  light16 = loadShape ("light16.svg");
  light17 = loadShape ("light17.svg");
  light18 = loadShape ("light18.svg");
  light19 = loadShape ("light19.svg");
  light20 = loadShape ("light20.svg");
  light21 = loadShape ("light21.svg");
  light22 = loadShape ("light22.svg");
  light23 = loadShape ("light23.svg");
  light24 = loadShape ("light24.svg");
  light25 = loadShape ("light25.svg");
  light26 = loadShape ("light26.svg");
  light27 = loadShape ("light27.svg");
  light28 = loadShape ("light28.svg");
  light29 = loadShape ("light29.svg");
  light30 = loadShape ("light30.svg");
  light31 = loadShape ("light31.svg");

  ellipseMode (CENTER);
}

//  Draw----------------------------------------------
void draw () {
  //  Gradient----------------------------------------
  ////  (0,0,0) -> (40,70,180)
  ////  (40,70,180) -> (220,240,250)
  ////  (40,100,160) -> (140,200,255)
  for (int i=0; i<=height; i++) {
    float r = map (i, 0,height, 0,40);
    float g = map (i, 0,height, 0,70);
    float b = map (i, 0,height, 0,185);
    stroke (r,g,b);
    line (0,i, width,i);
  }

  //  Stars-------------------------------------------
  noStroke ();
  star (180,30, 7);
  star (195,70, 2);
  star (400,100, 5);
  star (380,150, 3);
  star (270,215, 2);
  star (465,35, 3);
  star (450,10, 1);
  star (265,235, 4);
  star (410,115, 2);
  star (240,220, 3);
  star (345,50, 4);
  star (235,120, 2);
  star (465,190, 3);
  star (365,275, 2);

  shape (city, 0,0);
  //  City Lights-------------------------------------
  if (mouseX > 120) {
    shape (light31, 0,0);
  }
  if (mouseX > 160) {
    shape (light15, 0,0);
  }
  if (mouseX > 190) {
    shape (light21, 0,0);
  }
  if (mouseX > 220) {
    shape (light07, 0,0);
    shape (light25, 0,0);
  }
  if (mouseX > 230) {
    shape (light04, 0,0);
    shape (light11, 0,0);
  }
  if (mouseX > 240) {
    shape (light08, 0,0);
  }
  if (mouseX > 250) {
    shape (light18, 0,0);
  } 
  if (mouseX > 255) {
    shape (light03, 0,0);
  }
  if (mouseX > 280) {
    shape (light22, 0,0);
  }
  if (mouseX > 290) {
    shape (light26, 0,0);
    shape (light19, 0,0);
  }
  if (mouseX > 320) {
    shape (light13, 0,0);
    shape (light23, 0,0);
  }
  if (mouseX > 360) {
    shape (light30, 0,0);
    shape (light14, 0,0);
  }
  if (mouseX > 380) {
    shape (light01, 0,0);
    shape (light10, 0,0);
  }
  if (mouseX > 400) {
    shape (light28, 0,0);
  }
  if (mouseX > 420) {
    shape (light16, 0,0);
  }
  if (mouseX > 440) {
    shape (light29, 0,0);
  }
  if (mouseX > 450) {
    shape (light05, 0,0);
  }
  if (mouseX > 500) {
    shape (light09, 0,0);
  }
  if (mouseX > 520) {
    shape (light27, 0,0);
    shape (light06, 0,0);
  }
  if (mouseX > 530) {
    shape (light17, 0,0);
  }
  if (mouseX > 540) {
    shape (light20, 0,0);
  }
  if (mouseX > 560) {
    shape (light02, 0,0);
  }
  if (mouseX > 600) {
    shape (light12, 0,0);
    shape (light24, 0,0);
  }

  //  Tint--------------------------------------------
  int foregroundAlpha = int (map(mouseX, 0,width, 20,150));
  tint (foregroundAlpha);
  //  shape (foreground, 0,0);
  image (foregroundPng, 0,0, width,height);

  //  Ellipse Gradients-------------------------------
  //  float a = -240;
  float a = map(mouseX, 0,width, -240,50);
  //  float lightsRadius = 50;
  float lightsRadius = map (mouseX, 0,width, 30,60);
  float differenceRadius = map (lightsRadius, 30,60, 5,10);
  noStroke ();
  for (float j = (lightsRadius + 20); j > 10; j -=differenceRadius) {
    fill (250,255,100, a);
    ellipse (105,120, j,j);
    ellipse (490,125, j,j);
    a += 30;
  }

  shape (streetlights, 0,0);
  println (mouseX + ", " + mouseY);
}

void star (int starX, int starY, int starSize) {
  float starAlpha = map (mouseX, 0,width, 240, 50);
  float differenceRadiusStar = map (starSize, 1,10, 1,5);
  for (float k = (starSize * 2); k > starSize; k -= differenceRadiusStar) {
    fill (255, starAlpha);
    ellipse (starX,starY, k,k);
    starAlpha += 30;
  }
}


