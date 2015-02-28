

ArrayList myWorms ;
//float frogX ;
//float frogY ; 
PVector birdPos ;
int deathCounter = 0 ; 
int myState = 0 ; 

void setup() {
  size(500, 500) ;
  rectMode(CENTER) ;
  
 // frogX = width/2 ;
 // frogY = height-50 ; 
 birdPos = new PVector(mouseX, mouseY) ;

  myWorms = new ArrayList() ;  // make a new arrayList

  for (int i = 0 ; i < 20; i++) {
    myWorms.add(new Worm()) ;   
  }
}


void draw() {
  
  switch(myState) {
    
    case 0: 
    background(100) ;
    textAlign(CENTER);
    fill(#FFF300); 
    textSize(20);
    text("Welcome to" , 250, 100) ;
    fill(#2C5BFF);
    textSize(75);
    text("EARLY BIRD", 250, 225); 
    fill(#FFF300);
    textSize(20);
    text("click the mouse to start!", 250, 300);
    break ; 
    
    
  case 1:
// ***** STATE 1 - PLAYING THE GAME *****

  background(#0EC40C) ; 

// moves my Worms and tests the distance to the frog
  for (int i = 0 ; i < myWorms.size() ; i++) {
    Worm Worm = (Worm) myWorms.get(i) ;
    Worm.display() ;
    Worm.drive() ;
 
 //   PVector frogLoc = new PVector(frogX, frogY) ; 
    float d = (Worm.loc).dist(birdPos) ;
    
    if (d < 50) {
 //     println("BOOM!!!" ) ; 
      Worm.alive = false ;  // mark this Worm for deletion 
      // myState = 2 ; 
    }
    
  }
  
  
  
   for (int i = 0 ; i < myWorms.size() ; i++) {
    Worm Worm = (Worm) myWorms.get(i) ;
    
    // check if Worm is alive
    if (Worm.alive == false){
      myWorms.remove(i) ;
      deathCounter++ ; 
    }
    
   } 
  
  // check to see how many Worms we have
  if (myWorms.size() == 0) {
    myState = 2 ;
  }
  
  // update Frog's position
  birdPos.x = mouseX ;
  birdPos.y = mouseY ;
  
  // draw my Frog
  fill(#FFF300);
  ellipse(birdPos.x, birdPos.y - 10, 10, 40);
  ellipse(birdPos.x - 5, birdPos.y + 13, 5, 15);
  ellipse(birdPos.x + 5, birdPos.y + 13, 5, 15);
  fill(#2C5BFF) ;
  ellipse(birdPos.x -15, birdPos.y, 5, 15);
  ellipse(birdPos.x -20, birdPos.y, 5, 14);
  ellipse(birdPos.x -25, birdPos.y, 5, 13);
  ellipse(birdPos.x -30, birdPos.y, 5, 12);
  ellipse(birdPos.x -35, birdPos.y, 5, 11);
  ellipse(birdPos.x -40, birdPos.y, 5, 10);
  ellipse(birdPos.x + 15, birdPos.y, 5, 15);
  ellipse(birdPos.x + 20 , birdPos.y, 5, 14);
  ellipse(birdPos.x + 25, birdPos.y, 5, 13);
  ellipse(birdPos.x + 30, birdPos.y, 5, 12);
  ellipse(birdPos.x +35, birdPos.y, 5, 11);
  ellipse(birdPos.x +40, birdPos.y, 5, 10);
  ellipse(birdPos.x + 15, birdPos.y - 5, 50, 10);
  ellipse(birdPos.x - 15, birdPos.y - 5, 50, 10);
  ellipse(birdPos.x, birdPos.y, 20, 35) ;
  ellipse(birdPos.x, birdPos.y - 17, 15, 15); 
  
  
  // draw the count of dead stuff
  fill(255, 0, 0) ; 
  textSize(60) ; 
  text(deathCounter, 80, 150) ;
  
// ***** END OF STATE 1 - PLAYING THE GAME *****  
  break ; 
  
  
  case 2:
  background(100) ;
  fill(#2C5BFF);
  textSize(50); 
  textAlign(CENTER);
  text("Thanks for Playing!", 250, 250) ;
  fill(#FFF300);
  textSize(20);
  text("Click to play again!", 250, 400);

  // deathCounter = 0 ;
  break ; 
  
  }
  
}  // END OF DRAW ROUTINE


void mousePressed() {
  if (myState == 0) {
    myState = 1 ; 
  }
  
  if (myState == 2) {
     // reset the amount of Worms
   for (int i = 0 ; i < 20; i++) {
    myWorms.add(new Worm()) ;   
  }
    
    myState = 0 ;
  }
  
}


void keyPressed() {
//  println("key pressed = " + keyCode) ;
 
 if (keyCode == 39) {  // right
  birdPos.x = birdPos.x + 20 ;
 }

 if (keyCode == 37) {  // left
   birdPos.x = birdPos.x - 20 ;
 }
 
  if (keyCode == 38) {  // up
  birdPos.y = birdPos.y - 20 ;
 }

 if (keyCode == 40) {  // down
   birdPos.y = birdPos.y + 20 ;
 }
 
}

class Worm {
  
  // attributes
  PVector loc ; 
  PVector vel ;
  color myColor ;
  boolean alive ;

  
  // constructor
  Worm() {
    loc = new PVector(random(width), random(height)) ;
    vel = new PVector(random(1,5), 0) ;
      
    myColor = color(#B24A4A) ; 
    alive = true ; 
  }
  
  
  // methods
  void display() {
    fill(myColor) ; 
    ellipse(loc.x, loc.y, 5, 5) ;
    ellipse(loc.x, loc.y + 3, 5, 5); 
    ellipse(loc.x + 2, loc.y + 5, 5, 5);
    ellipse(loc.x + 4, loc.y + 5, 5, 5);
    ellipse(loc.x + 6, loc.y +7, 5, 5);
    ellipse(loc.x +8, loc.y +5, 5, 5);
    ellipse(loc.x +10, loc.y +3, 5, 5);
    ellipse(loc.x +12, loc.y +1, 5, 5);
    ellipse(loc.x +14, loc.y +3, 5, 5);
    ellipse(loc.x +16, loc.y +5, 5, 5);
// text(v, x, y-10) ; 
  }
  
  void drive() {
    loc.add(vel) ;
    
    if (loc.x > width) {
      loc.x = 0 ;
    }
    
  }
  
  
}


