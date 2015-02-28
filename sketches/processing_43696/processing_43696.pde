
//-------CONTROLLS-------

//ships specs
int shipSize=10; //wich is the scalarFactor of the ship
int shipReds=255, shipGreens=100, shipBlues=0;
int rotateSpeed=100; //smaller numbers, increases speed (b/c it is fractions of a circle)
float linearSpeed=2; // x and y speed control


int keyStorMode=0;
int globalCounter=1;
float rotateVar=0;
float shipX=800/2;
float shipY=800/2;

void setup(){
  background(255,255,255);
  size(800,800);
  
  /* //Getting the project to work <3
  pushMatrix();
    translate(width/2, height/2);
    int setupgrow=0;
    fill(0,0,0);
    beginShape();
      vertex(0, -1.5*setupgrow);//front tip (starting clockwise)
      vertex(1.5*setupgrow, 0.25*setupgrow);//top left square pt
      vertex(6*setupgrow, -0.5*setupgrow);//wing tip
      vertex(1.0*setupgrow, 2*setupgrow);
      vertex(-1.0*setupgrow, 2*setupgrow);
      vertex(-6*setupgrow, -0.5*setupgrow);//wing tip
      vertex(-1.5*setupgrow, 0.25*setupgrow);//top right square pt
      vertex(0, -1.5*setupgrow);//to close the ship
    endShape();
  popMatrix();
  fill(0,0,255);
  */
}

