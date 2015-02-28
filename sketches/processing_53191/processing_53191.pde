
PImage bg;

float x;
float y;

float speedx;
float speedy;
float gravity;

boolean startJump=false;

boolean moveLeft=true;
boolean moveRight=true;
boolean moveUp=true;

color[] cU=new color[3];
color[] cD=new color[3];
color[] cL=new color[3];
color[] cR=new color[3];

color C;

void setup() {
  size(600, 600);

  bg=loadImage("map.png");

  x=30;
  y=550;
  speedx=1;
  speedy=4;
  gravity=3;

  C=bg.pixels[(bg.width*5)+(5)];
}


void draw() {
  image(bg, 0, 0);
  noStroke();
  fill(0, 255, 0);
  rect(x, y, 18, 18);
  y+=gravity;

  if (keyPressed) {
    if (keyCode==LEFT && moveLeft==true) {
      x-=speedx;
    }
    if (keyCode==RIGHT && moveRight==true) {
      x+=speedx;
    }
    if (keyCode==UP && moveUp==true) {
      startJump=true;
    }
  }
  if (startJump==true) {
    y-=speedy;
  }

  for (int lop=0;lop<3;lop++) {
    ////selecting the color that box touches 
    cU[lop]=bg.pixels[((int)bg.width*(int)y-5)+((int)x+(6*lop))];
    cD[lop]=bg.pixels[((int)bg.width*((int)y+22))+((int)x+(6*lop))];

    cL[lop]=bg.pixels[((int)bg.width*((int)y+(6*lop)))+((int)x-5)];
    cR[lop]=bg.pixels[((int)bg.width*((int)y+(6*lop)))+((int)x+25)];

    if (cD[lop]==C) {
      gravity=0;
    }
    else {
      gravity=2;
    }
    if (cU[lop]==C) {
      startJump=false;
      moveUp=false;
    }else
    {
      moveUp=true;
    }
    if (cL[lop]==C) {
      moveLeft=false;
    }
    else {
      moveLeft=true;
    }
    if (cR[lop]==C) {
      moveRight=false;
    }
    else {
      moveRight=true;
    }
  }
  println(moveUp);
}


