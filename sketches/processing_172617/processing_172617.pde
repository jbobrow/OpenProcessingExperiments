
/* @pjs preload= "case0.png", "case1.png", "case2.png", "case3.png", "case4.png",
 "case40.png", "case41.png", "case42.png", "case43.png", "case44.png", 
 "case45.png", "case46.png", "case47.png", "case51.png", "case52.png", "case53.png",
 "case54.png", "case55.png", "case56.png", "case57.png", "case58.png", "case59.png",
 "case599.png", "case60.png", "case61.png" */

int myState = 0 ;
int x = 0 ;
PImage[] pics = new PImage[20];
PImage start ;
PImage case1 ;
PImage case2 ;
PImage case3 ;

void setup() {
  frameRate(10) ;
  size(500, 500) ;
  start = loadImage("case0.png") ;
  case1 = loadImage("case1.png") ;
  case2 = loadImage("case2.png") ;
  case3 = loadImage("case3.png") ;

//case4
  pics[0] = loadImage("case4.png") ;
  pics[1] = loadImage("case40.png") ;
  pics[2] = loadImage("case41.png") ;
  pics[3] = loadImage("case42.png") ;
  pics[4] = loadImage("case43.png") ;
  pics[5] = loadImage("case44.png") ;
  pics[6] = loadImage("case45.png") ;
  pics[7] = loadImage("case46.png") ;
  pics[8] = loadImage("case47.png") ;
  
  //case5
  pics[9] = loadImage("case51.png") ;
  pics[10] = loadImage("case52.png") ;
  pics[11] = loadImage("case53.png") ;
  pics[12] = loadImage("case54.png") ;
  pics[13] = loadImage("case55.png") ;
  pics[14] = loadImage("case56.png") ;
  pics[15] = loadImage("case57.png") ;
  pics[16] = loadImage("case58.png") ;
  pics[17] = loadImage("case59.png") ;

  //end
  pics[18] = loadImage("case599.png") ;
  pics[19] = loadImage("case60.png") ;
}

void draw() {
  switch(myState) {

  case 0:
    image(start, 0, 0, width, height) ;
    break ;


  case 1:
    image(case1, 0, 0, width, height) ;
    break ; 


  case 2:
    image(case2, 0, 0, width, height) ;
    break ;

  case 3:
    image(case3, 0, 0, width, height) ;
    break;

  case 4:
    background(255) ; 
    image(pics[x], 0, 0) ;
    x++ ;
    if (x > 8) {
      x = 0 ;
    }
    break;
    
  case 5:
background(255) ; 
    image(pics[x], 0, 0) ;
    x++ ;
    if (x > 17) {
      x = 9 ;
    }
  break;
  case 6: 
  background(255) ; 
    image(pics[x], 0, 0) ;
    x++ ;
    if (x > 19) {
      x = 18 ;
    }
    break;
  }
}

void mousePressed() {
  myState = (myState + 1 ) % 5 ;
}