void draw(){
  /*
  if(keyStorMode==91){
    //pushMatrix();
      fill(0);
      rect(0,0,100,100);
      noFill();
      if(globalCounter==10){
        ship(100,255,100,0);
        println("void draw print ship");
        globalCounter=0;
      }
    //popMatrix();
  }
  */
  /*
  if(keyStorMode==49 || keyStorMode==97){//number 1 key
    globalCounter=1;
    println("globalCounter: " +globalCounter);
  }  
  if(keyStorMode==48 || keyStorMode==96){//zero key
    globalCounter=0;
    println("globalCounter: " +globalCounter);
  }*/
  
  if(keyStorMode==91 && keyStorMode==87){ // [ & W  key
    fill(0);
    rect(0,0,50,50);
    pushMatrix();
    translate(shipX,shipY-linearSpeed);
    rotate(rotateVar-PI/rotateSpeed);
    ship(shipSize, shipReds, shipGreens, shipBlues);
    popMatrix();
    shipY=shipY-linearSpeed;
    rotateVar=rotateVar-PI/rotateSpeed;
  }
  
  switch(keyStorMode){
    case 49:
      globalCounter=1;
      //println("globalCounter: " +globalCounter);
      break;
    case 48:
      globalCounter=0;
      //println("globalCounter: " +globalCounter);
      break;
      
    /*  
    case 91 && 87: // [ & W  key
      pushMatrix();
      translate(shipX,shipY-linearSpeed);
      rotate(rotateVar-PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipY=shipY-linearSpeed;
      rotateVar=rotateVar-PI/rotateSpeed;
      break;  
    case 91 && 65: // [ & A key
      pushMatrix();
      translate(shipX-linearSpeed,shipY);
      rotate(rotateVar-PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipX=shipX-linearSpeed;
      rotateVar=rotateVar-PI/rotateSpeed;
      break;
    case 91 && 83: // [ & S key
      pushMatrix();
      translate(shipX,shipY+linearSpeed);
      rotate(rotateVar-PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipY=shipY+linearSpeed;
      rotateVar=rotateVar-PI/rotateSpeed;
      break;
    case 91 && 68: // [ & D key
      pushMatrix();
      translate(shipX+linearSpeed,shipY);
      rotate(rotateVar-PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipX=shipX+linearSpeed;
      rotateVar=rotateVar-PI/rotateSpeed;
      break;
      
    case 93 && 87: // ] & W  key
      pushMatrix();
      translate(shipX,shipY-linearSpeed);
      rotate(rotateVar+PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipY=shipY-linearSpeed;
      rotateVar=rotateVar+PI/rotateSpeed;
      break;
    case 93 && 65: // ] & A key
      pushMatrix();
      translate(shipX-linearSpeed,shipY);
      rotate(rotateVar+PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipX=shipX-linearSpeed;
      rotateVar=rotateVar+PI/rotateSpeed;
      break;
    case 93 && 83: // ] & S key
      pushMatrix();
      translate(shipX,shipY+linearSpeed);
      rotate(rotateVar+PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipY=shipY+linearSpeed;
      rotateVar=rotateVar+PI/rotateSpeed;
      break;
    case 93 && 68: // ] & D key
      pushMatrix();
      translate(shipX+linearSpeed,shipY);
      rotate(rotateVar+PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipX=shipX+linearSpeed;
      rotateVar=rotateVar+PI/rotateSpeed;
      break;
    */
    //------------------------------------------------------------------------
    case 81: //Q key
      pushMatrix();
      translate(shipX,shipY);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      break;
    
    //ROTATE CASES
    case 91: // LEFT bracket key
      /*case 87:
        pushMatrix();
        translate(shipX,shipY-linearSpeed);
        rotate(rotateVar-PI/rotateSpeed);
        ship(shipSize, shipReds, shipGreens, shipBlues);
        popMatrix();
        shipY=shipY-linearSpeed;
        rotateVar=rotateVar-PI/rotateSpeed;
        break;
        */
      pushMatrix();
      translate(shipX,shipY);
      rotate(rotateVar-PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      rotateVar=rotateVar-PI/rotateSpeed;
      break;
      
    case 93: // RIGHT bracket key
      pushMatrix();
      translate(shipX,shipY);
      rotate(rotateVar+PI/rotateSpeed);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      rotateVar=rotateVar+PI/rotateSpeed;
      break;
    
    // W A S D  keys
    case 87: // W key
      pushMatrix();
      translate(shipX,shipY-linearSpeed);
      rotate(rotateVar);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipY=shipY-linearSpeed;
      break;
    case 65: // A key
      pushMatrix();
      translate(shipX-linearSpeed,shipY);
      rotate(rotateVar);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipX=shipX-linearSpeed;
      break;
    case 83: // S key
      pushMatrix();
      translate(shipX,shipY+linearSpeed);
      rotate(rotateVar);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipY=shipY+linearSpeed;
      break;
    case 68: // D key
      pushMatrix();
      translate(shipX+linearSpeed,shipY);
      rotate(rotateVar);
      ship(shipSize, shipReds, shipGreens, shipBlues);
      popMatrix();
      shipX=shipX+linearSpeed;
      break;
  }
  /*
  switch(keyStorMode) {
    case 49: //could be written with "if keyStorMode=49, then..."
      ellipse(100,100,100,100);
      break; //to exit this case
    case 50:
      rect(100,100,10,10);
      break;
    case 48: //0 key
      background (50);
      break;
  }
  */
}

void ship(float scalarFactor, int reds, int greens, int blues){
  if(globalCounter==1){
  
  float grow=scalarFactor/2;
  
  noStroke();
  fill(255,255,255);
  rect(-8*grow,-2*grow,8*2*grow,2.2*2*grow);
  
  fill(reds, greens, blues);
  beginShape();
      vertex(0, -1.5*grow);//front tip (starting clockwise)
      vertex(1.5*grow, 0.25*grow);//top left square pt
      vertex(6*grow, -0.5*grow);//wing tip
      vertex(1.0*grow, 2*grow);
      vertex(-1.0*grow, 2*grow);
      vertex(-6*grow, -0.5*grow);//wing tip
      vertex(-1.5*grow, 0.25*grow);//top right square pt
      vertex(0, -1.5*grow);//to close the ship
  endShape();
  noFill();
  }//to close the if
}

void keyPressed(){
  keyStorMode = keyCode; //says mode will equal the keyCodes of each key (as in a value)
  println(keyStorMode);//to show what keys are being pressed
  println("counter: " +globalCounter);
} 

/*
Poached coded:

The building block and structure for sensing keyboard input is
appropriated by Nick Lally.

*/





//end of document

