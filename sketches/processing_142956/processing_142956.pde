

ArrayList myCars ;
float frogX ;
float frogY ; 

void setup() {
  size(500, 500) ;
  rectMode(CENTER) ;
  
  frogX = width/2 ;
  frogY = height-50 ; 

  myCars = new ArrayList() ;  // make a new arrayList

  for (int i = 0 ; i < 850; i++) {
    myCars.add(new Car()) ;
   
  }
}


void draw() {
  
  
  background(0, 0, 0) ; 

textSize(100); 
text("X", 400, 70) ; 



// moves my cars
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
 
    PVector frogLoc = new PVector(frogX, frogY) ; 
    float d = (car.loc).dist(frogLoc) ;
    
    if (d < 50) {
      println("BOOM!!!" ) ; 
      car.alive = false ;
    }
    
  }
  
  
  
   for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    
    // check if car is alive
    if (car.alive == false){
      myCars.remove(i) ;
    }
    
   } 
  
  // check to see how many cars we have
  
  
  // draw my Frog
  fill(250, 250, 250) ; 
  rect(frogX, frogY, 40, 50) ; 
  
}

void keyPressed() {
//  println("key pressed = " + keyCode) ;
 
 if (keyCode == 39) {  // right
  frogX = frogX + 20 ;
 }

 if (keyCode == 37) {  // left
   frogX = frogX - 20 ;
 }
 
  if (keyCode == 38) {
  frogY = frogY - 20 ;
 }

 if (keyCode == 40) {  // down
   frogY = frogY + 20 ;
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
    loc = new PVector(random(width), random(height)) ;
    vel = new PVector(random(1,5), 0) ;
      
    myColor = color(random(255), random(255), random(255)) ; 
    alive = true ; 
  }
  
  
  // methods
  void display() {
    fill(myColor) ; 
    ellipse(loc.x, loc.y, 50, 25) ; 
// text(v, x, y-10) ; 
  }
  
  void drive() {
    loc.add(vel) ;
    
    if (loc.x > width) {
      loc.x = 0 ;
    }
  }
  
  
}


