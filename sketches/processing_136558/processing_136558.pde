
/* @pjs preload="angry.jpg, familytime1.jpg, aoas.jpg, sarahmc.jpg, gears.jpg"; */

int myState = 0 ;
PImage angry ;
PImage familytime1 ;
PImage aoas ;
PImage sarahmc ;
PImage gears ;

void setup () {
  size(500, 400) ;
  angry = loadImage("angry.jpg") ;
  familytime1 = loadImage("familytime1.jpg") ;
  aoas = loadImage("aoas.jpg") ;
  sarahmc = loadImage("sarahmc.jpg") ;
  gears = loadImage("gears.jpg") ;
}

void draw() {
  switch(myState) {
    
    case 0:
    background(#1412DE) ;
    image(angry, 0, 41) ;
    text("Don't you just hate...", 10, 20) ;
    break ;
    
    case 1:
    background(0) ;
    image(familytime1, 0, 22) ;
    text("...when you're just watching TV...", 50, 380) ;
    break ;
    
    case 2:
    background(0) ;
    image(aoas, 0, 0) ;
    text("...and then all of a sudden...", 10, 10) ;
    break ;
    
    case 3:
    background(0) ;
    image(sarahmc, 80, 60) ;
    break ;
    
    case 4:
    background(0) ;
    image(gears, 0, 21) ;
    text("And that's what really grinds my gears.", 10, 10) ;
    break ;
  
 }
}

void mousePressed() {
  myState = myState + 1 ;
  if (myState > 4)
  myState = 0 ;
}


