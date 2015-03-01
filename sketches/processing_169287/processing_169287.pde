
/* @pjs preload="table.png" ; font = "coffeeShop.ttf" ; */

int myState = 0 ;
PImage table ;
PFont coffeeShop ;
int totalGameTime = 60*10 ; //CHANGE TO 30 WHEN DONE
int gameTime = totalGameTime ; 

void setup() {
  size(900, 481) ;
  table = loadImage("table.png") ;
  coffeeShop = createFont("coffeeShop.ttf", 40) ;
  bx = width/2.0;
  by = 427;
  rectMode(CORNER);
}


void draw() {

  background(0) ;

  switch(myState) {
  case 0:
    background(#E3D555) ;
    fill(255) ;
    textFont(coffeeShop, 40) ;
    textAlign(CENTER) ;
    text("Help Craig eat the healthy foods!", width/2, height/2) ;
    break ;

  case 1:
    background(#E1F077) ;
    fill(255) ;
    textSize(30) ;
    text("Click and drag the foods to feed Craig", width/2, height/2) ;
    break ;

  case 2:
    background(#77D169) ;
    fill(255) ;
    textSize(80) ;
    text("Ready? GO!", width/2, height/2) ;
    break ;

  case 3: //PUT THE GAME HERE
    image (table, 0, 0) ;
    checkPressed() ;
    gameTime-- ;
    if (gameTime <= 0) {
      myState = 4 ;
      gameTime = totalGameTime ;
    }
    fill(#74FF79) ;
    rect(30, 30, gameTime/2, 8) ;
    break ;

  case 4: //WANT TO PLAY AGAIN?
    background(#DE6060) ;
    fill(255) ;
    textSize(30) ;
    text("Want to play again?", width/2, height/2) ;
    break ;
  }
}

void mouseReleased() {
  if (myState != 3) {
    myState = myState + 1 ;
  }

  if (myState > 4) {
    myState = 2 ;
  }

  locked = false;
}

float bx;
float by;
int boxSize = 36;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void checkPressed() {

  // Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
    mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    /* if (!locked) { 
     stroke(255); 
     fill(153);
     } */
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }

  // Draw the box
  
  rect(bx, by, boxSize, boxSize);
}

void mousePressed() {
  if (overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by;
}

void mouseDragged() {
  if (locked) {
    bx = mouseX-xOffset; 
    // by = mouseY-yOffset;
  }
}




