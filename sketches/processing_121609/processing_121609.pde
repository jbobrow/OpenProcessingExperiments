
/* @pjs preload="club.png,diamond.png,spade.png,heart.png,motorcycleUp.png,motorcycleDown.png,motorcycleRight.png,motorcycleLeft.png,motorcycleUpB.png,motorcycleDownB.png,motorcycleRightB.png,motorcycleLeftB.png,splash.png; */


ArrayList myCars ;

PVector cyclePos ;

PImage photo1;  // club
PImage photo2;  // diamond
PImage photo3;  // spade
PImage photo4; // heart

PImage photo6;  //motorcycle Up
PImage photo7;  //motorcycle Down
PImage photo8;  //motorcycle Right
PImage photo9;  //motorcycle Left
PImage photo10;  //motorcycle Up
PImage photo11;  //motorcycle Down
PImage photo12;  //motorcycle Right
PImage photo13;  //motorcycle Left
PImage myBike;
PImage photo14;  // splash screen

int myState = 0 ;

void setup() {

  size(800, 800) ;

  cyclePos = new PVector(width/2, height/2) ;  

  photo1 = loadImage("club.png");
  photo2 = loadImage("diamond.png");
  photo3 = loadImage("spade.png");
  photo4 = loadImage("heart.png");

  photo6 = loadImage("motorcycleUp.png");
  photo7 = loadImage("motorcycleDown.png");
  photo8 = loadImage("motorcycleRight.png");
  photo9 = loadImage("motorcycleLeft.png");
  photo10 = loadImage("motorcycleUpB.png");
  photo11 = loadImage("motorcycleDownB.png");
  photo12 = loadImage("motorcycleRightB.png");
  photo13 = loadImage("motorcycleLeftB.png");
  photo14 = loadImage("splash.png");

  myCars = new ArrayList() ; 

  for (int i = 0 ; i < 50 ; i++) {
    myCars.add(new Car()) ;
  }

  myBike = photo12 ;
}


void draw() {

  switch(myState) {

  case 0:
    background(photo14) ;
    break;

  case 1:

    background(100) ; 

    // drawing and moving cars
    for (int i = 0 ; i < myCars.size() ; i++) {   
      Car tempCar = (Car) myCars.get(i) ; 
      tempCar.display() ;
      tempCar.drive() ;

      float d = (tempCar.pos).dist(cyclePos) ;
      if (d < tempCar.wide) {
        //println("boom!") ;
        tempCar.alive = false ;
      }
    }

    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i) ;

      if (tempCar.alive == false) {
        myCars.remove(i) ;
      }
    }

    // draw 

    image(myBike, cyclePos.x, cyclePos.y) ;

    break ;

  case 2:
    text("Click to reset game!", 20, 20) ;
    break ;
  }
}


void keyPressed() {
  //  println(keyCode) ; 

  switch(keyCode) {
  case 37: // left arrow
    cyclePos.x = cyclePos.x - 15 ;

    if (cyclePos.x < 0) {  //up
      cyclePos.x = 750 ;
    }

    myBike = photo9 ;

    break ; 

  case 38: // up
    cyclePos.y = cyclePos.y - 15 ; 

    if (cyclePos.y < 0) {  //up
      cyclePos.y = 750 ;
    }
    myBike = photo6 ;

    break ;

  case 39: // right
    cyclePos.x = cyclePos.x + 15 ;

    if (cyclePos.x > width) {  //up
      cyclePos.x = 0 ;
    }
    myBike = photo8 ; 

    break ;

  case 40: // down
    cyclePos.y = cyclePos.y + 15 ; 

    if (cyclePos.y > height) {  //down
      cyclePos.y = 0 ;
    }
    myBike = photo7 ; 

    break ;
  }
}

void keyReleased() {
  //  println(keyCode) ; 

  switch(keyCode) {
  case 37: // left arrow
    cyclePos.x = cyclePos.x - 15 ;

    if (cyclePos.x < 0) {  //up
      cyclePos.x = 750 ;
    }
    myBike = photo13 ;

    break ; 

  case 38: // up
    cyclePos.y = cyclePos.y - 15 ; 

    if (cyclePos.y < 0) {  //up
      cyclePos.y = 750 ;
    }
    myBike = photo10 ;

    break ;

  case 39: // right
    cyclePos.x = cyclePos.x + 15 ;

    if (cyclePos.x > width) {  //up
      cyclePos.x = 0 ;
    }
    myBike = photo12 ; 

    break ;

  case 40: // down
    cyclePos.y = cyclePos.y + 15 ; 

    if (cyclePos.y > height) {  //down
      cyclePos.y = 0 ;
    }
    myBike = photo11 ; 

    break ;
  }
}


void mousePressed() {
  
  myState = myState + 1 ;
  
  if (myState == 0) {
    myState = 1 ;
  }

  if (myState == 2) {

    for (int i = 0 ; i < myCars.size() ; i++) {   
      Car tempCar = (Car) myCars.get(i) ; 
      tempCar.display() ;
      tempCar.drive() ;
      myState = 0 ;
    }
    
    myState = 0 ;
    
  }
}

class Car {

  // attributes  
  //color myColor ;
  PVector vel ; 
  PVector pos ;
  float wide ;
  boolean alive ;

  PImage mySuit;  


  // PVector myPosition.z ;

  // Constructor
  Car() {
    vel = new PVector(random(-2, 2), random(-2, 2)) ;
    pos = new PVector(random(width), random(height)) ; 
    //myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 60) ;
    alive = true ;

    // decide what suit
    int myRandom = int(random(4)) ;
    switch(myRandom) {
    case 0: 
      mySuit = photo1 ;
      break ;

    case 1: 
      mySuit = photo2 ;
      break ;

    case 2:
      mySuit = photo3 ; 
      break ;

    case 3: 
      mySuit = photo4 ;
      break ;
    }
  }

  // Methods
  void display() {
    // this is the part I will change later!!!!
    //fill(myColor) ; 
    //rect(pos.x, pos.y, wide, 25) ;


    image(mySuit, pos.x, pos.y) ;
  }

  void drive() {
    pos.add(vel) ; 

    if (pos.x > width) {
      pos.x = 0 ;
    }

    if (pos.x < 0 ) {
      pos.x = width ;
    }

    if (pos.y > height) {
      pos.y = 0 ;
    }

    if (pos.y < 0 ) {
      pos.y = height ;
    }
  }
}



