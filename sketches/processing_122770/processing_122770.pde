
ArrayList myCars ;
 
PVector catPos ;
 
PImage pic1;  // mouse
PImage pic2;  // moth
PImage pic3;  // squirrel
PImage pic4; //  bird
 
PImage pic6;  //cat Up
PImage pic7;  //cat Down
PImage pic8;  //cat Right
PImage pic9;  //cat Left
PImage pic10;  //catpounce Up
PImage pic11;  //catpounce Down
PImage pic12;  //catpounce Right
PImage pic13;  //catpounce Left
PImage myCat;
PImage pic14;  // splash screen
 
int myState = 0 ;
 
void setup() {
 
  size(600, 600) ;
 
  catPos = new PVector(width/2, height/2) ; 
 
  pic1 = loadImage("mouse.png");
  pic2 = loadImage("moth.png");
  pic3 = loadImage("squirrel.png");
  pic4 = loadImage("bird.png");
 
  pic6 = loadImage("catpounceU.png");
  pic7 = loadImage("catpounceD.png");
  pic8 = loadImage("catpounceR.png");
  pic9 = loadImage("catpounceL.png");
  pic10 = loadImage("cat2feetU.png");
  pic11 = loadImage("cat2feetD.png");
  pic12 = loadImage("cat2feetR.png");
  pic13 = loadImage("cat2feetL.png");
  pic14 = loadImage("splash.png");
 
  myCars = new ArrayList() ;
 
  for (int i = 0 ; i < 50 ; i++) {
    myCars.add(new Car()) ;
  }
 
  myCat = pic12 ;
}
 
 
void draw() {
 
  switch(myState) {
 
  case 0:
    background(pic14) ;
    break;
 
  case 1:
 
    background(#931212) ;
 
    // drawing and moving cars
    for (int i = 0 ; i < myCars.size() ; i++) {  
      Car tempCar = (Car) myCars.get(i) ;
      tempCar.display() ;
      tempCar.drive() ;
 
      float d = (tempCar.pos).dist(catPos) ;
      if (d < tempCar.wide) {
        //println("boom!") ;
        tempCar.alive = false ;
      }
    }
 
    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i) ;
 
      if (tempCar.alive == false) {
        myCars.remove(i) ;
      }
    }
 
    // draw
 
    image(myCat, catPos.x, catPos.y) ;
 
    break ;
 
  case 2:
    text("Click to reset game!", 20, 20) ;
    break ;
  }
}
 
 
void keyPressed() {
  //  println(keyCode) ;
 
  switch(keyCode) {
  case 37: // left arrow
    catPos.x = catPos.x - 15 ;
 
    if (catPos.x < 0) {  //up
      catPos.x = 750 ;
    }
 
    myCat = pic9 ;
 
    break ;
 
  case 38: // up
    catPos.y = catPos.y - 15 ;
 
    if (catPos.y < 0) {  //up
      catPos.y = 750 ;
    }
    myCat = pic6 ;
 
    break ;
 
  case 39: // right
    catPos.x = catPos.x + 15 ;
 
    if (catPos.x > width) {  //up
      catPos.x = 0 ;
    }
    myCat = pic8 ;
 
    break ;
 
  case 40: // down
    catPos.y = catPos.y + 15 ;
 
    if (catPos.y > height) {  //down
      catPos.y = 0 ;
    }
    myCat = pic7 ;
 
    break ;
  }
}
 
void keyReleased() {
  //  println(keyCode) ;
 
  switch(keyCode) {
  case 37: // left arrow
    catPos.x = catPos.x - 15 ;
 
    if (catPos.x < 0) {  //up
      catPos.x = 750 ;
    }
    myCat = pic13 ;
 
    break ;
 
  case 38: // up
    catPos.y = catPos.y - 15 ;
 
    if (catPos.y < 0) {  //up
      catPos.y = 750 ;
    }
    myCat = pic10 ;
 
    break ;
 
  case 39: // right
    catPos.x = catPos.x + 15 ;
 
    if (catPos.x > width) {  //up
      catPos.x = 0 ;
    }
    myCat = pic12 ;
 
    break ;
 
  case 40: // down
    catPos.y = catPos.y + 15 ;
 
    if (catPos.y > height) {  //down
      catPos.y = 0 ;
    }
    myCat = pic11 ;
 
    break ;
  }
}
 
 
void mousePressed() {
   
  myState = myState + 1 ;
   
  if (myState == 0) {
    myState = 1 ;
  }
 
  if (myState == 2) {
 
    for (int i = 0 ; i < myCars.size() ; i++) {  
      Car tempCar = (Car) myCars.get(i) ;
      tempCar.display() ;
      tempCar.drive() ;
      myState = 0 ;
    }
     
    myState = 0 ;
     
  }
}
 
class Car {
 
  // attributes 
  //color myColor ;
  PVector vel ;
  PVector pos ;
  float wide ;
  boolean alive ;
 
  PImage myHunt; 
 
 
  // PVector myPosition.z ;
 
  // Constructor
  Car() {
    vel = new PVector(random(-2, 2), random(-2, 2)) ;
    pos = new PVector(random(width), random(height)) ;
    //myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 60) ;
    alive = true ;
 
    // decide what food
    int myRandom = int(random(4)) ;
    switch(myRandom) {
    case 0:
      myHunt = pic1 ;
      break ;
 
    case 1:
      myHunt = pic2 ;
      break ;
 
    case 2:
      myHunt = pic3 ;
      break ;
 
    case 3:
      myHunt = pic4 ;
      break ;
    }
  }
 
  // Methods
  void display() {
    // this is the part I will change later!!!!
    //fill(myColor) ;
    //rect(pos.x, pos.y, wide, 25) ;
 
 
    image(myHunt, pos.x, pos.y) ;
  }
 
  void drive() {
    pos.add(vel) ;
 
    if (pos.x > width) {
      pos.x = 0 ;
    }
 
    if (pos.x < 0 ) {
      pos.x = width ;
    }
 
    if (pos.y > height) {
      pos.y = 0 ;
    }
 
    if (pos.y < 0 ) {
      pos.y = height ;
    }
  }
}



