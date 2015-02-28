


int myState = 0 ;
int myCounter = 0;

void setup(){
  size(500,500);
  
  
}
   void draw(){
     
  myCounter-- ; 

  background(#000000) ; 

  switch(myState) {

  case 0:   
  stroke(#FFFFFF);
   fill(#FF0000);
    ellipse(250, 250, 300, 300) ; 
   triangle(250, 125, 125, 325, 375, 325);
   rect(245, 200, 10, 100);
   rect(225, 260, 50, 10);

    if (myCounter < 0) {  // go to the next state
      myCounter = 5 ; // case 1 will have 300 counts
      myState = 1 ;
    }
    break ;

  case 1: 
  fill(#FF7112);
    ellipse(250, 250, 325, 325) ; 
    if (myCounter < 0) {  // go to the next state
      myCounter = 5 ; // case 2 will have 300 counts
      myState = 2 ;  // the next state will be 2
    }
    break ;

  case 2: 
   fill(#FFF81A);
    ellipse(250, 250, 350, 350) ; 
    if (myCounter < 0) {  // go to the next state
      myCounter = 5 ; // case 3 will have 50 counts
      myState = 3 ;  // the next state will be 3
    }
    break ;

  case 3: 
     fill(#0CF028);
    ellipse(250, 250, 375, 375) ; 
      if (myCounter < 0) {  // go to the next state
      myCounter = 5 ; // case 3 will have 50 counts
      myState = 4 ;  // the next state will be 3
      }
    break ;

  case 4: 
       fill(#1781FF);
    ellipse(250, 250, 400, 400) ; 
     if (myCounter < 0) {  // go to the next state
      myCounter = 5 ; // case 3 will have 50 counts
      myState = 5 ;  // the next state will be 3
     }
    break ;
    
 case 5:
        fill(#BC32D8);

    ellipse(250, 250, 425, 425) ; 
     if (myCounter < 0) {  // go to the next state
      myCounter = 5 ; // case 3 will have 50 counts
      myState = 0 ;  // the next state will be 3
     }
    break ;
    
  }
}

     


