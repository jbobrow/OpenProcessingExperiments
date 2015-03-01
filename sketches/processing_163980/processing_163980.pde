

int x ;
Car myCar1 ;

ArrayList<Car> myCars  ;
PVector frogLocation ;
int myScore = 0 ;
int myState = 0 ;

void setup () {
  size(500, 500) ;
  myCar1 = new Car() ;

  myCars = new ArrayList() ;
  for (int i = 0; i < 10; i++) {
    myCars.add(new Car()) ;
  }

  frogLocation = new PVector(width/2, height-50) ;
}


void draw () {

  switch(myState) {
  case 0:
    background(100) ;
    text("Do something actually worth your time", width/2, height/2) ;
    break ;

  case 1:
    //playing the game
    text("Start, or whatever", width/2, height/2) ;
    game() ;
 //   if (myScore < 88) {
  //    myState = 2 ;
   // }

    break ;

  case 2 : 
    text("Do you really want to play this again?", width/2, height/2) ;
    if (mousePressed) {
      myState = 0 ;
    }
    break ;
  }
}

void mousePressed() {
  myState = (myState + 1) % 3 ;
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
  float wide ;
  boolean alive ;

  // Constructor(s)
  Car() {

    location = new PVector(random(width), random(height)) ;
    velocity = new PVector(random(-3, 3), random(-3, 3)) ;
    myColor = color(random(255), random(255), random(255)) ;
    wide = 62 ;
    alive = true ;
  }

  // methods

  void display() {  //how it looks
    fill(myColor) ;
    rect(location.x, location.y, wide, 25) ;
    fill (myColor) ;
    text("Look out!", location.x+5, location.y+16) ;
    translate(location.x, location.y) ;
    rect(0, 0, wide, 25) ;
    scale(wide/100) ;
    // monster() ;
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


void game() {
  background(#2065C4) ;

  // iteratae thru car array
  for (Car myCar : myCars) {
    pushMatrix() ;
    myCar.display() ;
    myCar.drive() ;
    popMatrix() ;

    // test distance of to frog
    float d = (myCar.location).dist(frogLocation) ;

    if (d < myCar.wide) {
      text(" you suck ", 20, 20) ; 
      myScore++ ;
      myCar.alive = false ;
    }
  }

  // iterate thru car array and delete dead cars
  for (int i = 0; i < myCars.size (); i++) {
    Car thisCar = (Car) myCars.get(i) ;
    if (thisCar.alive == false) {
      myCars.remove(i) ;
    }
  }

  // make my frog
  fill(0, 255, 0 ) ;
  ellipse(frogLocation.x, frogLocation.y, 30, 30) ;
  //image(myImage, frogLocation.x, frogLocation.y) ;

  fill(255) ;
  text(myScore, 10, 30) ;
}

void monster() {
  fill(255, 0, 0) ;
  triangle(220, 55, 250, 10, 280, 55) ;
  rect(60, 270, 80, 30) ;
  rect(350, 270, 90, 30) ;
  rect(195, 340, 30, 100) ;
  rect(275, 340, 30, 100) ;
  rect(175, 440, 50, 30) ;
  rect(275, 440, 50, 30) ;

  ellipse(250, 200, 300, 300) ;





  fill(255, 255, 255) ;
  ellipse(250, 145, 100, 100) ;


  fill(0) ;
  rect(214, 265, 75, 40);
  ellipse(250, 160, 50, 50) ;
  //rect(0, 470, width, 30) ;
  fill(255, 255, 255) ;
  rect(232, 265, 40, 20);
}



