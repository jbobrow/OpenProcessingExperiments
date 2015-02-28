
/*
Code thanks in part by Ramsey nassar
 */

//JUVENILE VARS
float juvX, juvY, juvSpeed, maxSpeed, ySpeed, gravity;
float juvXspeed, juvYspeed, juvFriction, juvYacceleration, juvAcceleration;
int juvHeight = 20;
int juvWidth = 20;


//KEY PRESSES
final int keyDownArraySize = 127;
boolean[] keyDown = new boolean[keyDownArraySize];

//PLATFORMS
Platforms p1 = new Platforms(830, 450);
Platforms p2 = new Platforms(800, 410);
Platforms p3 = new Platforms(720, 450);
Boolean onGround = true;
Boolean isJumping = false;

//Spray
ArrayList pspray = new ArrayList();
Boolean isSpray = false;


void setup() {
  size (900, 500);
  smooth();
  //  v1 = new PVector (juvX, juvY);
  //  v2 = new PVector (juvX, juvY);

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
  juvSpeed = 3;
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
  p1.update();
  p2.update();
  p3.update();
  //  checkPlatformBounds();
  updateJuv();
  //  updateCops();

  //  if (isSpray) {
  //    updateSpray();
  //  }

  handleInput();
}





//------------------------------------------------------------------------- JUVIE

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
  
  //gravity
  if (!onGround) {
    juvY = juvY + ySpeed;
    ySpeed = ySpeed + gravity;
    if (isJumping) {
      juvY -= 10;  
    } 
  } 
  else {
    ySpeed = 0;
  }

  if ((juvY+juvHeight) >= height) {
    onGround = true;
  }
}


void drawJuv() {
  //  noStroke();

  if (isSpray) {
    sprayOn();
  }
  rect (juvX, juvY, juvHeight, juvWidth);

  //  if (juvY > (height - juvHeight)) {
  //    ySpeed = ySpeed * 0;
  //  }
}
//------------------------------------------------------------------------- BOUNDARIES

void checkScreenBounds() {
  if (juvX > width) {
    juvX = 0;
  }
  else if (juvX < 0) {
    juvX = width;
  }
  if (juvY >= (height - juvHeight)) {
    juvY = (height - juvHeight);
  }
}

//------------------------------------------------------------------------- SPRAY CONTROL

void sprayOn() {
  beginShape();

  for (int i = 0; i<pspray.size()-1; i++) {
    PVector p = (PVector) pspray.get(i);
    ellipse(p.x, p.y, 10, 10);
  }
  endShape();
}


//------------------------------------------------------------------------- PLATFORM CONTROL

class Platforms {
  float xPlatforms, yPlatforms;
  Platforms (float x, float y) {
    xPlatforms = x;
    yPlatforms = y;
  }

  void update() {
    rect(xPlatforms, yPlatforms, 70, 20);
    checkPlatformBounds();
  }



  void checkPlatformBounds() {
    if (((juvX+juvWidth) > xPlatforms) && (juvX < (xPlatforms + 70)) && ((juvY+ juvHeight) <= yPlatforms) && ((juvY + juvHeight) < (yPlatforms + 20))) {
      juvY = yPlatforms - juvHeight;
      onGround = true;
      println("here");
      //tell player hes on ground
    } 
    //    else
    //  else{
    //    juvY = juvY;
    //  }
    //      if ((juvY <= (yPlatforms + 20)) && ((juvX+juvWidth) > xPlatforms) && (juvX < (xPlatforms + 70))) {
    //        juvY = yPlatforms + 20;
    //      }
  }
}
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
    if (onGround) {
      jumping();
      onGround = false;
    }
    isJumping = true;
  } 


  if (keyDown [32]) {
    //    spray
    isSpray = true;
    PVector p = new PVector (juvX, juvY);
    pspray.add(p);
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


void jumping() {
  juvY -= 10;
}


