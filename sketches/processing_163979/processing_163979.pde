
/* @pjs preload="net.png, big.jpg, rubberd.jpg" ; *****/  

// int x ;
//Car myCar1 ; 

ArrayList<Car> myCars ; 
PVector frogLocation ; 
int score = 0 ;
int myState = 0 ;
PImage net ; 
PImage big ; 
PImage rubberd ; 


void setup() {
  size(600, 600) ; 

  net = loadImage("net.png") ; //use a .png image or something with a transparent background
  big = loadImage("big.jpg") ; 
  rubberd = loadImage("rubberd.jpg") ; 
  myCars = new ArrayList() ;

  for (int i = 0; i < 20; i++) {
    myCars.add(new Car()) ;
  }

  frogLocation = new PVector(width/2, height-50) ;//adjust the pvector width and height to set the starting location
  imageMode(CENTER) ;
}

void draw() {
  background(100) ; 
  switch(myState) {

  case 0:
    background(#FAEA5B) ; 
    image(big, 300, 300) ; 
    text("Welcome to the Duck World", width/2, height/6, 200) ; 
    fill(#0D0205) ; 
    break ; 

  case 1:
    // playing the game

    background(#FAEA5B) ; 
    text("Gotta catch em all! click to GO!", width/5, height/2, 20) ;
    fill(#A50A31) ; 
    
    break ; 

  case 2:
    // play the game
    image(rubberd, 300, 300) ; 
    game() ; 
    break ;

  case 3:
    // end the game
    background(#FAEA5B) ;
    text("game over! Lets play again!", width/8, height/4) ;
    fill(#A50A31) ; 
    break ;
  }
} 

void mousePressed() {
  myState = (myState + 1) % 4 ;
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

  // constructor(s) 
  Car() {

    location = new PVector(random(width), random(height)) ; 
    velocity = new PVector(random(-3, 3), random(-3, 3)) ;
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 50) ; 
    alive = true ;
  }

  // methods
  void display() {  // how it looks
    fill(myColor) ; 
    //    rect(location.x, location.y, wide, 25) ;
    //    text("hello", location.x, location.y+50) ;
    translate(location.x, location.y) ; 
    //rect(0, 0, wide, 25) ; 
    scale(wide/500) ; 
    monster() ;
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

  // from void draw 


  // iterate thru car array
  for (Car myCar : myCars) {
    pushMatrix() ; 
    myCar.display() ;
    myCar.drive() ;
    popMatrix() ; 

    // test distance of car to frog
    PVector topOfNet = new PVector(frogLocation.x, frogLocation.y-60) ; 
    float d = (myCar.location).dist(topOfNet) ;

    if (d < myCar.wide) {
      println(" boom! ") ; 
      score++ ; 
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

  if (myCars.size() <= 0) {
    myState = 3 ; 
    for (int i = 0; i < 20; i++) {
      myCars.add(new Car()) ;
    }
  }


  // make my frog
  fill(#293643) ; 
  //  rect(frogLocation.x, frogLocation.y, 10, 50) ; //add image
  image(net, frogLocation.x, frogLocation.y, width /3, height /3) ;  
  // if you want to use image
  // image(myImage, frogLocation.x, frogLocation.y) ; 

  fill(255) ; 
  text(score, 10, 30) ;
}

void monster() {

fill(#7F8119) ;
ellipse(459, 235, 90, 30) ; //bottom lip
 
 
fill(#EDDC1D) ;
ellipse(455, 186, 205, 40) ; //top lip
 
noStroke() ;
fill(#F70519) ;
ellipse(344, 230, 250, 250) ; //head
 
noStroke() ;
fill(#8340BF) ;
rect(394, 215, 5, 10) ; //bottom
 
noStroke() ;
fill(#8340BF) ;
rect(404, 212, 5, 10) ; //bottom2
 
noStroke() ;
fill(#8340BF) ;
rect(412, 209, 5, 10) ; //bottom3
 
noStroke() ;
fill(#F70519) ;
rect(83, 522, 70, 60) ; //backleg
 
 
fill(#F70519) ;
rect(380, 494, 45, 60) ; //frontleg
 
noStroke() ;
fill(#FAFF00) ;
ellipse(243, 436, 400, 300) ; //body
 
fill(#F70519) ;
rect(167, 530, 90, 65) ; //backfrontleg
 
 
noStroke() ;
fill(20) ;
ellipse(399, 191, 50, 50) ; // eye
 
noStroke() ;
fill(#FFFFFF) ;
ellipse(402, 191, 15, 15) ; //pupil
}


