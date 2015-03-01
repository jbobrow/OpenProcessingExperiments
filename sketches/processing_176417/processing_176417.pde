
PImage img;
PImage mouth;
// int x ;
//Car myCar1 ; 

ArrayList<Car> myCars ; 
PVector frogLocation ; 

void setup() {
  size(450, 450) ; 
  img = loadImage("gumballs.jpg") ;
  mouth = loadImage("mouth.jpg") ;
  //  myCar1 = new Car() ;

  myCars = new ArrayList() ;

  for (int i = 0; i < 10; i++) {
    myCars.add(new Car()) ;
  }

  frogLocation = new PVector(width/2, height-50) ;
}

void draw() {
  image(img, 0, 0) ;

  //  myCar1.display() ; 
  //  myCar1.drive() ;
  for (Car myCar : myCars) {

    myCar.display() ;
    myCar.drive() ;
  }

  // make my frog 
  image(mouth, frogLocation.x, frogLocation.y, width/4, height/4) ;
}


void keyPressed() {
  println(keyCode) ; 
  
  if (keyCode == 39) {
    frogLocation.x += 30 ;
  }
  
    if (keyCode == 37) {
    frogLocation.x -= 30 ;
  }
  
    if (keyCode == 38) {
    frogLocation.y -= 30 ;
  }
  
    if (keyCode == 40) {
    frogLocation.y += 30 ;
  }
  
  
  
}


class Car {

  // attributes
  PVector location ;
  PVector velocity ; 
  color myColor ;  

  // constructor(s) 
  Car() {

    location = new PVector(random(width), random(height)) ; 
    velocity = new PVector(random(-3, 3), random(-3, 3)) ;
    myColor = color(random(255), random(255), random(255)) ;
  }

  // methods
  void display() {  // how it looks
    fill(myColor) ; 
    ellipse(location.x, location.y, 50, 50) ;
  }

  void drive() {
    location.add(velocity) ; 

    if (location.x > width) {
      location.x = 0 ;
    }

    if (location.x < 0) {
      location.x = width ;
    }

    if (location.y > height) {
      location.y = 0 ;
    }

    if (location.y < 0) {
      location.y = height ;
    }
  }
}



