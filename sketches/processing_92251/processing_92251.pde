
/* @pjs font = "WendyOne-Regular.ttf" ; */


int myState = 0 ;
PFont myFont ;



int myCtr ;


void setup() {
  size(500, 500) ;
  frameRate(24) ;
  myFont = createFont ("WendyOne-Regular.ttf") ;
  
  myCtr = 3*24 ; 
}

void draw() {
  
  
  switch(myState) {
    
    case 0:
    background (#DB2828) ;   
    textFont(myFont, 80) ;
    textAlign(CENTER, CENTER) ;
    text("The Never", width/2, height/2) ;  
    
    myCtr-- ; 
    if (myCtr < 0) {
      myState = 1 ;
      myCtr = 1*24 ;
   }
    
    break ;
  
    case 1:
    background (#2AFA03) ;
    textFont(myFont, 80) ;
    textAlign(CENTER, CENTER) ;
    text("Ending Poem", width/2, height/2) ;
    
    myCtr-- ; 
    if (myCtr < 1) {
      myState = 2 ;
      myCtr = 1*24 ;
    
    }
    
    break ;
    
    case 2:
     background (#FAEE0A) ;
    textFont(myFont, 20) ;
    fill(#210202) ;
    textAlign(CENTER, CENTER) ;
    text("You are locked in a never-ending poem;", width/2, height/2) ;
    
       myCtr-- ; 
    if (myCtr < 0) {
      myState = 3 ;
      myCtr = 2*24 ;
    
    }
    
    
    break ;
    
      case 3:
     background (#0E22EA) ;
    textFont(myFont, 20) ;
    fill(#210202) ;
    textAlign(CENTER, CENTER) ;
    text("Now take a breath before line three,", 325, 200) ;
    
       myCtr-- ; 
    if (myCtr < 0) {
      myState = 4 ;
      myCtr = 2*24 ;
    
    }
    
     break ;
    
      case 4:
     background (#ED75E5) ;
    textFont(myFont, 20) ;
    fill(#210202) ;
    textAlign(CENTER, CENTER) ;
    text("And please continue from line one.", 200, 200) ;
    
       myCtr-- ; 
    if (myCtr < 0) {
      myState = 2 ;
      myCtr = 2*24 ;
    
    }
      
    default:
    println("Copyright © Mark R Slaughter 2009 ") ;
    break ;
  
  } 
}


