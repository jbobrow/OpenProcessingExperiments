
boolean dead1;
boolean dead2;
boolean dead3;
boolean dead4;

Red Red1;
Yellow Yellow1;
Yellow Yellow2;
Yellow Yellow3;
Yellow Yellow4;
Green Green1;

int savedTime;
int totalTime = 9500;

PImage GreenGhost;
PImage RedGhost;
PImage YellowGhost;
PImage Death;
PImage background;

void setup(){
  dead1 = false;
  dead2 = false;
  dead3 = false;
  dead4 = false;
  size(600,600);
  frameRate(24);
  savedTime = millis();
  
  //Images
  background = loadImage("PacBackground.jpg");
  GreenGhost = loadImage("GreenGhost.png");
  RedGhost = loadImage("RedGhost.png");
  YellowGhost = loadImage("YellowGhost.png");
  Death = loadImage("GhostDeath.png");
  
  //Classes
  Red1 = new Red (random(100,500),random(100,500),8,5);
  Yellow1 = new Yellow (random(100,500),random(100,200),random(-8,8),1);
  Yellow2 = new Yellow (random(100,500),random(200,300),random(-8,8),1);
  Yellow3 = new Yellow (random(100,500),random(300,400),random(-8,8),1);
  Yellow4 = new Yellow (random(100,500),random(300,400),random(-8,8),1);
  Green1 = new Green (random(100,500), random(100,500),10,6);
}
void draw() {
  image(background,0,0);
  noStroke();
  line(25,0,25,600);
  line(575,0,575,600);
  line(0,25,575,25);
  line(0,575,575,575);
  Red1.move();
  Red1.draw();
  Yellow1.move();
  Yellow1.draw();
  Yellow2.move();
  Yellow2.draw();
  Yellow3.move();
  Yellow3.draw();
  Yellow4.move();
  Yellow4.draw();
  Green1.move();
  Green1.draw();
}
  
// Red Ghost
class Red {
  float x;
  float y;
  float x_speed;
  float y_speed;
  
  Red (float CLASS_X, float CLASS_Y, float X_Speed, float Y_Speed) {
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
  
void draw() {
 image(RedGhost,x,y);
}
void move() {
  if (x > 540 || x < 25) {
    x_speed = -x_speed;
  }
  if (y > 540 || y < 25) {
      y_speed = -y_speed;
    }
   
    x += x_speed;
    y += y_speed;}
}

//Yellow Ghost
class Yellow {
  float x;
  float y;
  float x_speed;
  float y_speed;
  
  Yellow (float CLASS_X, float CLASS_Y, float X_Speed, float Y_Speed) {
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
  
void draw() {
//Ghost #1
  if (dead1 == false) {
 image(YellowGhost,x,y);
  }
 if (dead1 == true) {
   image(Death,Yellow1.x,Yellow1.y);
 }
float ghostx = 25;
float ghosty = 25;
float distancex = abs((Yellow1.x - Red1.x));
float distancey = abs((Yellow1.y - Red1.y));
 if ((distancex < ghostx) && (distancey < ghosty)) {
   image(Death,Yellow1.x,Yellow1.y);
   dead1 = true;
   Yellow1.x_speed=0;
   Yellow1.y_speed=0;
 }
 
//Ghost #2
if (dead2 == false) {
 image(YellowGhost,x,y);
  }
 if (dead2 == true) {
   image(Death,Yellow2.x,Yellow2.y);
 }
float distancex2 = abs((Yellow2.x - Red1.x));
float distancey2 = abs((Yellow2.y - Red1.y));
 if ((distancex2 < ghostx) && (distancey2 < ghosty)) {
   image(Death,Yellow2.x,Yellow2.y);
   dead2 = true;
   Yellow2.x_speed=0;
   Yellow2.y_speed=0;
 }
 
//Ghost #3
if (dead3 == false) {
 image(YellowGhost,x,y);
  }
 if (dead3 == true) {
   image(Death,Yellow3.x,Yellow3.y);
 }
float distancex3 = abs((Yellow3.x - Red1.x));
float distancey3 = abs((Yellow3.y - Red1.y));
 if ((distancex3 < ghostx) && (distancey3 < ghosty)) {
   image(Death,Yellow3.x,Yellow3.y);
   dead3 = true;
   Yellow3.x_speed=0;
   Yellow3.y_speed=0;
 }
 
//Ghost #4
if (dead4 == false) {
 image(YellowGhost,x,y);
  }
 if (dead4 == true) {
   image(Death,Yellow4.x,Yellow4.y);
 }
float distancex4 = abs((Yellow4.x - Red1.x));
float distancey4 = abs((Yellow4.y - Red1.y));
 if ((distancex4 < ghostx) && (distancey4 < ghosty)) {
   image(Death,Yellow4.x,Yellow4.y);
   dead4 = true;
   Yellow4.x_speed=0;
   Yellow4.y_speed=0;
 }
}
void move() {
  if (x > 540 || x < 25) {
    x_speed = -x_speed;
  }
  if (y > 540 || y < 25) {
      y_speed = -y_speed;
    }
   
    x += x_speed;
    y += y_speed;}
}

//Green Ghost
class Green {
  float x;
  float y;
  float x_speed;
  float y_speed;
  
  Green (float CLASS_X, float CLASS_Y, float X_Speed, float Y_Speed) {
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
  
void draw() {
 image(GreenGhost,x,y);
 int passedTime = millis() - savedTime;
 if (passedTime > totalTime) {
   image(Death,x,y);
   x_speed += -x_speed;
   y_speed += -y_speed;
 }
 
}
void move() {
  if (x > 540 || x < 25) {
    x_speed = -x_speed;
  }
  if (y > 540 || y < 25) {
      y_speed = -y_speed;
    }
   
    x += x_speed;
    y += y_speed;}
}


