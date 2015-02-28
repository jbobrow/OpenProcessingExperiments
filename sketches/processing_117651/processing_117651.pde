
/* @pjs font="BigelowRules-Regular.ttf"; */


int myState = 0 ;
color myRandomC ; 
PImage icescream ;
PImage cemetary ;
PImage witch ;
PFont type ;

void setup() {
 
  size(700, 600) ; 
  icescream = loadImage("icescream.jpg") ;
  cemetary = loadImage("cemetary.jpg") ;
  witch = loadImage("witch.jpg") ;
  type = createFont("BigelowRules-Regular.ttf") ;
  textFont (type, 72) ;

}


void draw() {
 
  
  switch(myState) {
    case 0:
    background(#FF5A08) ; 
    text("What does a ghost eat for dessert?", 50, 200) ; 
    text("Click to find out!", 200, 500) ;
    break ;
    
    case 1:
    image(icescream, 0, 0, 700, 600) ;
    text("ICE SCREAM!", 400, 70) ;
    fill (#0D0A08) ;
    break ;
    
    case 2:
    background(#FF5A08) ;
    text("Why are there fences", 180, 150) ;
    text("around cemetaries?", 200, 230); 
    fill (#FCFCFC) ;
    text("Click fo find out!", 200, 500) ;
    break ;
    
    case 3:
    image(cemetary, 0, 0, 700, 600) ;
    text("Because people are dying", 10, 100) ;
    text("to get in!", 40, 150) ;
    fill (#0D0A08) ;
    break ;
    
    case 4:
    background(#FF5A08) ;
    text("What do you call a witch at the beach?" , 20 , 200) ;
    text("Click fo find out!", 200, 500) ;
    break ;
    
    case 5:
    image(witch, 0, 0, 700, 600) ;
    text("A Sand-Witch!", 400, 100) ;
    fill (#0D0A08) ;
    break ;
    
  }
  
}

void mousePressed() {
  
  myState = myState + 1 ;
  if (myState > 5) {
    myState = 0 ;
  }
}


