
//----------------------declare variables----------------------
//declare the buttons
int AbutX = 125;
int AbutY = 525;
int AbutW = 150;
int AbutH = 40;

int BbutX = 325;
int BbutY = 525;
int BbutW = 150;
int BbutH = 40;

//declare the object (leaves)
fall myFall;
fall myFall2;
fall myFall3;
fall myFall4;
fall myFall5;
fall myFall6;
fall myFall7;
fall myFall8;
fall myFall9;
fall myFall10;
fall myFall11;
fall myFall12;

//declare the object (flowers)
spring mySpring;
spring mySpring2;
spring mySpring3;
spring mySpring4;
spring mySpring5;
spring mySpring6;
spring mySpring7;
spring mySpring8;
spring mySpring9;
spring mySpring10;
spring mySpring11;
spring mySpring12;

//----------------------run program----------------------
void setup () {
  size(600,600);
  background(255); 
  myFall = new fall();
  myFall2 = new fall();
  myFall3 = new fall();
  myFall4 = new fall();
  myFall5 = new fall();
  myFall6 = new fall();
  myFall7 = new fall();
  myFall8 = new fall();
  myFall9 = new fall();
  myFall10 = new fall();
  myFall11 = new fall();
  myFall12 = new fall();
  
  mySpring = new spring();
  mySpring2 = new spring();
  mySpring3 = new spring();
  mySpring4 = new spring();
  mySpring5 = new spring();
  mySpring6 = new spring();
  mySpring7 = new spring();
  mySpring8 = new spring();
  mySpring9 = new spring();
  mySpring10 = new spring();
  mySpring11 = new spring();
  mySpring12 = new spring();
}

void draw () {
  background(255); 
  //button A (fall)
  noStroke();
  fill(229,199,23);  
  rect(AbutX,AbutY,AbutW,AbutH);
  fill(255);
  textSize(14);
  text("fall into fall", 160, 550); 
  //button B (spring)
  noStroke(); 
  fill(229,199,23);  
  rect(BbutX,BbutY,BbutW,BbutH);
  fill(255);
  textSize(14);
  text("spring into spring", 340, 550); 
  //
  if (mouseX > AbutX && mouseX < AbutX + AbutW && mouseY > AbutY && mouseY < AbutY + AbutW) {
    mousePressed = true;
    if (mousePressed == true) {
      fallingLeaves();
    }
  else {
    fill(255);
  }
  
  }
  if (mouseX > BbutX && mouseX < BbutX + BbutW && mouseY > BbutY && mouseY < BbutY + BbutW) {
    mousePressed = true;
    if (mousePressed == true) {
      fallingFlowers();
    }
  }
  else {
    fill(255);
  }
}
  


//----------------------custom functions----------------------
void fallingLeaves() {
  myFall.display();
  myFall2.display();
  myFall3.display();
  myFall4.display();
  myFall5.display();
  myFall6.display();
  myFall7.display();
  myFall8.display();
  myFall9.display();
  myFall10.display();
  myFall11.display();
  myFall12.display();
  myFall.move();
  myFall2.move();
  myFall3.move();
  myFall4.move();
  myFall5.move();
  myFall6.move();
  myFall7.move();
  myFall8.move();
  myFall9.move();
  myFall10.move();
  myFall11.move();
  myFall12.move();
}

void fallingFlowers() {  
  mySpring.display();
  mySpring2.display();
  mySpring3.display();
  mySpring4.display();
  mySpring5.display();
  mySpring6.display();
  mySpring7.display();
  mySpring8.display();
  mySpring9.display();
  mySpring10.display();
  mySpring11.display();
  mySpring12.display();
  mySpring.move();
  mySpring2.move();
  mySpring3.move();
  mySpring4.move();
  mySpring5.move();
  mySpring6.move();
  mySpring7.move();
  mySpring8.move();
  mySpring9.move();
  mySpring10.move();
  mySpring11.move();
  mySpring12.move();
}
class fall {
  float x;
  float y;
  float xSpeed = 0;
  float ySpeed;
  PImage object;
  
  //constructor
  fall () {
    x = random(width);
    y = random(height);
    ySpeed = random(1,3);
    
    object = loadImage ("leaf.png");
  }

  
  void display() {
    image(object,x,y,40,40);
  }
  
  void move() {
    y += ySpeed;
    //make sure dot returns to top of screen
    if (y>height) {
      y=0;
    }
}
}

class spring {
  float x;
  float y;
  float xSpeed = 0;
  float ySpeed;
  PImage object;
  
  //constructor
  spring () {
    x = random(width);
    y = random(height);
    ySpeed = random(1,3);
    
    object = loadImage ("flower.png");
  }

  
  void display() {
    image(object,x,y,40,40);
  }
  
  void move() {
    y += ySpeed;
    //make sure dot returns to top of screen
    if (y>height) {
      y=0;
    }
}
}



