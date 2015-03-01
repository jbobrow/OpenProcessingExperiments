
/* @pjs font="FontdinerSwanky.ttf"; */

int myState = 0 ;
int maxCounter = 5 * 60 ;
int counter = maxCounter ; 

PImage first ;
PImage second ; 
PImage third ;
PImage forth ;
PImage fifth ;
PImage sixth ; 

PFont cute ;

void setup() {
  size(500, 500) ;

  cute = createFont ("FontdinerSwanky.ttf", 120) ; 

  first = loadImage ("3.jpg") ; 
  second = loadImage ("6.jpg") ;
  third = loadImage ("4.jpg") ;
  forth = loadImage ("5.jpg") ;
  fifth = loadImage ("2.jpg") ;
  sixth = loadImage ("1.jpg") ;
}

void draw() {

  switch(myState) {
  case 0: 
    background (255, 0, 0) ; 
    fill (0) ; 
    image (first, 0, 0) ;
    textFont (cute, 70) ;
    text ("All About", 75, 75) ;
    text ("Dogs!", 145, 150) ;
    break ; 

  case 1: 
    background(0, 255, 0) ;
    image (second, 0, 0) ;
    textFont (cute, 50) ;
    text ("Petting your Dog", 20, 80) ;
    text ("can lower your", 50, 160) ;
    text ("blood pressure!", 40, 240) ;
    break ;

  case 2: 
    background(0, 0, 255) ;
    image (third, 0, 0) ;
    textFont (cute, 45) ;
    text ("Corgi is Welsh for", 30, 70) ;
    text ("Dwarf Dog.", 120, 150) ; 
    break ;

  case 3:
    background(100) ; 
    image (forth, 0, 0) ;
    textFont (cute, 45) ;
    text ("Basenjis", 275, 150) ;
    text ("can't bark,", 235, 240) ;
    text ("they yodel.", 220, 330) ;
    break ;

  case 4: 
    background(255) ; 
    image (fifth, 0, 0) ;
    textFont (cute, 40) ;
    text ("A dogs' sense of smell", 15, 70) ;
    text ("is 10,000 times", 90, 160) ;
    text ("stronger than humans'.", 10, 250) ;
    break ;

  case 5: 
    background(255) ; 
    image (sixth, 0, 0) ;
    textFont (cute, 40) ;
    text ("And dogs have", 20, 80) ;
    text ("18 muscles", 60, 170) ;
    text ("in each ear!", 100, 260) ;
    break ;
  }

  counter-- ; /* counter */

  if (counter <0) {
    counter = maxCounter ;
    myState = myState + 1 ; 
    if (myState > 5) {
      myState = 0 ;
    }
  }
}



