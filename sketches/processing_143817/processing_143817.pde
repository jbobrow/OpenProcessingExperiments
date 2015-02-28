
PImage maze;
PImage cloud;

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

  maze=loadImage("http://oi59.tinypic.com/2w1vc7l.jpg");
  cloud=loadImage("http://img2.wikia.nocookie.net/__cb20130117071203/finalfantasy/images/f/fe/Cloud_ATB.png"); 
  
  x=30;
  y=550;
  speedx=3;
  speedy=6;
  gravity=10;

  C=maze.pixels[(maze.width*5)+(5)];
}


void draw() {
  image(maze, 0, 0);
  noStroke();
  fill(random (0,255));
  image(cloud, x, y, 35, 35);
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
    cU[lop]=maze.pixels[((int)maze.width*(int)y-5)+((int)x+(6*lop))];
    cD[lop]=maze.pixels[((int)maze.width*((int)y+22))+((int)x+(6*lop))];

    cL[lop]=maze.pixels[((int)maze.width*((int)y+(6*lop)))+((int)x-5)];
    cR[lop]=maze.pixels[((int)maze.width*((int)y+(6*lop)))+((int)x+25)];

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



