
void setup(){
  size(1000,1000);
  smooth();
}
void draw(){
  background(0);
  rectMode(CENTER);
  fill(255,0,0);
  rect(30,500,75,1000);
  fill(0,255,0);
  rect(975,500,75,1000);
  fill(255);
  //puck left
  rect(50,YL,50,200);
  //puck right
  rect(950,YR,50,200);
  //ball
  ellipse(x,y,15,15);
  move();
  bounce();
  moveLeft();
  collisonRight();
  collisonLeft();
  countX();
  countY();
}
float x;
float y;
float iniX = 500;
float iniY = 200;
float tX = 0;
float tY = 0;
int velX = 5;
int velY = 5;
float YL;
float YR;
int countX = 0;
int countY = 0;
void move(){
  x = iniX + velX * tX;
  y = iniY + velY * tY;
  tX++;
  tY++;
}
void bounce(){
  if(x<0){
    iniX = 0;
    velX = -velX;
    tX = 0;
    countX = countX + 1;
  }
  if(x>1000){
    iniX = 1000;
    velX = -velX;
    tX = 0;
    countY = countY + 1;
  }
  if(y<0){
    iniY = 0;
    velY = -velY;
    tY = 0;
  }
  if(y>1000){
    iniY = 1000;
    velY = -velY;
    tY = 0;
  }
}

void moveLeft(){
  YL = mouseY;
}
void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      YR = YR - 20;
    }
    else if (keyCode == DOWN){
      YR = YR + 20;
    }
  }
}
void collisonRight(){
  if(x>925 && y>YR-100 && y <YR+100){
    iniX = 925;
    velX = -velX;
    tX = 0;
  }
}
void collisonLeft(){
  if(x<75 & y>YL-100 & y< YL+100){
    iniX=75;
    velX=-velX;
    tX=0;
  }
}
void countX(){
  PFont myFont = createFont("FFScala", 32);
   textFont(myFont);
   text(countX, 475, 30);
}
void countY(){
  PFont myFont = createFont("FFScala", 32);
   textFont(myFont);
   text(countY, 505, 30);
}





