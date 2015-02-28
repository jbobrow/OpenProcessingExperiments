
/* Tian Chen
   ITGM 315
   Assignment 4 Part 2
   Notes:  Code has been cleaned up by making sure the blocks have an organized way of using the brackets.
   The part of this assignment was to use arrays in order to call back variables without having to repeat them
   over and over again by typing them out.  The seals on this script have an array of different colors for the spots
   and horns even though the variable was only typed out once.  Only seals 1, 3, and 5 can move when selected upon mouse
   being pressed.  Seals 2 and 4 are stationary, but when a key is pressed, they will jiggle.  The background also moves
   according to the mouse position.
   */
   
   
// declaring an array defining class type
  Seal clone[];
  
  int NUM_CLONES = 5;
  int posX;
  int posY;

void setup(){
  size(800,800);         // size of the window
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  color body[];
  color horn[];
  body = new color[NUM_CLONES];
  horn = new color[NUM_CLONES];
  
  for ( int i=0; i<NUM_CLONES; i++ ) {
    float r = i*60;
    float g = i*10;
    float b = 255 - i*20;
    body[i] = color (r,g,b);
    horn[i] = color (r/2,g/2,b/2);
  }
  
  clone = new Seal[NUM_CLONES];
  
  for ( int i=0; i<NUM_CLONES; i++) {
    int x = 150 + i*100;
    int y = 350 + i*100;;
    clone[i] = new Seal("clone" +i, x, y , body[i], horn[i]);
  }
}
void draw (){ 
  
  background(mouseX/2, 0, mouseY/4); 
  smooth();
  float factor = constrain (mouseX/10,0,5);
  
  for ( int i=0; i<NUM_CLONES; i++) {
    clone[i].display();
    
    //  Only the 1st, 3rd, and 5th seals will jiggle when a key is pressed.
    if ( keyPressed ) {
      clone[0].jiggle(factor);
      clone[2].jiggle(factor);
      clone[4].jiggle(factor);
    }
    
    //  If a mouse is pressed, then the clone will be repositioned to new the mouse positions.
    if ( mousePressed && (mouseButton == LEFT) ) {
      clone[i].reposition(mouseX, mouseY);
    }
  }
}

//  During mouse being pressed, the seal will be selected depending on the bounding box placed under the class.
void mousePressed() {
  for (int i=0; i<NUM_CLONES; i++ ) {
    clone[1].select(mouseX,mouseY);
    clone[3].select(mouseX,mouseY);
  }
}

//  During mouse being released, the clone will be deselected and just stop where the mouse was released.
void mouseReleased(){
  for ( int i=0; i<NUM_CLONES; i++ ) {
    clone[1].deselect();
    clone[3].deselect();
  }
}


