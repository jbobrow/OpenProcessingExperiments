

// int x ;
//Car myCar1 ; 
PImage jellyfish ;
PImage jar ;
ArrayList<Car> myCars ; 
PVector jarLocation ; 
int score = 0;
int myState = 0 ;
int myCounter = 10 * 60 ; //

void setup() {
  size(500, 500) ; 
  //  myCar1 = new Car() ;

  myCars = new ArrayList() ;

  for (int i = 0; i < 20; i++) {
    myCars.add(new Car()) ;
  }

  jarLocation = new PVector(width/2, height-50) ;
}

void draw() {
  
   switch(myState) {
    case 0:
    background(255, 90, 65) ;
    text("Catch the jellyfish in the jar to make jelly!", width/2, height/2) ;
    break ; 
   
    case 1:
    // playing the game
    myCounter-- ; 
    println(myCounter) ; 
    if (myCounter < 0) {
      myState = 2 ;
      }
    background(255, 255, 255) ;
    text(" game is playing", width/2, height/2) ; 
    game() ;
    break ;
  
      case 2:
text("GAME OVER -- Click to play again!", width/2, height/2) ; 
     background(100) ;
    text(" game over", width/2, height/2) ; 
    break ;   
 
    
  }  
  
}


void mousePressed() {
  myState = (myState + 1) % 4 ;  
}

void keyPressed() {
  println(keyCode) ; 
  
  if (keyCode == 39) {
    jarLocation.x += 30 ;
  }
  
    if (keyCode == 37) {
    jarLocation.x -= 30 ;
  }
  
    if (keyCode == 38) {
    jarLocation.y -= 30 ;
  }
  
    if (keyCode == 40) {
    jarLocation.y += 30 ;
  }
 
}


class Car {

  // attributes
  PVector location ;
  PVector velocity ; 
  PVector size ; 
  color myColor ; 
  float wide ; 
  boolean alive ;
  

  // constructor(s) 
  Car() {
    size = new PVector (random(200, 250), random(200,250)) ;
    location = new PVector(random(width), random(height)) ; 
    velocity = new PVector(random(-3, 3), random(-3, 3)) ;
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 50) ;
    alive = true ;
    jellyfish = loadImage("jellyfish.png") ;
  }

  // methods
  void display() {  // how it looks
   image (jellyfish, location.x, location. y, 55, 55) ;
  }

  void drive() {
location.add(velocity);
if (location.y > height) {
  location.y = 0 ;
    }
  }
}

void game() {
   background(#FAF5B1) ;

// iterate thru car array
  for (Car myCar : myCars) {

    myCar.display() ;
    myCar.drive() ;
    
    // test distance of car to frog
    float d = (myCar.location).dist(jarLocation) ;
    
    if (d < myCar.wide) {
      println(" Nice! ") ; 
      score++ ;
      myCar.alive = false ;
    }
  }
  
  // iterate thru car array and delete dead cars
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car thisCar = (Car) myCars.get(i) ; 
    if (thisCar.alive == false) {
      myCars.remove(i) ; 
    }
       
  }

  // make my frog
  jar = loadImage("jar.png") ; 
  image (jar, jarLocation.x, jarLocation.y, 55, 55) ;

//  image(myImage, frogLocation.x, frogLocation.y) ;
  
  fill(255) ; 
  text(score, 10, 30) ;
  
}


