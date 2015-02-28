
/* @pjs font="Belleza-Regular.ttf"; */

PFont myFont;
int myState = 0 ;
int myCounter = 70 ;
int myCounter2 = 10 ;

void setup() {
  size(900, 650);
  myFont= createFont("Belleza-Regular.ttf", 120);
}

void draw() {

  myCounter = myCounter -1 ; //myCounter--


  background(#000000) ;
  textFont(myFont);
  switch(myState) {

  case 0:
    fill(#FFFFFF);
    textSize(300);
    text("3", 400, 400);
    if (myCounter < 0) { //go to the next state
      myCounter = 70 ; // case 1 will have 300 counts
      myState = 1 ;
    }

    break ;

  case 1:
    fill(#CECCCC);
    textSize(300);
    text("2", 400, 400);
    if (myCounter < 0) { //go to the next state
      myCounter = 70 ; // case 1 will have 300 counts
      myState = 2 ; //change state
    }
    break ;

  case 2:
    fill(#838383);
    textSize(300);
    text("1", 400, 400);
    if (myCounter < 0) { //go to the next state
      myCounter = 10 ; // case 1 will have 300 counts
      myState = 3 ;
    }
    break ;

  case 3:
    background(#FF0303);
    fill(#FFFFFF);
    textSize(235);
    text("DANCE!", 10, 360);
    if (myCounter < 0) { //go to the next state
      myCounter = 10 ; // case 1 will have 300 counts
      myState = 4 ;
    }
    break ;

  case 4:
    background(#FFE200);
    fill(#FFFFFF);
    textSize(235);
    text("DANCE!", 10, 360);
    if (myCounter < 0) { //go to the next state
      myCounter = 10 ; // case 1 will have 300 counts
      myState = 5 ;
    }
    break ;

  case 5:
    background(#14FF00);
    fill(#FFFFFF);
    textSize(235);
    text("DANCE!", 10, 360);
    if (myCounter < 0) { //go to the next state
      myCounter = 10 ; // case 1 will have 300 counts
      myState = 6 ;
    }
    break ;

  case 6:
    background(#00F4FF);
    fill(#FFFFFF);
    textSize(235);
    text("DANCE!", 10, 360);
    if (myCounter < 0) { //go to the next state
      myCounter = 10 ; // case 1 will have 300 counts
      myState = 7 ;
    }
    break ;

  case 7:
    background(#FF00EF);
    fill(#FFFFFF);
    textSize(235);
    text("DANCE!", 10, 360);
    if (myCounter < 0) { //go to the next state
      myCounter = 10 ; // case 1 will have 300 counts
      myState = 8 ;
    }
    break ;

  case 8:
    background(#000000);

    if (myCounter < 0) { //go to the next state
      myCounter = 70 ; // case 1 will have 300 counts
      myState = 0 ;
    }
    break ;
  }
}



