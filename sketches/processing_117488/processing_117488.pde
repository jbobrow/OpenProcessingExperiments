
/* @pjs font="WireOne.ttf"; */

int myState = 0 ; 
int myCounter = 100 ; 
PFont wire;
PImage logo0;
PImage logo1;
PImage logo2;
PImage logo3;
PImage logo4;

void setup() {
  size(500, 500) ;
  wire=createFont("WireOne.ttf", 50);
  textFont(wire);
  logo0=loadImage("logo0.png");
  logo1=loadImage("logo1.png");
  logo2=loadImage("logo2.png");
  logo3=loadImage("logo3.png");
  logo4=loadImage("logo5.png");
}


void draw() {

  myCounter-- ; 

  background(0) ; 

  switch(myState) {
    
    case 0: 
      image(logo0, 0, 0);
      if (myCounter < 0) {  // go to the next state
        myCounter = 50 ; // case 1 will have 50 counts
        myState = 1 ; //the next state will be 1
      }
      fill(#3BB2B7);
      text("Watch the neon sign light up", 80, 250); 
      break ;
      
    case 1:
      fill(0);  
      image(logo1, 0, 0);
      if (myCounter < 0) {  // go to the next state
        myCounter = 50 ; // case 2 will have 50 counts
        myState = 2 ; //the next state will be 2
      }
      break ;

    case 2:  
      image(logo2, 0, 0);
      if (myCounter < 0) {  // go to the next state
        myCounter = 50 ; // case 3 will have 50 counts
        myState = 3 ;  // the next state will be 3
      }
      break ;

    case 3: 
      image(logo2, 0, 0);
      if (myCounter < 0) {  // go to the next state
        myCounter = 50 ; // case 4 will have 50 counts
        myState = 4 ;  // the next state will be 4
      }
      break ;

    case 4: 
      image(logo3, 0, 0);
      if (myCounter < 0) {  // go to the next state
        myCounter = 50 ; // case 5 will have 50 counts
        myState = 5 ;  // the next state will be 5
      }
      break ;

    case 5: 
      image(logo4, 0, 0);
      if (myCounter < 0) {  // go to the next state
        myCounter = 50 ; // case 0 will have 50 counts
        myState = 0 ;  // the next state will be 0
      } 
      break ;
    }
}



