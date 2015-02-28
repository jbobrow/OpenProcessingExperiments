
ArrayList myBballz ;
PVector rimPos ;
int deathCounter = 0 ;
PImage intro ;
PImage daRim ;
int myState = 0 ;
int myCounter = 0 ;
int x = 0 ;

void setup() {
  size(500, 500) ;
  background(#000000) ;
  frameRate(60) ;
  intro = loadImage("introScreen.png") ;
  daRim = loadImage("ballRim.png") ;
  rimPos = new PVector(mouseX, mouseY) ;
  myBballz = new ArrayList() ; 
      for (int i = 0 ; i < 500; i++) {
  myBballz.add(new bballz()) ;
      }
}

void draw() {
  
  switch(myState) {
    
case 0:
  background(#000000) ; 
  rimPos.x = mouseX ;
  rimPos.y = mouseY ; 
  image(daRim, rimPos.x, rimPos.y) ; 
  textSize(20) ;
  fill(random(255), random(255), random(255)) ;
  text("Click Here To Start", 165, 450) ;
  textSize(50) ;
  fill(#FFFFFF) ;
  text("Make 500 Shots", 60, 100) ;
break ;
  
case 1:
  background(#000000) ;
//moves my balls
    for (int i = 0 ; i < myBballz.size() ; i++) {
    bballz bball = (bballz) myBballz.get(i) ;
    bball.display() ;
    bball.drive() ;
    
    float dis = (bball.loc).dist(rimPos) ;
    
    if (dis < 50) {
      bball.alive = false ;
      fill(random(255), random(255), random(255)) ;
      text("+1", random(width), random(height)) ;
 }

    
// check if my balls are alive
    if (bball.alive == false){
      myBballz.remove(i) ;
      deathCounter++ ;
      
 }
} 
  
// draw my rim
  rimPos.x = mouseX ;
  rimPos.y = mouseY ; 
  image(daRim, rimPos.x, rimPos.y) ; 
  

  
// finish after 100
  if(deathCounter > 499) {
   myState = 2 ; 
   
    }
//timer
  myCounter = myCounter +1 ;
  fill(#FFFFFF);
  text(myCounter/60 + "secs", 335, 485) ;
//shot counter
  textSize(50) ;
  fill(#FFFFFF) ;
  text(deathCounter, 0, 485) ;
break ;
  
case 2:
  background(#000000) ;
  textSize(70) ;
  text("Woohoo!", 90, 70) ;
  fill(random(255), random(255), random(255));
  text(deathCounter + "pts", 125, 325) ;
  textSize(30) ;
  fill(#FFFFFF);
  text("in" + myCounter/60 + "secs.", 320, 350) ;
  textSize(40) ;
  fill(#FC0D0D);
  text("CLICK TO REPLAY", 75, 450) ;
break ;
 }
}

void mousePressed() {
 if(myState == 0) {
  myState = 1 ;
 }
 
 if(myState > 1) {
  myState = 0 ; 
  deathCounter = 0 ;
  myCounter = 0 ;
    for (int i = 0 ; i < 500; i++) {
  myBballz.add(new bballz()) ;
      }
 }
 } 

class bballz {
  
// attributes
  PVector loc ; 
  PVector vel ;
  boolean alive ;
  PImage bball ;
  

  
// constructor
  bballz() {
    loc = new PVector(random(5,450), random(-2000, -500)) ;
    vel = new PVector( 0, random(4,7)) ;
    alive = true ; 
    bball = loadImage("basketb.png") ;
  
  }
  
  
// methods
  void display() {
   image(bball, loc.x, loc.y ) ; 
  }
  
  void drive() {
    loc.add(vel) ;
    
    if (loc.y > height) {
      loc.y = -20 ;
    }
  }
  
  
}


