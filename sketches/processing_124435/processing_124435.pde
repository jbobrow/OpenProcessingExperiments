
/* 
 Spaceship and single bullet with code as simple as possible
 -- level: beginner ---
 Joan Soler-Adillon, 2013
 */

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


void setup() {
  size(400, 300);
}

void draw() {
  background(0);

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
    fill(255);
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
  //keep spaceship inside (wrap around)
  if (x<-spaceShipSz)x=width+spaceShipSz;
  if (x>width+spaceShipSz)x=-spaceShipSz;
  if (y<-spaceShipSz)y=height+spaceShipSz;
  if (y>height+spaceShipSz)y=-spaceShipSz;
}

void keyPressed() {
  if (key==' ') {
    angb = ang;
    xb = x;
    yb = y;
  }
  if (keyCode==RIGHT)sh_turningRight = true;
  if (keyCode==LEFT) sh_turningLeft = true;
  if (keyCode==UP) sh_movingForward = true;
  if (keyCode==DOWN) sh_movingBackwards = true;
}

void keyReleased() {
  if (keyCode==RIGHT)sh_turningRight = false;
  if (keyCode==LEFT) sh_turningLeft = false;
  if (keyCode==UP) sh_movingForward = false;
  if (keyCode==DOWN) sh_movingBackwards = false;
}

