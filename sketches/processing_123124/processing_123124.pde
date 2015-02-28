
/* @pjs preload="club.png,diamond.png,spade.png,heart.png,motorcycleUp.png,motorcycleDown.png,motorcycleRight.png,motorcycleLeft.png,motorcycleUpB.png,motorcycleDownB.png,motorcycleRightB.png,motorcycleLeftB.png,splash.png,bkgrd.png,joker.png,winner.png,loser.png";
font="Coda-Heavy.ttf"; */

Joker myJoker ;


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
PImage photo15;  // background screen
PImage photo16;  // joker
PImage photo17;  // winner screen
PImage photo18;  // loser screen

int myState = 0 ;
float jokerMaxSpeed = 2 ;
int maxCars = 10 ;
int suitsCollected = 0 ;

PFont font1 ; //Coda-Heavy

void setup() {

  size(800, 800) ;

  cyclePos = new PVector(width/2, height/2) ;  

  myJoker = new Joker() ;  // calling constructor

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
  photo15 = loadImage("bkgrd.png");
  photo16 = loadImage("joker.png");
  photo17 = loadImage("winner.png");
  photo18 = loadImage("loser.png");

  font1 = createFont("Coda-Heavy.ttf", 15);
  textFont(font1, 15);

  myCars = new ArrayList() ; 

  for (int i = 0 ; i < maxCars ; i++) {
    myCars.add(new Car()) ;
  }

  myBike = photo12 ;
}


void draw() {

  switch(myState) {

  case 0:
    image(photo14) ;
    break;

  case 1:

    image(photo15) ; 

    // drawing and moving cars
    for (int i = 0 ; i < myCars.size() ; i++) {   
      Car tempCar = (Car) myCars.get(i) ; 
      tempCar.display() ;
      tempCar.drive() ;

      float d = (tempCar.pos).dist(cyclePos) ;
      if (d < tempCar.wide) {
 //       println("boom!") ;
        tempCar.alive = false ;
      }
    }

    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i) ;

      if (tempCar.alive == false) {
        myCars.remove(i) ;
        suitsCollected++ ;
      }
    }

    // draw 

    image(myBike, cyclePos.x, cyclePos.y) ;

    myJoker.display() ;
    myJoker.drive() ;

    // check to see if joker is close to your bike
    float d = (myJoker.pos).dist(cyclePos) ;
    if (d < photo16.width) {
      //println ("JOKER") ;
      myState = 3 ;
    }


    if (myCars.size() <= 0 ) {
      myState = 2 ;
    }
    
    text("SUITS COLLECTED  " + suitsCollected, 20, 20) ;
    fill(255, 0, 0);
    rect(20, 25, suitsCollected*5, 20) ;
    break ;


  case 2:  // winning state
    //R   background(photo15) ;
    image(photo17) ; 
    text("SUITS COLLECTED  " + suitsCollected, 20, 40) ;

    break ;

  case 3:  // losing state
    //R    background(photo15) ; 
    image(photo18) ;
    suitsCollected = 0 ;
    text("SUITS COLLECTED  " + suitsCollected, 20, 40) ;
    break ;
  }
}  // draw


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

  if (myState == 0) {
    myState = 1 ;
  }

  if ((myState == 2) || (myState == 3)) {    // "||" means "OR"

    myCars.clear() ;
    maxCars += 5 ;
    for (int i = 0 ; i < maxCars ; i++) {
      myCars.add(new Car()) ;
    }

    cyclePos.set(width/2, height/2, 0);

    jokerMaxSpeed+=.5  ;
    myJoker.pos.set(0, 0, 0) ;
    myJoker.vel.set(random(-jokerMaxSpeed, jokerMaxSpeed), random(-jokerMaxSpeed, jokerMaxSpeed), 0) ;

    myState = 1 ;
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

class Joker {

  // attributes  
  //color myColor ;
  PVector vel ; 
  PVector pos ;
//  float wide ;
  boolean visible ;
  


  // PVector myPosition.z ;

  // Constructor
  Joker() {
    vel = new PVector(random(-jokerMaxSpeed, jokerMaxSpeed), random(-jokerMaxSpeed, jokerMaxSpeed)) ;
    pos = new PVector(random(width), random(height)) ; 
    //myColor = color(random(255), random(255), random(255)) ;
//    wide = random(30, 60) ;
    visible = true ;
  }

  // Methods
  void display() {
    // this is the part I will change later!!!!
    //fill(myColor) ; 
    //rect(pos.x, pos.y, wide, 25) ;


    image(photo16, pos.x, pos.y) ;
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



