
//Xiongfei Zhang
//Program the ability to move an ellipse with the WASD keys 
//(W for up, S for Down, A for left, and D for Right). 
//Prevent any part of the ellipse from leaving the screen.  
//This is the basis for any game you'd care to write.

float xPos=250, yPos=250;

void setup() {
  size(500, 500);
  background(0);
  smooth();
}

void draw() {
  background(0);
  //println("Press WASD keys");
  pacMan();
  if (keyPressed) {
    if (key=='w'||key=='W') { 
      yPos--;
    } 
    else if (key=='d'||key=='D') {
      xPos++;
    } 
    else if (key=='s'||key=='S') { 
      yPos++;
    } 
    else if (key=='a'||key=='A') { 
      xPos--;
    }
    //movement
  }
  checkBoundary();
}

void pacMan() {
  if (key=='w'||key=='W') { 
    arc(xPos, yPos, 80, 80, -PI/4, 5*PI/4);
    //Up
  } 
  else if (key=='d'||key=='D') {
    arc(xPos, yPos, 80, 80, PI/4, 7*PI/4);
    //Right
  } 
  else if (key=='s'||key=='S') { 
    arc(xPos, yPos, 80, 80, -5*PI/4, PI/4);
    //Down
  } 
  else if (key=='a'||key=='A') { 
    arc(xPos, yPos, 80, 80, -3*PI/4, 3*PI/4);
    //Left
  }
}

void checkBoundary() {
  if (xPos<40) {
    xPos = 40;
  }
  if (yPos<40) {
    yPos = 40;
  }
  if (xPos>width-40) {
    xPos = width-40;
  }
  if (yPos>height-40) {
    yPos = height-40;
  }
  //check boundary
}

