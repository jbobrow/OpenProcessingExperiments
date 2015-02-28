
/*
Car myCar1 ;
Car myCar2 ;
*/
ArrayList myCars ;
float frogX ;
float frogY ; 
PImage mouth ;


void setup() {
 size(500, 500) ;
 rectMode(CENTER) ;
 mouth = loadImage("mouth.png") ;
 
 frogX = width/2 ;
 frogY = height-50 ;
 

//myCar1 = new Car() ;
//myCar2 = new Car() ;

myCars = new ArrayList() ; //make a new arrayList

for (int i = 0 ; i < 20; i++) {
  myCars.add(new Candy()) ;
}  
  
}


void draw() {
  background(100) ;
 /* 
  myCar1.display() ;
  myCar1.drive() ;
  
  
  myCar2.display() ;
  myCar2.drive() ;
  
 */ 
 
 //move my cars
 for (int i = 0 ; i < myCars.size() ; i++) {
  Candy car = (Candy) myCars.get(i) ; 
 car.display() ;
  car.drive() ;
  
  PVector frogLoc = new PVector(frogX, frogY) ;
  float d = (car.loc).dist(frogLoc) ;
  
  if(d < 20) { 
   car.alive = false ;
    
  }
  
 }
 
 for (int i = 0 ; i < myCars.size() ; i++) {
  Candy car = (Candy) myCars.get(i) ; 
 
 //check if car is alive
 if (car.alive == false){
   myCars.remove(i) ;
 }
  
 }
  
  //draw my Frog
  fill(0, 150, 0) ;
  image(mouth, frogX, frogY, 100, 80) ;
  
  }
  
  
  
  void keyPressed() {
  //  println("key pressed = " + key) ; 
    
    if (keyCode == 39) { //right
      frogX = frogX + 20 ;
    }
   
   if (keyCode == 37) { //left
     frogX = frogX - 20 ;
   } 
   
      if (keyCode == 38) { //up
      frogY = frogY - 20 ;
    }
   
   if (keyCode == 40) { //down
     frogY = frogY + 20 ;
   } 
  }   

class Candy {
  
 //attribute
 float mysize ;
 PImage candyimage ;
 PVector loc ;
 color myColor ; 
 PVector vel ;
 boolean alive ;
 

//constructor
Candy() {
loc = new PVector(random(width), random(height)) ;
vel = new PVector(random(1,5), 0) ;

candyimage = loadImage("candy.png") ;

mysize = random(25, 80) ;

 myColor = color(random(255), random(255), random(255)) ;
 alive = true ;
}


//methods  
  void display() {
  //  fill(myColor) ;
    image(candyimage, loc.x, loc.y, mysize, mysize) ;
  }
  
  void drive() {
  loc.add(vel) ;
  
   if (loc.x > width) {
     loc.x = 0 ;
}
 } 
  }

class Car {
  
 //attribute
 PVector loc ;
 color myColor ; 
 PVector vel ;
 boolean alive ;
 

//constructor
Car() {
loc = new PVector(random(width), random(height)) ;
vel = new PVector(random(1,5), 0) ;

 myColor = color(random(255), random(255), random(255)) ;
 alive = true ;
}


//methods  
  void display() {
    fill(myColor) ;
    ellipse(loc.x, loc.y, 50, 25) ;
  }
  
  void drive() {
  loc.add(vel) ;
  
   if (loc.x > width) {
     loc.x = 0 ;
}
 } 
  }


