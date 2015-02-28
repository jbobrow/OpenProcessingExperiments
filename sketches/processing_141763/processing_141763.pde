
/* @pjs  preload = "bigbee.png, flower.jpg, flowerfield.jpg, smallbee.png"  ; */
ArrayList myCars ;
PImage bumblebeetuna ;
PImage flower ;
PImage flowerfield ;
PImage smallbee ;
int myState = 0 ;
int x = 50 ;
int xDelta = 1 ;

void setup() {
   size(500, 500) ;
  bumblebeetuna = loadImage("bigbee.png") ;
  flower = loadImage("flower.jpg") ;
  flowerfield = loadImage("flowerfield.jpg") ; 
  smallbee = loadImage("smallbee.png") ; 

  
    myCars = new ArrayList() ;
 for (int i = 0 ; i < 100; i++) {
    myCars.add(new Car()) ;
  }

//  myCar1 = new Car() ; (old way)

 
}


void draw() {
 switch(myState) {
  case 0:
    background(0);
    image(flower, 0, 0) ;
    image(bumblebeetuna, 100, x) ;
    x = x + xDelta ;
if (x < 50) {
   xDelta = 1 ;
}
if (x > 100) {
  xDelta = -1 ;
}
  break ;
  
  case 1:
    background(0);
    image(flowerfield, 0, 0) ;
  
//  myCar1.display() ; (old way)
//  myCar1.drive() ;


  for (int i = 0 ; i < 100; i++) {
    Car thisCar = (Car) myCars.get(i) ;
    thisCar.display() ;
    thisCar.drive() ;
  }
   break ;
 }
}

void mousePressed() {

  myState = myState + 1 ; 
  if (myState > 1) {
  myState = 0 ;
  
} 
}
class Car {
  
  // attributes
  PVector position ;
  PVector velocity ;
  float mySize ;
  color myColor ;
  PImage smallbee ;
  


  //constructor
  Car() {
    position = new PVector(random(width), random(height)) ;
    velocity = new PVector(random(-5, 5), random(-3, 3)) ;
    mySize = random(10, 25) ;
    myColor = color(random(255), random(255), random(255)) ;
    
  }
  
  //methods
  void display() {
   smallbee = loadImage("smallbee.png") ;
  image(smallbee, position.x, position.y, mySize, mySize) ;
  textSize(mySize) ;

  
}
  void drive() {
    position.add(velocity) ;
    if (position.x > width) {
      position.x = 0 ;
    }
     if (position.y > height) {
      position.y = 0 ;
     }
      if (position.x < 0) {
      position.x = width ;
    }
     if (position.y < 0) {
      position.y = height ;
     }
     
  }
}





