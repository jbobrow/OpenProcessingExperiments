
/* @pjs font="AnticSlab-Regular.ttf"; */



ArrayList myCars ;
PImage mario ;
PImage space ;
PImage stars ;
PFont myFont ;
int myState = 0 ;
PVector frogPos ;

void setup() {
  size(790, 600) ;
  noStroke() ;
  myFont = createFont("AnticSlab-Regular.ttf", 20);
  textFont(myFont) ;
  space = loadImage("space.png");
  mario = loadImage("Mario2.png");
  stars = loadImage("stars.png");
  frogPos = new PVector(width/2, height/2);
  myCars = new ArrayList();
  

  for (int i = 0 ; i < 20 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {
  switch(myState) {
  case 0:
    image(space, 0, 0) ;
    fill(#FFFFFF);
    textSize(20);
    text("Help Mario collect all of the coins", 263, 260) ;
    text("by navigating with the arrow keys", 251, 280) ;
    textSize(40);
    text("CLICK TO BEGIN", 270, 400) ;
    break;


  case 1:
    image(stars, 0, 0);
    for (int i = 0 ; i < myCars.size() ; i++) {   
      Car tempCar = (Car) myCars.get(i) ; 
      tempCar.display() ;
      tempCar.drive() ;   

      float d = (tempCar.pos).dist(frogPos) ;
      if (d < tempCar.wide) {
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
    image(mario, frogPos.x, frogPos.y, 100, 250) ;

    if (myCars.size () == 0) {
      myState = 2;
    }

    break;

  case 2:
    image(space, 0, 0);
    textSize(30) ;
    fill(#FFFFFF) ;
    text("CLICK to collect more coins.", 200, 200);
    break ;
  }
}


void mousePressed() {
  if (myState == 0) {
    myState = 1 ;
  }

  if (myState == 2) {
    for(int i = 0; i < 50; i++) {
      myCars.add(new Car()) ;
    }
    myState = 1;
  }
}

void keyPressed() { 
  switch(keyCode) {
  case 37: // left arrow
    frogPos.x = frogPos.x - 15 ;
    break ; 

  case 38: // up
    frogPos.y = frogPos.y - 15 ;
    break ;

  case 39: // right
    frogPos.x = frogPos.x + 15 ;
    break ;

  case 40: // down
    frogPos.y = frogPos.y + 15 ; 
    break ;
  }
}

class Car {

  // attributes  
  PImage coin ;
  //color myColor ;
  PVector vel ; 
  PVector pos ;
  float wide;
  boolean alive ;

  // PVector myPosition.z ;

  // Constructor
  Car() {

    vel = new PVector(random(-2, 2), random(-2, 2)) ;
    pos = new PVector(random(width), random(height)) ; 
    //myColor = color(random(255), random(255), random(255)) ;
    wide = (150);
    coin = loadImage("coin.png");
    alive = true ;
  }

  // Methods
  void display() {
    // this is the part I will change later!!!!
    fill(0) ;
    image(coin, pos.x, pos.y, wide, 320) ;
  }

  void drive() {
    pos.add(vel) ; 

    if (pos.x > width) {
      pos.x = 0;
    }

    if (pos.x <0 ) {
      pos.x = width;
    }

    if (pos.y > height) {
      pos.y = 0;
    }

    if (pos.y <0) {
      pos.y = height;
    }
  }
}



