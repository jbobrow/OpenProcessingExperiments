
/* @pjs preload="crawfordbackground.jpg, crawford.png, hockeyrink.jpg, endscreen.jpg";*/
ArrayList myCars ;
//float frogX ;
//float frogY ; 
PVector frogPos ;
PImage startscreen;
PImage hockey;
PImage corey;
PImage endscreen;
int deathCounter = 0 ; 
int myState = 0 ; 

void setup() {
  size(500, 500) ;
  rectMode(CENTER) ;
  startscreen = loadImage("crawfordbackground.jpg");
  hockey = loadImage("hockeyrink.jpg");
  corey = loadImage("crawford.png");
  endscreen = loadImage("endscreen.jpg");
 // frogX = width/2 ;
 // frogY = height-50 ; 
 frogPos = new PVector(mouseX, mouseY) ;

  myCars = new ArrayList() ;  // make a new arrayList

  for (int i = 0 ; i < 50; i++) {
    myCars.add(new Car()) ;   
  }
}


void draw() {
  
  switch(myState) {
    
    case 0: 
   background(100);
   image(startscreen, 0, 0);
    break ; 
    
    
  case 1:
// ***** STATE 1 - PLAYING THE GAME *****

  background(100) ; 
  image(hockey, 0, 0);

// moves my cars and tests the distance to the frog
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
 
 //   PVector frogLoc = new PVector(frogX, frogY) ; 
    float d = (car.loc).dist(frogPos) ;
    
    if (d < 50) {
 //     println("BOOM!!!" ) ; 
      car.alive = false ;  // mark this car for deletion 
      // myState = 2 ; 
    }
    
  }
  
  
  
   for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    
    // check if car is alive
    if (car.alive == false){
      myCars.remove(i) ;
      deathCounter++ ; 
    }
    
   } 
  
  // check to see how many cars we have
  if (myCars.size() == 0) {
    myState = 2 ;
  }
  
  // update Frog's position
  frogPos.x = mouseX ;
  frogPos.y = mouseY ;
  
  // draw my Frog
  fill(0, 150, 0) ;   
  
  image(corey, frogPos.x-150, frogPos.y-150);
  
  // draw the count of dead stuff
  fill(255, 0, 0) ; 
  textSize(60) ; 
  text(deathCounter, 50, 150) ;
  if (deathCounter >49){
    deathCounter = 0;
  }
  
// ***** END OF STATE 1 - PLAYING THE GAME *****  
  break ; 
  
  
  case 2:
  background(100) ; 
  image(endscreen,0,0);

  // deathCounter = 0 ;
  break ; 
  
  }
  
}  // END OF DRAW ROUTINE


void mousePressed() {
  if (myState == 0) {
    myState = 1 ; 
  }
  
  if (myState == 2) {
     // reset the amount of cars
   for (int i = 0 ; i < 50; i++) {
    myCars.add(new Car()) ;   
  }
    
    myState = 0 ;
  }
  
}


class Car {
  
  // attributes
  PVector loc ; 
  PVector vel ;
  color myColor ;
  boolean alive ;

  
  // constructor
  Car() {
    loc = new PVector(random(50,450), random(-1000, 50)) ;
    vel = new PVector(0, random(2,8)) ;
      
    myColor = color(100) ; 
    alive = true ; 
  }
  
  
  // methods
  void display() {
    fill(myColor) ; 
    ellipse(loc.x, loc.y, 25, 25) ; 
// text(v, x, y-10) ; 
  }
  
  void drive() {
    loc.add(vel) ;
    
    if (loc.y > height) {
      loc.y= -50 ;
    }
    
  }
  
  
}


