
int[] xPos = {10, 55, 93};
int[] yPos = {73, 81, 10};
  
  
void setup () {
  for (int i=0; i<3; i++) {
  ellipse (xPos[i], 10, 5, 5);
  }
}

void draw () {
  
  background(255);
  /*below; xPos.length gives us = */
  for (int i=0; i<xPos.length; i++) {
  ellipse (xPos[i], yPos[i], 5, 5);
  }
   
}

void mousePressed () {
   xPos = append(xPos, mouseX);
   yPos = append(yPos, mouseY) ;
   println(xPos); 
   /*each time it comes round it draws back ground draws circles then repeats
   ALSO each time the mouse is pressed then there is a new value added onto 
   the array*/
  
}

