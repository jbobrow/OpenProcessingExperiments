
/* Tian Chen
   ITGM 315
   Assignment 3 Part 2
   Notes:  Cleaning up the code by creating functions within the void draw
   command, so each of the different parts that make up Archer will be drawn
   individually.  Archer is made up of 4 parts: Legs, Arms, Body, and the Head.
   */
   
   
// Variable defining class type
  Seal archer;
  Seal lana;
  Seal pam;
  Seal cyril;

// Change in coat color of the body
  color L =  240;
  color M  = 180;
  color MD = 60;
  color D  = 30;


// Archer's position
  float pX, pY;
  float mX, mY;
  int stillX = 400;
  int stillY = 400;

void setup(){
  size(800,800);         // size of the window
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  archer = new Seal( "archer", stillX/2, 400,  L);
  lana   = new Seal("lana",    300, 400,  M);
  pam    = new Seal("pam",     stillX*1.5, 400,  MD);
  cyril  = new Seal("cyril",   500, 400,  D);
}

void draw (){ 
  background(mouseX/2, 0, mouseY/4); 
  smooth();
  float factor = constrain (mouseX/10,0,5);
  
  if ( mousePressed && ( mouseButton ==LEFT) ) {
    lana.reposition ( mouseX, mouseY);
    cyril.reposition ( mouseX, mouseY);
  }
  if ( keyPressed ) {
    pam.jiggle (factor);     
  } 

    lana.move();
    cyril.move();
    
    archer.display();
            archer.jiggle (factor);

    lana.display();

    pam.display();
   
    cyril.display();
    
    mX = mouseX;
    mY = mouseY;
    pX = pmouseX;
    pY = pmouseY; 
}

void mousePressed() {  
    archer.select ( mouseX, mouseY ); // Archer is not moving
    lana.select ( mouseX, mouseY );

    pam.select ( mouseX, mouseY);    // Pam is not moving
    cyril.select ( mouseX, mouseY );
}

void mouseReleased() {
  float vX = mX-pX;
  float vY = mY-pY;
  
  archer.deselect ( vX, vY);
  lana.deselect ( vX, vY);
  pam.deselect (vX, vY);
  cyril.deselect (vX, vY);
}



