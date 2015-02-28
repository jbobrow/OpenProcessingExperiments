


//Car[] myCars = new Car[10] ; 
ArrayList myCars ;
PVector frogPos ;
int myState ;
PImage frog ;
String[] myWords = {
  "You're stupid!!", "my old lady", "You retard", "Get a real job!", "All RACISM", 
  "No one will want you", "You were a mistake", "...dumb bigot", "EVIL", "immorality", "Teabagger"
} 
;

void setup() {

  size(1000, 800) ;
  frog = loadImage ("car.png") ;
  frogPos = new PVector(width/2, height/2) ;  
  textAlign(CENTER) ; 
  myCars = new ArrayList() ; 

  for (int i = 0 ; i < 50 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {
  background(#2FA1C9) ; 


  //* drawing and moving cars *//
  for (int i = 0 ; i < myCars.size() ; i++) {   
    Car tempCar = (Car) myCars.get(i) ; 
    tempCar.display() ;
    tempCar.drive() ; 

    // check distance between my car and the frog
    float d = (tempCar.pos).dist(frogPos) ; 
    if (d < tempCar.wide) {
      //      println("boom!") ;
      tempCar.alive = false ;
    }
  }

  // go through list again and delete ones that are dead
  for (int i = 0 ; i < myCars.size() ; i++) {   
    Car tempCar = (Car) myCars.get(i) ; 

    if (tempCar.alive == false) {
      myCars.remove(i) ;
    }
  } 


  // put a background image here
  // image(myBackground, 0, 500) ;
  fill(20, 120, 50) ;
  rect(0, 460, width, 800) ;
  
  // draw Car
  //fill(0, 200, 0) ;
  //ellipse(frogPos.x, frogPos.y, 40, 40) ;
  image (frog, frogPos.x, frogPos.y) ;
}


void keyPressed() {
  //  println(keyCode) ; 
  switch(keyCode) {

  case 37: // left arrow
    frogPos.x = frogPos.x - 15 ;  
    if (frogPos.x < -frog.width) { 
      frogPos.x = width ;
    } 
    ;
    break ; 

  case 38: // up
    frogPos.y = frogPos.y - 15 ;
    break ;

  case 39: // right
    frogPos.x = frogPos.x + 15 ;
    if (frogPos.x > width) { 
      frogPos.x = 0 ;
    } 
    ;
    break ;

  case 40: // down
    frogPos.y = frogPos.y + 15 ; 
    break ;
  }
}

void mousePressed() {
  if (myState == 0) {
    myState = 1 ;
  }
  if (myState == 2) {

    //make more cars here//
    for (int i = 0 ; i < 10 ; i++) {
      myCars.add(new Car()) ;
    }

    myState = 0;
  }
}

class Car {
  
  // attributes - every attribute gets filled in Constuctor //
color myColor ;
PVector vel ; 
PVector pos ;
float wide ;
float tall ;
boolean alive ;
String mySpeech ;


// PVector myPosition.z ;
  
  // Constructor //
  Car() {
    vel = new PVector(random(-2, 2), random(-2, -1)) ;
    pos = new PVector(random(width), random(2)*height) ; //random(height)) ; 
    myColor = color(random(255), random(255), random(255)) ;
    wide = random (130, 150) ;
    tall = random (50, 90) ;
    alive = true ;
    mySpeech = myWords[int(random(myWords.length))] ;
  }
  
  // Methods //
  void display() {
    // this is the part I will change later!!!!
    fill(myColor) ; 
    ellipse (pos.x, pos.y, wide, 50) ;
    fill(255) ; 
    text(mySpeech, pos.x, pos.y) ;
  }
  
  void drive() {
    pos.add(vel) ; 
    
    if (pos.x > width+wide) {
      pos.x = -wide ;
    }
    if (pos.x < -wide) {
      pos.x = width+wide ;
    }
  
    if (pos.y > height) {
      pos.y = 0 ;
    }
  
    if (pos.y < 0) {
      pos.y = height ;
    }
  }
}



