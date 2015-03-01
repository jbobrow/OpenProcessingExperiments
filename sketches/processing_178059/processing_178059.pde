
//Anthony Lalli
//20532892

import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context


//spaceShip variables
float ang = HALF_PI; //initial rotation
float x = 200; //initial position X
float y = 150; //initial position Y
float rotateVel = 0.05; // rotation speed
float radius = 2; //movement speed
int spaceShipSz = 20;
 
//moving vars
boolean sh_movingForward = false;
boolean sh_movingBackwards = false;
boolean sh_turningRight = false;
boolean sh_turningLeft = false;
 
 
//bullet variables (off-screen)
float xb = -100;//initial x
float yb = -100;//initial y
float angb = -100;//initial angle
float radiusb = 5; //movement speed for bullet
PImage bg;
void setup() {
  
  bg = loadImage("smooth.jpg");
image(bg, 0, 0);
 minim = new Minim(this);
  player = minim.loadFile("Smooth.mp3", 2048);
  player.play();
size(400, 300);

 
}
 
void draw() {
background(255);
  image(bg,0,0);
  //draw bullet
  //move it first
  if (angb != -100) {
    //convert polar coordinates to cartesian in order to move (towards pointing angle)
    float moveX = radiusb * sin(angb);
    float moveY = -radiusb * cos(angb);
 
    xb += moveX;
    yb += moveY;
  }
  fill(255, 0, 0);
  ellipse(xb, yb, 10, 10);
 
  //draw spaceship
    fill(#FFD900);
  pushMatrix();
  translate(x, y);
  rotate(ang);
  triangle(0, -spaceShipSz, -spaceShipSz/2, spaceShipSz, spaceShipSz/2, spaceShipSz);
  popMatrix();
 
  //check movement of spaceShip
  float moveX = radius * sin(ang);
  float moveY = -radius * cos(ang);
 
  if (sh_movingForward) {
    x += moveX;
    y += moveY;
  }
  if (sh_movingBackwards) {
    x -= moveX;
    y -= moveY;
  }
  if (sh_turningRight) {
    ang += rotateVel;
  }
  if (sh_turningLeft) {
    ang -= rotateVel;
  }
  //keep spaceship inside 
  if (x<-spaceShipSz)x=width+spaceShipSz;
  if (x>width+spaceShipSz)x=-spaceShipSz;
  if (y<-spaceShipSz)y=height+spaceShipSz;
  if (y>height+spaceShipSz)y=-spaceShipSz;
}

void mousePressed() {
    
    angb = ang;
    xb = x;
    yb = y;
}
 
void keyPressed() {

  if (key=='d')sh_turningRight = true;
  if (key=='a') sh_turningLeft = true;
  if (key=='w') sh_movingForward = true;
  if (key=='s') sh_movingBackwards = true;
}
 
void keyReleased() {
  if (key=='d')sh_turningRight = false;
  if (key=='a') sh_turningLeft = false;
  if (key=='w') sh_movingForward = false;
  if (key=='s') sh_movingBackwards = false;
 
}



void stop()
{
  player.close();
  minim.stop();
  super.stop();
}




