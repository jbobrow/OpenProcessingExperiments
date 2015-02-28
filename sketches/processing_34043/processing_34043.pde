
/*
Code thanks in part by Ramsey nassar
 */

//JUVENILE VARS
float juvX, juvY, juvSpeed, maxSpeed, ySpeed, gravity;
float juvXspeed, juvYspeed, juvFriction,juvYacceleration, juvAcceleration;
int juvHeight = 20;
int juvWidth = 20;


//KEY PRESSES
final int keyDownArraySize = 127;
boolean[] keyDown = new boolean[keyDownArraySize];

void setup() {
  size (900, 500);
  smooth();

  /*
create gamestate for opening screen and ints for platforms
   */


  initJuv();
  initKeyDownArray();
  initPlatforms();
}

void initJuv() {

  juvX = float (width / 2);
  juvY = float (height - juvHeight);
  juvAcceleration = .15;
  gravity = .8;
  ySpeed = 0;
  juvFriction = .7;
  juvSpeed = 5;
  maxSpeed = 10;
}

void initKeyDownArray() {
  for (int i=0; i<keyDownArraySize; i++) {
    keyDown[i] = false;
  }
}

void initPlatforms() {
  //draw platforms here
}

//------------------------------------------------------------------------- DRAW LOOP 


void draw() {

  background (0);

  updateJuv();
//  updateCops();

//  if (isSpray) {
//    updateSpray();
//  }

  handleInput();
  
  
}


void jumping() {
 juvY -= 10;
  
}

void updateJuv() {
  //moveJuv
  moveJuv();
  checkScreenBounds();
  drawJuv();
}

void moveJuv() {
  constrain(juvXspeed, -maxSpeed, maxSpeed);

  juvX += juvXspeed;
  
  juvXspeed *= juvFriction;

  if (abs (juvXspeed) < .05) juvXspeed = 0;
}


void drawJuv() {
  //  noStroke();
  rect (juvX, juvY, juvHeight, juvWidth);
  
  //gravity
  juvY = juvY + ySpeed;
  ySpeed = ySpeed + gravity;
  
  if (juvY > (height - juvHeight)){
    ySpeed = ySpeed * 0;
    
}
}

void checkScreenBounds() {
  if (juvX > width) {
    juvX = 0;
  }
  else if (juvX < 0) {
    juvX = width;
  }
  if (juvY >= (height - juvHeight)){
    juvY = (height - juvHeight);
}
}

//------------------------------------------------------------------------- SPRAY CONTROL
//------------------------------------------------------------------------- PLATFORM CONTROL

//------------------------------------------------------------------------- KEYBOARD CONTROL

void handleInput() {
  if (keyDown[RIGHT]) {
    juvXspeed += juvSpeed;
  }
  if (keyDown[LEFT]) {
    juvXspeed -= juvSpeed;

    //may have to change image direction
  }
  if (keyDown[UP]) {
    jumping();
  }    
    
  if (keyDown [32]) {
  }
}

void keyPressed() {
  if (keyCode < keyDownArraySize) {
    keyDown[keyCode] = true;
  }
}
void keyReleased() {
  if (keyCode < keyDownArraySize) {
    keyDown[keyCode] = false;
  }
}


//------------------------------------------------------------------------- JUMP
//initial
float jump_y = 1;              // jump
float jump_easing = 0.1;
float targetY_jump = 100;
boolean jump = false;



//voiddraw


//jump() {}


