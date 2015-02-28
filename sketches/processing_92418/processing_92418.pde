
/* @pjs font="Sanchez-Regular.ttf"; */

int myState = 0 ;

PFont myFont ;

void setup() {
size (500,500);
frameRate (24);
 myFont = createFont("Sanchez-Regular.ttf", 35);

myCtr = 5*frameRate ;
}

void draw () {
  
  switch(myState) {
  
  case 0:
  println("Wait for the tree to grow") ;
  background (0, 200, 255) ;
  textFont(myFont, 40) ;
  fill(#662200);
  rect(94, 400, 10, 10);
  fill(#33CC33) ;
  triangle(100, 350, 75, 400, 125, 400) ;
  text ("Spring:", 3*width/5, height/10) ;
  text ("You must", 3*width/5, 2*height/10) ;
  text ("wait for", 3*width/5, 3*height/10) ;
  text ("the tree", 3*width/5, 4*height/10) ;
  text ("to grow", 3*width/5, 5*height/10) ;
  myCtr-- ;
  if (myCtr < 0) {
    myState = 1 ;
    myCtr = 10*24 ;
  }
  
  break ;
  
  
  case 1:
  println("Wait for the tree to grow") ;
  background (0, 150, 255) ;
  textFont(myFont, 35) ;
  fill(#662200);
  rect(92, 400, 16, 15);
  fill(#339933) ;  
  triangle(100, 250, 60, 400, 140, 400) ;
  triangle(100, 215, 75, 315, 125, 315) ;
  //triangle(100, 350, 75, 400, 125, 400) ;
  text ("Summer:", 3*width/5, height/10) ;
  text ("You must", 3*width/5, 2*height/10) ;
  text ("wait for", 3*width/5, 3*height/10) ;
  text ("the tree", 3*width/5, 4*height/10) ;
  text ("to grow", 3*width/5, 5*height/10) ;
  myCtr-- ;
  if (myCtr < 0) {
    myState = 2 ;
    myCtr = 10*24 ;
  }
  
  break ;
  
  case 2:
  println("Wait for the tree to grow") ;
  background (0, 100, 255) ;
  textFont(myFont, 35) ;
  fill(#662200);
  rect(90, 400, 20, 15);
  fill(#336633) ;
  triangle(100, 200, 35, 400, 165, 400) ;
  triangle(100, 175, 50, 315, 150, 315) ;
  triangle(100, 150, 70, 230, 130, 230) ;
  //triangle(100, 215, 75, 315, 125, 315) ;
  //triangle(100, 350, 75, 400, 125, 400) ;
  text ("Fall:", 3*width/5, height/10) ;
  text ("You must", 3*width/5, 2*height/10) ;
  text ("wait for", 3*width/5, 3*height/10) ;
  text ("the tree", 3*width/5, 4*height/10) ;
  text ("to grow", 3*width/5, 5*height/10) ;
  myCtr-- ;
  if (myCtr < 0) {
    myState = 3 ;
    myCtr = 10*24 ;
  }
  
  break ;


 case 3:
  background (200) ;
  textFont(myFont, 35) ;
  fill(#662200);
  rect(85, 400, 30, 20);
  fill(#336633) ;
  triangle(100, 200, 20, 400, 180, 400) ;
  triangle(100, 175, 35, 315, 165, 315) ;
  triangle(100, 125, 55, 250, 145, 250) ;
  triangle(100, 90, 70, 180, 130, 180) ;
  //triangle(100, 215, 75, 315, 125, 315) ;
  //triangle(100, 350, 75, 400, 125, 400) ;
  text ("With X", 3*width/5, 1*height/10) ;
  text ("Now", 3*width/5, 2*height/10) ;
  text ("you may", 3*width/5, 3*height/10) ;
  text ("cut the", 3*width/5, 4*height/10) ;
  text ("tree down", 3*width/5, 5*height/10) ;
  myCtr-- ;
  if (myCtr < 0) {
    myState = 3 ;
    myCtr = 10*24 ;
  }
  
  break ;
  
 
  
  

  break ;
  
  case 5:
  println("I'm in state 2") ;
  background (45, 0, 200) ;
  textFont(myFont, 100) ;
  textAlign(CENTER, CENTER) ;
  text ("state 2", width/2, height/2) ;
  break ;

}
  
  
}


void keyPressed() {
  println(key) ;
  
  switch(key) {
  case 'x':
  case 4:
  background (200) ;
  textFont(myFont, 35) ;
  fill(#662200);
  rect(85, 400, 30, 20);
  fill(#336633) ;
  text ("With X", 3*width/5, 1*height/10) ;
  text ("Now", 3*width/5, 2*height/10) ;
  text ("you may", 3*width/5, 3*height/10) ;
  text ("cut the", 3*width/5, 4*height/10) ;
  text ("tree down", 3*width/5, 5*height/10) ;
  translate(510, 310);  
  rotate(radians(+90));
  triangle(100, 200, 20, 400, 180, 400) ;
  triangle(100, 175, 35, 315, 165, 315) ;
  triangle(100, 125, 55, 250, 145, 250) ;
  triangle(100, 90, 70, 180, 130, 180) ;
  println("chop");
  
  myState = 4 ;
  break ;
}
}



