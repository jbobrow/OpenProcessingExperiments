
PFont Perpetua ;
PImage logoblue ;
PImage logogreen ;
PImage keyboards ;
PImage mixer ;
PImage Nak ;
PImage R8_1 ;
PImage R8_2 ;
PImage studio1 ;
PImage studio2 ;
PImage studio3 ;
PImage Ken_CD ;
PImage KIND_CD ;
PImage Mom_Family_DVD ;
PImage Mom_Family_insert ;
PImage Taylor_Family_DVD ;
PImage Taylor_Family_insert ;
int myState = 0 ;
int myCounter = 200 ;

void setup() {
  size(600, 600) ;
  smooth() ;

// data folder resources //
logoblue = loadImage ("logoblue.jpg") ;
logogreen = loadImage ("logogreen.jpg") ;
keyboards = loadImage ("keyboards.jpg") ;
mixer = loadImage ("mixer.jpg") ;
Nak = loadImage ("Nak.jpg") ;
R8_1 = loadImage ("R8_1.jpg") ;
R8_2 = loadImage ("R8_2.jpg") ;
studio1 = loadImage ("studio1.jpg") ;
studio2 = loadImage ("studio2.jpg") ;
studio3 = loadImage ("studio3.jpg") ;
Ken_CD = loadImage ("Ken Huggins_CD_2.jpg") ;
KIND_CD = loadImage ("KIND_CD.jpg") ;
Mom_Family_DVD = loadImage ("MomAndFamily1994_DVD.jpg") ;
Mom_Family_insert = loadImage ("MomAndFamily1994_insert.jpg") ;
Taylor_Family_DVD = loadImage ("TaylorAndFamily'97,'00,'01_DVD.jpg") ;
Taylor_Family_insert = loadImage ("TaylorAnd Family'97,'00,'01_insert.jpg") ;

Perpetua = loadFont ("Perpetua-Bold-48.vlw") ;

}

void draw() {
  background(100) ;
  
  myCounter = myCounter - 1 ;
  
  switch(myState) {
    case 0:
    textFont (Perpetua, 50) ;
    text("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 1 ;
    }
    break ;
    
    case 1:
    image (logogreen, 200, 100, 200, 200) ;
    textFont (Perpetua, 50) ;
    text("Holtz Media Solutions", 55, 55) ;
    text ("Analog Archiving to Digital", 0, 375) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 2 ;
    }
    break ;
    
    case 2:
    image (studio1, 170, 100, 250, 165) ;
    textFont (Perpetua, 50) ;
    text("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 3 ;
    }
    break ;
    
    case 3:
    image (studio1, 170, 100, 250, 165) ;
    image (studio2, 25, 300, 250, 165) ;
    textFont (Perpetua, 50) ; 
    text("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 4 ;
    }
    break ;
   
    case 4:
    image (studio1, 170, 100, 250, 165) ;
    image (studio2, 25, 300, 250, 165) ;
    image (studio3, 320, 300, 250, 165) ;
    textFont (Perpetua, 50) ;
    text ("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 5 ;
    }
    break ;
    
    case 5:
    image (R8_1, 25, 100, 250, 165) ;
    textFont (Perpetua, 50) ;
    text("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 6 ;
    }
    break ;
    
    case 6:    
    image (R8_1, 25, 100, 250, 165) ;
    image (R8_2, 320, 300, 250, 165) ;
    textFont (Perpetua, 50) ;
    text ("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 7 ;
    }
    break ;
    
    case 7:    
    image (keyboards, 25, 100, 250, 165);
    image (mixer, 320, 300, 250, 165) ;
    textFont (Perpetua, 50) ;
    text ("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400;
      myState = 8 ;
    }
    break ;
    
    case 8:
    image (Mom_Family_insert, 100, 100, 400, 251) ;
    image (Mom_Family_DVD, 200, 380, 200, 200) ;
    textFont (Perpetua, 50) ;
    text ("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400 ;
      myState = 9 ;
    }
    break ;
    
    case 9:
    image (Taylor_Family_DVD, 200, 380, 200, 200) ;
    image (Taylor_Family_insert, 100, 100, 400, 251) ;
    textFont (Perpetua, 50) ;
    text ("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400 ;
      myState = 10 ;
    }
    break ;
    case 10:
    image (Ken_CD, 130, 110, 350, 315) ;
    textFont (Perpetua, 50) ;
    text ("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400 ;
      myState = 11 ;
    }
    break ;
    
    case 11:
    image (KIND_CD, 50, 190, 500, 225) ;
    textFont (Perpetua, 50) ;
    text ("Holtz Media Solutions", 55, 55) ;
    if (myCounter < 0) {
      myCounter = 400 ;
      myState = 0 ;
    }
    
    
     
 }

}

 //void mousePressed() {
  //println("clicked mouse!") ;
  //myState = myState + 1 ;
 
 // NEED IF STATEMENT HERE
  //if(myState > 10) {
   //myState = 0 ;
 // }
 
//}




