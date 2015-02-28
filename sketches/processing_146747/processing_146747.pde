
/* @pjs preload="intro.jpg, swarm.jpg, swat.png, fly.png, intro2.jpg, outro.jpg"; */

PImage intro;
PImage bg;
PImage swat;
PImage flyyy;
PImage intro2;
PImage outro;

ArrayList myFlies ;
PVector swatPos ;
int myState = 0 ; 

void setup() {
  size(500, 500) ;
  rectMode(CENTER) ;
  intro = loadImage("intro.jpg");
  bg = loadImage("swarm.jpg");
  swat = loadImage("swat.png");
  flyyy = loadImage("fly.png");
  intro2 = loadImage("intro2.jpg");
  outro = loadImage("outro.jpg");
  

 swatPos = new PVector(mouseX, mouseY) ;

  myFlies = new ArrayList() ;

  for (int i = 0 ; i < 20; i++) {
    myFlies.add(new Fly()) ;   
  }
}


void draw() {
  
  switch(myState) {
    
    case 0: 
    background(100) ; 
    image(intro, 0,0) ;
    
    break ; 
   
    
    
  case 1:
// ***** STATE 1 - PLAYING THE GAME *****

  background(bg) ; 

// moves my cars and tests the distance to the frog
  for (int i = 0 ; i < myFlies.size() ; i++) {
    Fly fly = (Fly) myFlies.get(i) ;
    fly.display() ;
    fly.drive() ;
 
 //   PVector frogLoc = new PVector(frogX, frogY) ; 
    float d = (fly.loc).dist(swatPos) ;
    
    if (d < 20) {
 //     println("BOOM!!!" ) ; 
      fly.alive = false ;  // mark this car for deletion 
      // myState = 2 ; 
    }
    
  }
  
  
  
   for (int i = 0 ; i < myFlies.size() ; i++) {
    Fly fly = (Fly) myFlies.get(i) ;
    
    // check if car is alive
    if (fly.alive == false){
      myFlies.remove(i) ;
    }
    
   } 
  
  // check to see how many cars we have
  if (myFlies.size() == 0) {
    myState = 3 ;
  }
  

  swatPos.x = mouseX ;
  swatPos.y = mouseY ;
  
  
  image(swat, swatPos.x - 30, swatPos.y - 30); 
  
  
// ***** END OF STATE 1 - PLAYING THE GAME *****  
  break ; 
  
  
  case 2:
  background(100) ;
  image(outro,0,0);

  break ; 
  
  }
  
}  // END OF DRAW ROUTINE


void mousePressed() {
  if (myState == 0) {
    myState = 1 ; 
  }

  
  if (myState == 2) {
     // reset the amount of cars
   for (int i = 0 ; i < 20; i++) {
    myFlies.add(new Fly()) ;   
  }
    
    myState = 0 ;
  }
  
}




class Fly {
  
  // attributes
  PVector loc ; 
  PVector vel ;
  color myColor ;
  boolean alive ;

  
  // constructor
  Fly() {
    loc = new PVector(random(10,490), random(10,490)) ;
    vel = new PVector(random(1,8), 0) ;
     
    myColor = color(random(255), random(255), random(255)) ; 
    alive = true ; 
  }
  
  
  // methods
  void display() {
    image(flyyy,loc.x, loc.y);
  }
  
  void drive() {
    loc.add(vel) ;
    
    if (loc.x > width) {
      loc.x = -50 ;
    }
    
  }
  
  
}


