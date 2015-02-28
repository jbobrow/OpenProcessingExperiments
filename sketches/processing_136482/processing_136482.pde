
PImage ring1 ;
PImage ring2 ;
PImage ring3 ;
PImage ring4 ;
PImage ring5 ;
PImage ring6 ;
PImage ring7 ;
PImage ring8 ;
PImage ring9 ;
PImage ring10 ;
int myState = 0 ;
int myCounter = 70 ;


void setup() {
  size(500,500) ;
  background(#000000) ;
  ring1 = loadImage("ring1.png") ;
  ring2 = loadImage("ring2.png") ;
  ring3 = loadImage("ring3.png") ;
  ring4 = loadImage("ring4.png") ;
  ring5 = loadImage("ring5.png") ;
  ring6 = loadImage("ring6.png") ;
  ring7 = loadImage("ring7.png") ;
  ring8 = loadImage("ring8.png") ;
  ring9 = loadImage("ring9.png") ;
  ring10 = loadImage("ring10.png") ;
}

void draw() {
 myCounter = myCounter - 1 ;
 background(#000000) ;
 println(mouseX +","+mouseY);
 switch(myState) {
   

  
  case 0: 
      image(ring1,0, 0) ;
   if (myCounter < 0) { 
      myCounter = 10 ;
      myState = 1 ; 
    }

  break ;
  
case 1:
    image(ring1,0, 0) ;
    image(ring2,0, 0) ;
   if (myCounter < 0) { 
      myCounter = 10 ; 
      myState = 2 ; 
    }
    
    break ;
 
case 2:
   image(ring1,0, 0) ;
   image(ring2,0, 0) ;
   image(ring3, 0, 0) ;
   if (myCounter < 0) { 
      myCounter = 10 ; 
      myState = 3 ;
    }
break ;

case 3:
   image(ring1,0, 0) ;
   image(ring2,0, 0) ;
   image(ring3, 0, 0) ;
   image(ring4, 0, 0) ;
    if (myCounter < 0) { 
      myCounter = 10 ;
      myState = 4 ;
    }
    break;
case 4:
   image(ring1,0, 0) ;
   image(ring2,0, 0) ;
   image(ring3, 0, 0) ;
   image(ring4, 0, 0) ;
   image(ring5, 0, 0) ;
    if (myCounter < 0) { 
      myCounter = 10 ; 
      myState = 5 ;
    }
    break ;
    
case 5:
   image(ring1,0, 0) ;
   image(ring2,0, 0) ;
   image(ring3, 0, 0) ;
   image(ring4, 0, 0) ;
   image(ring5, 0, 0) ;
   image(ring6, 0, 0) ;
     if (myCounter < 0) { 
      myCounter = 10 ; 
      myState = 6 ;
    }
    break ;
    
case 6:
   image(ring1,0, 0) ;
   image(ring2,0, 0) ;
   image(ring3, 0, 0) ;
   image(ring4, 0, 0) ;
   image(ring5, 0, 0) ;
   image(ring6, 0, 0) ;
   image(ring7, 0, 0) ;
     if (myCounter < 0) { 
      myCounter = 10 ; 
      myState = 7 ;
    }
    break ;
    
    case 7:
   image(ring1,0, 0) ;
   image(ring2,0, 0) ;
   image(ring3, 0, 0) ;
   image(ring4, 0, 0) ;
   image(ring5, 0, 0) ;
   image(ring6, 0, 0) ;
   image(ring7, 0, 0) ;
   image(ring8, 0, 0) ;
   if (myCounter < 0) { 
   myCounter = 10 ; 
   myState = 8 ;
    }
    break ;
    
    case 8:
   image(ring1,0, 0) ;
   image(ring2,0, 0) ;
   image(ring3, 0, 0) ;
   image(ring4, 0, 0) ;
   image(ring5, 0, 0) ;
   image(ring6, 0, 0) ;
   image(ring7, 0, 0) ;
   image(ring8, 0, 0) ;
   image(ring9, 0, 0) ;
   if (myCounter < 0) { 
   myCounter = 10 ; 
   myState = 9 ;
    }
    break ;
 
    case 9:
   image(ring1,0, 0) ;
   image(ring2,0, 0) ;
   image(ring3, 0, 0) ;
   image(ring4, 0, 0) ;
   image(ring5, 0, 0) ;
   image(ring6, 0, 0) ;
   image(ring7, 0, 0) ;
   image(ring8, 0, 0) ;
   image(ring9, 0, 0) ;
   image(ring10, 0, 0) ;
   if (myCounter < 0) { 
   myCounter = 10 ; 
   myState = 0 ;
    }
    break ;
 
}
}

  
  
 





