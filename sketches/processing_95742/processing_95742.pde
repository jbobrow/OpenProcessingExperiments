
/* @pjs font="Sanchez-Regular.ttf"; */

ArrayList myCars ;
float frogX ;
float frogY ;
float frogW ;
float frogH ;
PFont myFont ;


void setup() {
  size(500, 500) ;
  rectMode(CENTER) ;

  frogX = width/2 ;
  frogY = height -50 ;
  frogW = 40 ;
  frogH = 50 ;
  myFont = createFont("Sanchez-Regular.ttf", 35);


  myCars = new ArrayList() ;

for (int i = 0 ; i < 30; i++) {
  myCars.add(new Car()) ;
}

}

void draw() {
  background(100) ;
  textFont(myFont, 27) ;
  text ("Use arrow keys to eat the bugs!", width/10, height/10) ;


  for (int i = 0 ; i < myCars.size() ; i++) {
  Car car = (Car) myCars.get(i) ;
  car.display() ;
  car.drive() ;
  
  PVector frogLoc = new PVector(frogX, frogY) ;
  float d = (car.loc).dist(frogLoc) ;

  if (d < 20) {
    println("FEED!") ;
    car.alive = false ;
  }


  //check if car is alive
  if (car.alive == false) {
     myCars.remove(i) ;
     frogW = frogW + 10 ;
     frogH = frogH + 15 ;
  }
  }
  


  //draw my Frog
  fill(0, 150,0) ;
  rect(frogX, frogY, frogW, frogH) ;

}


void keyPressed() {
 //println("key pressed = " + keyCode) ;

 if (keyCode == 39) {
  frogX = frogX + 25 ;
 }
 if (keyCode == 37) {
  frogX = frogX - 25 ;
 }
 if (keyCode == 38) {
  frogY = frogY - 25 ;
 }
 if (keyCode == 40) {
  frogY = frogY + 25 ;
 }
 if (frogX > width){
  frogX = 0 ;
 }
 if (frogY > height){
  frogY = 0 ;
 }
 if (frogX < 0){
  frogX = width ;
 }
 if (frogY < 0){
  frogY = height ;
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
     vel = new PVector(random(-3, 3), random(-3, 3)) ;
     myColor = color(125) ;
     alive = true ;
  }


  // methods
    void display() {
    fill(myColor) ;
    ellipse(loc.x, loc.y, 10, 6);
 // text(v,x-23,y-20) ;
  }

  void drive() {
    loc.add(vel) ;
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
/*class Car1 {
  // attributes
  PVector loc ;
  PVector vel ;
  color myColor ;
  boolean alive ;

  // constructor
  Car1() {
     loc = new PVector(random(width), random(height)) ;
     vel = new PVector(random(-5, 5), random(-5, 5)) ;
     myColor = color(250, 0, 0) ;
     alive = true ;
  }


  // methods
    void display() {
    fill(myColor) ;
    ellipse(loc.x, loc.y, 10, 6);
 // text(v,x-23,y-20) ;
  }

  void drive() {
    loc.add(vel) ;
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
*/


