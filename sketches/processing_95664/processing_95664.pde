

ArrayList myzombs ;
PImage background ;
PImage human ;
PImage zombiecursor ;
PImage home ;
PImage end ;
float humX ;
float humY ;

int myState = 0 ;


void setup() {
  size(500, 500) ;
  
  background = loadImage("background.png") ;
  human = loadImage("Human.png") ;
  zombiecursor = loadImage("zombiecursor.png") ;
  home = loadImage("homescreen.png") ;
  end = loadImage("endscreen.png") ;
  
  humX = mouseX ;
  humY = mouseY ; 
  
myzombs = new ArrayList() ;
  
  for (int i = 0 ; i < 10; i++) {
    myzombs.add(new Car()) ;
  }  
  
}


void mousePressed() {
  myState = myState + 1 ;
  if (myState > 2) {
    myState = 0 ;
  }
}


void draw() {
  image(background, 0, 0) ;
  cursor(human) ;
  
  switch(myState) {
    
    case 0:
      image(home, 0, 0) ;
    break ;
    
    case 1:
      for (int i = 0 ; i < myzombs.size() ; i++) {
        Car car = (Car) myzombs.get(i) ;
        car.display() ;
        car.drive() ;   
  
      PVector humLoc = new PVector(mouseX, mouseY) ; 
      float d = (car.loc).dist(humLoc) ;

      if (d < 25) {
        myState = myState + 1 ;
        }
      } 
      
      for (int i = 0 ; i < myzombs.size() ; i++) {
      Car car = (Car) myzombs.get(i) ;
      }
    break ;
    
    case 2:
      image(end, 0, 0) ;
      cursor(zombiecursor) ;
    break ;     
   }
}


  
  
  
  
  
  
  
  

class Car {
  
 //attributes - What we will be naming
 PVector loc ;
 PVector velocity ;
 PImage zombie ;

  
 //constructor - defining the attributes
  Car() {
     loc = new PVector(random(width), random(height)) ; 
     velocity = new PVector(random(-3, 3), -random(-3, 3)) ; 
     zombie = loadImage("Zombie.png") ;
   }
  
  
  //methods
  
void display () { 
    image(zombie, loc.x, loc.y) ;
} 
  
  // how the zombies move
void drive  () {             
    loc.add(velocity) ; 
    
    if (loc.x > width) {
      loc.x = 0 ;
    }
      
    if (loc.y > height) {
      loc.y = 0 ;
    }
      
    if (loc.x < 0) {
      loc.x = width ;
    }
      
    if (loc.y < 0) {
      loc.y = height ;
    }   
  }
}



