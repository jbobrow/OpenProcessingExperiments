
float xPos;
float yPos;
float chaseX;
float chaseXV;
float chaseY;
float chaseYV;
PImage squid;
PImage tent1;
PImage tent2;
PImage tent3;
PImage tent4;
PImage space;


void setup() {
  size(900, 900);
  chaseX = (random(20,width-20));
  chaseXV = (random(.05,1));
  chaseY = (random(20,height-20));
  chaseYV = (random(.05,1));
  noCursor();
  space = loadImage("andromeda.jpg");
  squid = loadImage("body.png");
  tent1 = loadImage("snake start.png");
  tent2 = loadImage("snake 2.png");
  tent3 = loadImage("snake 3.png");
  tent4 = loadImage("snake end.png");
  
}

void draw() {
  imageMode(CENTER);
  image(space,width/2,height/2,width,height);
  drawSquid();
}



void drawSquid(){
  pushMatrix();
  //======== Determine Squid Location and Rotation
  xPos=.997*xPos+.003*chaseX;
  yPos=.997*yPos+.003*chaseY;
  direction();
  float a = atan2(chaseY - yPos, chaseX - xPos);
  translate(xPos, yPos);
  rotate(a);
  imageMode(CENTER);
  rightTent2();
  rightTent3();
  image(squid, 0, 0, 100, 100);
  rightTent1();
  leftTent1();
  leftTent2();
  leftTent3();
  popMatrix();
}



// =====   Where the Squid goes? ====
void direction(){
chaseX=chaseX+chaseXV;
  chaseY=chaseY+chaseYV;
  if ((chaseX>=width-10)||(chaseX<=10)) {
    chaseXV = -1*chaseXV;
  }
  if ((chaseY>=height-10)||(chaseY<=10)) {
    chaseYV = -1*chaseYV;
  }
}

  // =======   Right Tentacle 1 =======
  void rightTent1(){
  pushMatrix();
  // Part1 
  imageMode(CORNER);
  translate(-30, 15);
  rotate(.75*sin((radians(.08*millis()))));
  image(tent1, 0, 0, 20, 20);
  // Part2
  imageMode(CENTER);
  translate(15, 23);
  rotate(.35);
  rotate(-.6*sin((radians(.08*millis()))));
  image(tent2, 0, 0, 20, 20);
  // Part3
  translate(-15, 15);
  rotate(-.25);
  rotate(-.3*sin((radians(.08*millis()))));
  image(tent3, 0, 0, 20, 20);
  // Part4
  translate(-10, 20);
  rotate(.1);
  rotate(.2*sin((radians(.5*millis()))));
  image(tent4, 0, 0, 10, 30);
  popMatrix();
  }
  
  
  // =======  Right Tentacle 2 =======
  void rightTent2(){
  pushMatrix();
  // Part1 
  imageMode(CORNER);
  translate(-35, 20);
  rotate(-.3);
  rotate(-.75*sin((radians(.08*millis()))));
  image(tent1, 0, 0, 20, 20);
  // Part2
  imageMode(CENTER);
  translate(15, 23);
  rotate(.35);
  rotate(.6*sin((radians(.08*millis()))));
  image(tent2, 0, 0, 20, 20);
  // Part3
  translate(-15, 15);
  rotate(-.25);
  rotate(.3*sin((radians(.08*millis()))));
  image(tent3, 0, 0, 20, 20);
  // Part4
  translate(-10, 20);
  rotate(.1);
  rotate(-.2*sin((radians(.5*millis()))));
  image(tent4, 0, 0, 10, 30);
  popMatrix();
  }
  
  
  
  // =======  Right Tentacle 3 =======
  void rightTent3(){
  pushMatrix();
  // Part1 
  imageMode(CORNER);
  translate(-40, 20);
  rotate(.75*sin((radians(.06*millis()))));
  image(tent1, 0, 0, 20, 20);
  // Part2
  imageMode(CENTER);
  translate(15, 23);
  rotate(.35);
  rotate(-.6*sin((radians(.06*millis()))));
  image(tent2, 0, 0, 20, 20);
  // Part3
  translate(-15, 15);
  rotate(-.35);
  image(tent3, 0, 0, 20, 20);
  // Part4
  translate(-10, 20);
  rotate(.15);
  image(tent4, 0, 0, 10, 30);
  popMatrix();
  }
  
  
  
// =======  Left Tentacle 1 =======
void leftTent1(){
  pushMatrix();
  // Part1 
  imageMode(CORNER);
  translate(-35, 15);
  rotate(2);
  rotate(-.75*sin((radians(.08*millis()))));
  image(tent1, 0, 0, 20, 20);
  // Part2
  imageMode(CENTER);
  translate(15, 23);
  rotate(.35);
  rotate(.6*sin((radians(.08*millis()))));
  image(tent2, 0, 0, 20, 20);
  // Part3
  translate(-15, 15);
  rotate(-.25);
  rotate(.3*sin((radians(.08*millis()))));
  image(tent3, 0, 0, 20, 20);
  // Part4
  translate(-10, 20);
  rotate(.1);
  rotate(-.2*sin((radians(.5*millis()))));
  image(tent4, 0, 0, 10, 30);
  popMatrix();
}



  
  // =======  Left Tentacle 2 =======
  void leftTent2(){
  pushMatrix();
  // Part1 
  imageMode(CORNER);
  translate(-35, 15);
  rotate(3);
  rotate(.75*sin((radians(.08*millis()))));
  image(tent1, 0, 0, 20, 20);
  // Part2
  imageMode(CENTER);
  translate(25,13);
  rotate(.35);
  rotate(-.6*sin((radians(.08*millis()))));
  image(tent2, 0, 0, 20, 20);
  // Part3
  translate(12, -13);
  rotate(.5);
  image(tent3, 0, 0, 20, 20);
  // Part4
  translate(15, 0);
  rotate(-1);
  image(tent4, 0, 0, 10, 30);
  popMatrix();
  }
  
  
  
   // =======  Left Tentacle 3 =======
  void leftTent3(){
  pushMatrix();
  // Part1 
  imageMode(CORNER);
  translate(-35, 15);
  rotate(3);
  rotate(.75*sin((radians(.05*millis()))));
  image(tent1, 0, 0, 20, 20);
  // Part2
  imageMode(CENTER);
  translate(25,13);
  rotate(.35);
  rotate(-.6*sin((radians(.05*millis()))));
  image(tent2, 0, 0, 20, 20);
  // Part3
  translate(-5, -10);
  rotate(-1.7);
  rotate(-.4*sin((radians(.05*millis()))));
  image(tent3, 0, 0, 20, 20);
  // Part4
  translate(15, 0);
  rotate(-1);
  image(tent4, 0, 0, 10, 30);
  popMatrix();
  }
 

