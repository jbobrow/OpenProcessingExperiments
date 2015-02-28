
/* @pjs  preload = "yawn.jpg, sad.jpg, sheep.png"  ; */
ArrayList myCars ;
PImage yawn1 ;
PImage sad1 ;
PImage sheep1 ;
int myState = 0 ;

void setup() {
  size(400, 598) ;
  yawn1 = loadImage("yawn.jpg") ;
  sad1 = loadImage("sad.jpg") ;
  sheep1 = loadImage("sheep.png") ;

  myCars = new ArrayList() ;
  for (int i = 0 ; i < 20; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {

  switch(myState) {
  case 0:
    image(sad1, 0, 0) ;
    break ;

  case 1:
    background(0);
    image(yawn1, 0, 0) ;


    for (int i = 0 ; i < 20; i++) {
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
   
 
 
  //constructor
  Car() {
    position = new PVector(random(width), random(height)) ;
    velocity = new PVector(random(-5, 5), random(-3, 3)) ;
    mySize = random(35, 75) ;
  }
   
  //methods
  void display() {
   sheep1 = loadImage("sheep.png") ;
  image(sheep1, position.x, position.y, mySize, mySize) ;
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


