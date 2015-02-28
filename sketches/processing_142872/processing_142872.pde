
/* @pjs preload="Mainscreen.png, dalek.png, Doctor.png, ohno.png, yay.png, Tardis.png";*/


Tardis myTardis ;
ArrayList myCars ;
PVector frogPos;
int myState = 0 ;
PImage mainscreen ;
PImage dalek ;
PImage doctor ;
PImage ohno ;
PImage yay ;
PImage tardis ;

void setup() {

  size(700, 700) ;
  myTardis = new Tardis() ; 
  
  mainscreen = loadImage("Mainscreen.png") ;
  dalek = loadImage("dalek.png") ;
  doctor = loadImage("Doctor.png") ;
  ohno = loadImage("ohno.png") ;
  yay = loadImage("yay.png") ;
  tardis = loadImage("Tardis.png") ;
  rectMode(CENTER) ;
frogPos = new PVector(width/2, height-50) ; 

  myCars = new ArrayList() ;  // make a new arrayList

  for (int i = 0 ; i < 15; i++) {
    myCars.add(new Car()) ;
   
  } 
  
}


void draw() {
  switch(myState) {
  
    case 0:
    background(100) ;
    image(mainscreen, 0, 0);
    textSize(60) ;
    text("Dalek Rush", 20, 500) ;
    textSize(24) ;
    text("Run from the Daleks using", 20, 540) ;
    text("the arrow keys and find", 20, 565);
    text("your TARDIS to escape.", 20, 590) ;
    text("Click to proceed to the", 20, 630) ;
    text("rush of the Daleks.", 20, 655) ;
    break ;
    
    case 1:
    // *** State 1 -Playing the game
    
  background(100) ; 

// moves my cars and tests the distance to the frog
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
 
   // PVector frogLoc = new PVector(frogX, frogY) ; 
    float d = (car.loc).dist(frogPos) ;
    
    if (d < 30) {
       

      car.alive = false ; // mark this car for deletion
      myState = 2 ; // if hit moves to final screen
    }
    
  }
  
  
  
   for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    
    // check if car is alive
    if (car.alive == false){
      myCars.remove(i) ;
      
    }
    
   } 
  myTardis.display() ;
  myTardis.drive() ;
  float d = (myTardis.pos).dist(frogPos) ;
  if (d < tardis.width) {
    myState = 3 ;
  // check to see how many cars we have
  //if (myCars.size() == 0) {
  //   myState = 3 ; // winning state
  }
  
  
  //draw my Frog makes it controlled by keys unless mouseX and mouseY is there 
  image(doctor, frogPos.x, frogPos.y, 30, 50);
  
 
  
  break;
  
  case 2: 
  background(100) ;
  fill(255) ;
  image(ohno, 0, 0);
  textSize(30);
  text("Keep Running! Click the mouse to try again...", 20, 40) ;

  break;
  
  case 3:
  background(100) ;
  image(yay, 0, 0);
  textSize(36);
  text("Yay! You escaped from", 20, 40) ;
  text(" the Daleks!", 20, 90) ;
  text("Click to play again!", 20, 140) ;
  
  break;
  }
}

void mousePressed() {
  if (myState == 0) {
    myState = 1 ;
  }
  
  if (myState == 2) {
      for (int i = 0 ; i < 1; i++) {
    myCars.add(new Car()) ;
  }
    myState = 0 ;
    frogPos.set(width/2, height-50, 0);
  }
    if (myState == 3) {
      for (int i = 0 ; i < 3; i++) {
    myCars.add(new Car()) ;
  }
    myState = 0 ;
    frogPos.set(width/2, height-50, 0);
  }
}

void keyPressed() {
  
 
 if (keyCode == 39) {  // right
  frogPos.x = frogPos.x + 20 ;
 }

 if (keyCode == 37) {  // left
   frogPos.x = frogPos.x - 20 ;
 }
 
  if (keyCode == 38) {
  frogPos.y = frogPos.y - 20 ;
 }

 if (keyCode == 40) {  // down
   frogPos.y = frogPos.y + 20 ;
 }
 
}

class Car {
  
  // attributes
  PVector loc ; 
  PVector vel ;
  boolean alive ;

  
  // constructor
  Car() {
    loc = new PVector(random(width), random(40, 600)) ;
    vel = new PVector(random(1,5), 0) ;
       
    alive = true ; 
  }
  
  
  // methods
  void display() {
    image(dalek, loc.x, loc.y, 20, 35);
    
    
// text(v, x, y-10) ; 
  }
  
  void drive() {
    loc.add(vel) ;
    
    if (loc.x > width) {
      loc.x = 0 ;
    }
  }
  
  
}
class Tardis {
  
  PVector vel ;
  PVector pos ;
  boolean visible ;
  
  Tardis () {
    vel = new PVector(random(1,5), 0) ;
    pos = new PVector(random(width), 10) ;
    visible = true ;
  }
  
  void display () {
    image (tardis, pos.x, pos.y, 40, 65) ;
  }
  
  void drive() {
    pos.add(vel) ;
    
    if (pos.x > width) {
      pos.x = 0 ;
    }
  }
}


