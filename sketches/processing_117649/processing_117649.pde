
/* @pjs font="Parisienne-Regular.ttf"; */

int myState = 0 ; 
int myCounter = 100 ; 
PImage cookie1 ;
PImage cookie2 ;
PImage cookie3 ;
PImage cookie4 ;
PImage cookie5 ;
PImage cookie6 ;
PFont type;

void setup() {
  size(600, 800) ;
   cookie1 = loadImage("cookie1.jpg") ;
   cookie2 = loadImage("cookie2.jpg") ;
   cookie3 = loadImage("cookie3.jpg") ;
   cookie4 = loadImage("cookie4.jpg") ;
   cookie5 = loadImage("cookie5.jpg") ;
   cookie6 = loadImage("cookie6.jpg") ;
   type = createFont("Parisienne-Regular.ttf") ;
   textFont (type, 48) ;
  
}


void draw() {

  myCounter-- ;  

  switch(myState) {

  case 0:   
    image(cookie1, 0, 0, 600, 800) ;
    
    if (myCounter < 0) {  // go to the next state
      myCounter = 50 ; // case 1 will have 50 counts
      myState = 1 ;   // 
    }
    break ;

  case 1:
     image(cookie2, 0, 0, 600, 800) ; 
    if (myCounter < 0) {  
      myCounter = 50 ; 
      myState = 2 ;  
    }
    break ;

  case 2: 
     image(cookie3, 0, 0, 600, 800) ; 
    if (myCounter < 0) {  
      myCounter = 50 ; 
      myState = 3 ;  
    }
    break ;

  case 3: 
     image(cookie4, 0, 0, 600, 800) ; 
    if (myCounter < 0) {  
      myCounter = 50 ; 
      myState = 4 ;  
    }
    break ;

  case 4: 
      image(cookie5, 0, 0, 600, 800) ; 
    if (myCounter < 0) {  
      myCounter = 50 ; 
      myState = 5 ;  
    }
    break ;
    
   case 5: 
       image(cookie6, 0, 0, 600, 800) ;
       text("The End", 300, 500) ; 
    if (myCounter < 0) {  
      myCounter = 50 ; 
      myState = 0 ; 
    }
    break ;
    
      
  }
}



