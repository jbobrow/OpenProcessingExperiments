

class Squares {
 
 int posX;
 int posY;
 color myColor;
 boolean squareSelected;
 
 void init (int thisPosX, int thisPosY, color thisColor) {
  
  posX = thisPosX;
  posY = thisPosY;
  myColor = thisColor;
   
 }

 void select () {
  squareSelected = true;
   
 }
 
  void deselect () {
  squareSelected = false;
   
 }
 
  void update () {
  if (squareSelected == true){
    stroke (0);
    strokeWeight (5); 
  } else {
   noStroke(); 
  }
   
 }
 
 void drawSquare () {
  fill (myColor);
  rect ( posX, posY, 50, 50);
 }
 
 void mixColor () {
  
  myColor = (myColor + tempColor) / 2;
   
 }
 
}

