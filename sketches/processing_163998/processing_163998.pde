
/* @pjs preload="homer.png, donut_copy2.png, clouds.jpg, start_homer.jpg, continuecopy.jpg" ; */
//Car myCar1 ; 
//Car myCar2 ; 
ArrayList <Car> myCars ;
PVector HomerHead ;
int score = 0;
int myState = 0 ;
int myCounter = 10*60 ;
PImage Homer ;
PImage Donut ;
PImage myBackground ;
PImage startscreen ;
PImage continuescreen ;
PImage gameover ;

void setup() {
  size(500, 500) ;
 // myCar1 = new Car() ; // birth a new object
  //myCar2 = new Car() ;
     Homer = loadImage("homer.png") ;
     Donut = loadImage("donut_copy2.png") ;
     myBackground = loadImage("clouds.jpg") ;
     startscreen = loadImage("start_homer.jpg") ;
     continuescreen = loadImage("continuecopy.jpg") ;
     gameover = loadImage("gameover.jpg") ;
     
  
  myCars = new ArrayList() ;
  
  for (int i = 0; i < 40; i = i + 1) {
    myCars.add (new Car()) ;
  }
  
  HomerHead = new PVector(width/2, height-20) ;
}

void draw() {

  
   switch(myState) {
    case 0:
    image(startscreen,0 ,0);
    break ;
    
    
   case 1:
    myCounter = (myCounter-1) ;
    println(myCounter) ;
    //if myCounter < 0 then go to case 2
    if (myCounter < 0) {
      myState = 2 ;
     myCounter = 10*60 ;
    }
    
   image(myBackground, 0, 0) ;
   //playing the game
   game() ;
   break ;
   
   case 2:
   image(continuescreen, 0, 0) ;
   break ;
   
   case 3:
   image(gameover, 0, 0) ;
   
  }
  
}

void keyPressed(){
 // println ("you have pressed a key") ;
 //right
 if (keyCode == 39) {
    HomerHead.x += 30 ; 
  }
  //left
   if (keyCode == 37) {
    HomerHead.x -= 30 ; 
  }
  //up
   if (keyCode == 40) {
    HomerHead.y += 30 ; 
  }
  //down
   if (keyCode == 38) {
    HomerHead.y -= 30 ; 
  }


}

void mousePressed() {
switch(myState) {
    case 0:
   myState = 1 ; 
    break ;
    
    case 1:
    myState = 2 ; 
    break ;
    
    case 2:
    myState = 1 ;
    break ;

}
  }

class Car {
  
  // attributes
  PVector location ;
  PVector velocity ;
  color myColor ;
  float wide ;
  boolean alive ;
  
  // Constructor
 Car() {
   location = new PVector(random(width),random(height)) ;
   velocity = new PVector(random(-3 , 3), random(-3 , 3)) ;
   myColor = color(random(255), random(255), random(255)) ;
   wide = random (30, 70) ;
   alive = true ;
   
 } 
  
  // methods
  void display() {
    fill(myColor) ;
    //rect (location.x, location.y, wide, 25) ;
    //fill (#FFFFFF) ;
    //text("beep", location.x, location.y) ;
   translate(location.x, location.y) ;
   scale(.5, .5) ;
   donut() ;
   
    
  }
  
  void drive() {
    location.add(velocity) ;
    if (location.x > width) {
      location.x = -50;
      
  }
      if (location.y > height) {
      location.y = -50 ;
      
  }
      if (location.x < -50) {
      location.x = width ;
      
  }
      if (location.y < -50) {
      location.y = height ;
      
  }

 
  }
}

  


/* @pjs preload="myBackground.jpg " ; */
void game() {
   background(myBackground) ;



  //myCar1.display() ;
  //myCar1.drive() ;
  //myCar2.display() ;
  //myCar2.drive() ;
  
 // iterate thru car array
  for (Car myCar : myCars) {
   pushMatrix() ;
    myCar.display() ;
    myCar.drive () ;  
   popMatrix() ;
    //test distance of car to frog
    float d = (myCar.location).dist(HomerHead) ;
    
    if (d < myCar.wide) {
       println("boom!") ;
       score++ ;
       myCar.alive = false ;
    }
  }
  //iterate thru car array and delete dead cars
  for(int i = 0 ; i < myCars.size() ; i++) {
    Car thisCar = (Car) myCars.get(i) ;
    if (thisCar.alive == false) {
      myCars.remove(i) ;
    }
}

  //make my frog
 image(Homer, HomerHead.x, HomerHead.y, 100, 100) ;
 //image(myImage, froglocation.x, froglocation.y) ;
 
 fill(#FFFFFF) ;
 text(score, 10,30) ;


}

void donut () {
 

// fill(0);
//ellipse(150, 110, 20, 30);
image(Donut, 0, 0) ; 
}


