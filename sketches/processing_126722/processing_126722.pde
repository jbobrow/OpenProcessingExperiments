
/* @pjs font="AverageSans-Regular.ttf"; */

int myState = 0 ;

ArrayList myCars ;

PVector frogPos ;

PImage myNet ;
PImage myNetLeft ;
PImage myNetUpsddwnR ;
PImage myNetUpsddwnL ;
PImage myNetOriginal ;
PImage myBackground ;

PFont myFont ;

void setup() {
  size(900, 600) ;

  myNet = loadImage("net.png") ;
  myNetLeft = loadImage("net2-01.png") ;
  myNetUpsddwnR = loadImage("net-upsidedown-right.png") ;
  myNetUpsddwnL = loadImage("net-upsidedown-left.png") ;
  myNetOriginal = myNet ;
  myBackground = loadImage("background-01.png");

  frogPos = new PVector(width/2, height/2) ;

  myCars = new ArrayList() ;

  myFont = createFont("AverageSans-Regular.ttf") ;

  for (int i = 0 ; i < 15 ; i++) {
    myCars.add(new Car()) ;
  }
}

void draw() {

  switch(myState) {

  case 0:
    image(myBackground, 0, 0) ;
    textFont(myFont, 30) ;
    fill(255) ;
    text("Use the arrow keys", 350, 250) ;
    text("to catch the butterflies!", 325, 285) ;
    textFont(myFont, 18) ;
    text("Click to play", 420, 330) ;
    break ;

  case 1:
    println("case 1") ;
    image(myBackground, 0, 0) ;


    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i) ;
      tempCar.display() ;
      tempCar.drive() ;

      float d = (tempCar.myPosition).dist(frogPos) ;
      if (d < 65 ) {
        // println("collide");
        tempCar.alive = false ;
      }
    }

    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i) ;

      if (tempCar.alive == false) {
        myCars.remove(i) ;
      }
    }

    // draw frog
    // fill(0, 150, 50) ;
    image(myNetOriginal, frogPos.x, frogPos.y) ;

    if (myCars.size() == 0) {
      myState = 2 ;
    }

    break ;

  case 2:
     
    
    image(myBackground, 0, 0) ;
    textFont(myFont, 30) ;
    fill(255) ;
    text("Click to play again!", 360, 270) ;
   

    break ;
  }
}

void mousePressed() {

  if (myState == 0) {
    myState = 1 ;
  }
  
  if (myState == 2) {
// make more cars
    for (int i = 0 ; i < 15 ; i++) {
    myCars.add(new Car()) ;
  }
      myState = 1 ;
  }
 
}

void keyPressed() {
  switch(keyCode) {
  case 37: //left
  myNetOriginal = myNetLeft ;
    frogPos.x = frogPos.x - 15 ;
    break;

  case 38: //up
    frogPos.y = frogPos.y - 15 ;
    if (myNetOriginal == myNetUpsddwnR) {
      myNetOriginal = myNet ; }
      if (myNetOriginal == myNetUpsddwnL) {
        myNetOriginal = myNetLeft ; }
    break;

  case 39: //right
  myNetOriginal = myNet ;
    frogPos.x = frogPos.x + 15 ;
    break ;

  case 40: //down
    frogPos.y = frogPos.y + 15 ;
    if (myNetOriginal == myNet) {
    myNetOriginal = myNetUpsddwnR ; }
    if (myNetOriginal == myNetLeft) {
      myNetOriginal = myNetUpsddwnL ; }
    break;
  }
}

class Car {

  //attributes
  color myColor ;

  PVector myPosition ;
  PVector myVelocity ;

  PImage myButterfly ;
  boolean alive ;


  //constructor
  Car() {
    myVelocity = new PVector(random(-2, 2), random(-2, 2)) ;
    myPosition = new PVector(random(width), random(height)) ;
    myColor = color(random(255), random(255), random(255)) ;
    myButterfly = loadImage("butterfly2.png") ;
    alive = true ;
  }

  //methods
  void display() {
    // this is the part you change to make the game 
    // fill(myColor) ;
    image(myButterfly, myPosition.x, myPosition.y) ;
  }

  void drive() {

    myPosition.add(myVelocity) ;

    if (myPosition.x > width) {
      myPosition.x = 0 ;
    }

    if (myPosition.x < 0) {
      myPosition.x = width ;
    }

    if (myPosition.y < 0) {
      myPosition.y = height ;
    }

    if (myPosition.y > height) {
      myPosition.y = 0 ;
    }
  }
}






